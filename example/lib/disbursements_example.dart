// ignore_for_file: avoid_print
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';
import 'package:uuid/uuid.dart';

final _logger = Logger(
  filter: ProductionFilter(),
  printer: SimplePrinter(colors: true),
);

Map<String, String> _loadEnv() {
  final file = File('.env');
  if (!file.existsSync()) {
    return {};
  }
  final lines = file.readAsLinesSync();
  final env = <String, String>{};
  for (final line in lines) {
    if (line.trim().isEmpty || line.trim().startsWith('#')) continue;
    final parts = line.split('=');
    if (parts.length >= 2) {
      final key = parts[0].trim();
      var val = parts.sublist(1).join('=').trim();
      if (val.startsWith('"') && val.endsWith('"')) {
        val = val.substring(1, val.length - 1);
      } else if (val.startsWith("'") && val.endsWith("'")) {
        val = val.substring(1, val.length - 1);
      }
      env[key] = val;
    }
  }
  return env;
}

/// Standalone CLI Example: Disbursements
///
/// Demonstrates how to use the high-level `MtnMomo` wrapper to:
/// 1. Retrieve merchant disbursements account balance.
/// 2. Validate payee wallet status (is recipient active).
/// 3. Trigger a disbursement transfer to a recipient's mobile wallet.
/// 4. Poll transfer status until a terminal state is reached.
///
/// Run this example using:
/// `dart example/disbursements_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Disbursements Workflow Example');
  print('==================================================');

  // --- Configuration ---
  final env = _loadEnv();
  final subscriptionKey = Platform
          .environment['MTN_MOMO_DISB_SUBSCRIPTION_KEY'] ??
      Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
      env['DISBURSMENTS_KEY'] ??
      'bbc813d659cf48fe8bf5b5043938ad85'; // This is an example key, replace it with your own!

  var userId = Platform.environment['MTN_MOMO_DISB_USER_ID'] ??
      Platform.environment['MTN_MOMO_USER_ID'] ??
      env['DISBURSMENTS_USER_ID'] ??
      '';
  var apiKey = Platform.environment['MTN_MOMO_DISB_API_KEY'] ??
      Platform.environment['MTN_MOMO_API_KEY'] ??
      env['DISBURSMENTS_API_KEY'] ??
      '';

  if (subscriptionKey == 'YOUR_SUBSCRIPTION_KEY' || subscriptionKey.isEmpty) {
    _logger.w(
      'Required credentials (Subscription Key) are missing!\n'
      'Please obtain your Subscription Key from your Profile on the MTN MoMo Developer portal (https://momodeveloper.mtn.com/)\n'
      'and export it as an environment variable (MTN_MOMO_DISB_SUBSCRIPTION_KEY) or define it in a .env file as DISBURSMENTS_KEY.',
    );
    return;
  }

  // Dynamically provision a temporary Sandbox User & Key if not provided or placeholder
  if (userId.isEmpty ||
      apiKey.isEmpty ||
      userId == 'a5db8b08-3067-4221-a3f2-ef971e467d5c') {
    _logger.i(
        'Sandbox User ID or API Key not provided. Provisioning sandbox credentials dynamically...');
    try {
      const sandboxBaseUrl = 'https://sandbox.momodeveloper.mtn.com';
      final dio = Dio(
        BaseOptions(
          baseUrl: sandboxBaseUrl,
          headers: {
            'Ocp-Apim-Subscription-Key': subscriptionKey,
            'Content-Type': 'application/json',
          },
        ),
      );
      // Register serializer interceptor to handle WAF payload requirements
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.data != null &&
              options.data is! Map &&
              options.data is! List &&
              options.data is! String &&
              options.data is! FormData) {
            try {
              options.data = (options.data as dynamic).toMap();
            } catch (_) {
              try {
                options.data = (options.data as dynamic).toJson();
              } catch (_) {}
            }
          }
          return handler.next(options);
        },
      ));

      final sandboxClient = SandboxProvisioningClient(dio);
      final generatedUserId = const Uuid().v4();

      _logger.i('1. Registering Sandbox API User (ID: $generatedUserId)...');
      await sandboxClient.postV10Apiuser(
        xReferenceId: generatedUserId,
        body: const ApiUser(providerCallbackHost: 'callbacks.example.com'),
      );

      _logger.i('2. Waiting for sandbox propagation (2s)...');
      await Future.delayed(const Duration(seconds: 2));

      _logger.i('3. Requesting API Key...');
      final response = await sandboxClient.postV10ApiuserApikey(
          xReferenceId: generatedUserId);
      final generatedApiKey = response.apiKey;

      if (generatedApiKey == null || generatedApiKey.isEmpty) {
        throw Exception('Gateway returned empty API key.');
      }

      userId = generatedUserId;
      apiKey = generatedApiKey;
      _logger.i('✓ Provisioned Sandbox API User: $userId');
      _logger.i('✓ Provisioned Sandbox API Key : $apiKey');
    } catch (e) {
      _logger.e('Failed to provision sandbox credentials: $e');
      return;
    }
  }

  // --- Initialization ---
  final momo = MtnMomo(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  try {
    // 1. Check Disbursements Account Balance
    _logger.i('1. Checking merchant Disbursements account balance...');
    try {
      final balance = await momo.disbursements.getAccountBalance();
      _logger.i('   Balance: ${balance.availableBalance} ${balance.currency}');
    } on MtnMomoException catch (e) {
      if (e is MtnMomoTransactionException ||
          e is MtnMomoServerException ||
          e is MtnMomoForbiddenException) {
        _logger.w(
          '   Note: Disbursements balance endpoint returned a gateway error (expected volatile sandbox behavior): $e',
        );
      } else {
        rethrow;
      }
    }

    // 2. Validate Recipient Phone Number (Payee active check)
    const payeeMsisdn = '256772987654';
    _logger.i('2. Checking if payee wallet status is active ($payeeMsisdn)...');
    await momo.disbursements.validateAccountHolderStatus(
      accountHolderId: payeeMsisdn,
      accountHolderIdType: 'msisdn',
    );
    _logger.i('   ✓ Payee wallet verified and active.');

    // 3. Initiate Transfer (Disburse Funds)
    final referenceId = const Uuid().v4();
    _logger.i(
        '3. Creating Transfer ($referenceId) for 12,000 UGX to recipient...');

    final transferBody = Transfer(
      amount: '12000',
      currency: 'EUR', // Sandbox supports specific currencies like EUR
      externalId: 'PAYOUT_SAL_554',
      payee: const Party(
        partyIdType: PartyPartyIdType.msisdn,
        partyId: payeeMsisdn,
      ),
      payerMessage: 'Salary Payout March',
      payeeNote: 'Salary processed successfully',
    );

    // X-Reference-Id and Authorization are injected automatically by the MomoInterceptor!
    await momo.disbursements.transfer(
      xReferenceId: referenceId,
      body: transferBody,
    );
    _logger.i('   ✓ Transfer initiated successfully on the gateway.');

    // 4. Poll Transfer Status
    _logger.i('4. Polling transfer status...');
    TransferResult? status;
    var attempts = 0;

    while (attempts < 10) {
      attempts++;
      _logger.i('   Checking transfer status (attempt $attempts/10)...');
      status = await momo.disbursements.getTransferStatus(
        referenceId: referenceId,
      );

      final state = status.status;
      _logger.i('   Current Status: $state');

      if (state == TransferResultStatus.successful) {
        _logger.i('   ✓ Transfer completed SUCCESSFUL!');
        break;
      } else if (state == TransferResultStatus.failed) {
        _logger.e('   ✗ Transfer FAILED.');
        if (status.reason != null) {
          _logger.e('     Failure Reason Code: ${status.reason?.code}');
        }
        break;
      }

      // Wait 3 seconds before next poll
      await Future.delayed(const Duration(seconds: 3));
    }
  } on MtnMomoException catch (e) {
    _logger.e('MTN MoMo Error occurred: ${e.message}');
  } catch (e) {
    _logger.e('An unexpected error occurred: $e');
  }
}
