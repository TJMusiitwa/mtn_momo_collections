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

/// Standalone CLI Example: Collections
///
/// Demonstrates how to use the high-level `MtnMomo` wrapper to:
/// 1. Retrieve account balance.
/// 2. Validate customer account holder status (is registered and active).
/// 3. Dispatch a Request to Pay (Push USSD) transaction.
/// 4. Poll transaction status until a terminal state is reached.
///
/// Run this example using:
/// `dart example/collections_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Collections Workflow Example');
  print('==================================================');

  // --- Configuration ---
  final env = _loadEnv();
  final subscriptionKey = Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
      env['COLLECTIONS_KEY'] ??
      'a9acc520ea7d487baa58af01167d5659'; // This is an example key, replace it with your own!

  var userId = Platform.environment['MTN_MOMO_USER_ID'] ??
      env['COLLECTIONS_USER_ID'] ??
      '';
  var apiKey = Platform.environment['MTN_MOMO_API_KEY'] ??
      env['COLLECTIONS_API_KEY'] ??
      '';

  if (subscriptionKey == 'YOUR_SUBSCRIPTION_KEY' || subscriptionKey.isEmpty) {
    _logger.w(
      'Required credentials (Subscription Key) are missing!\n'
      'Please obtain your Subscription Key from your Profile on the MTN MoMo Developer portal (https://momodeveloper.mtn.com/)\n'
      'and export it as an environment variable (MTN_MOMO_SUBSCRIPTION_KEY) or define it in a .env file as COLLECTIONS_KEY.',
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
    // 1. Check Account Balance
    _logger.i('1. Checking merchant Collections balance...');
    try {
      final balance = await momo.collection.getAccountBalance();
      _logger.i('   Balance: ${balance.availableBalance} ${balance.currency}');
    } on MtnMomoException catch (e) {
      if (e is MtnMomoTransactionException ||
          e is MtnMomoServerException ||
          e is MtnMomoForbiddenException) {
        _logger.w(
          '   Note: Collections balance endpoint returned a gateway error (expected volatile sandbox behavior): $e',
        );
      } else {
        rethrow;
      }
    }

    // 2. Validate Customer Phone Number (MSISDN)
    const customerMsisdn = '256772123456';
    _logger.i(
        '2. Checking if customer wallet status is active ($customerMsisdn)...');
    await momo.collection.validateAccountHolderStatus(
      accountHolderId: customerMsisdn,
      accountHolderIdType: 'msisdn',
    );
    _logger.i('   ✓ Customer wallet verified and active.');

    // 3. Initiate Request to Pay (Push USSD Prompt)
    final referenceId = const Uuid().v4();
    _logger.i('3. Creating Request to Pay ($referenceId) for 5,000 UGX...');

    final request = RequestToPay(
      amount: '5000',
      currency: 'EUR', // Sandbox supports specific currencies like EUR
      externalId: 'TXN_REF_009988',
      payer: const Party(
        partyIdType: PartyPartyIdType.msisdn,
        partyId: customerMsisdn,
      ),
      payerMessage: 'Premium App subscription',
      payeeNote: 'Antigravity Collections',
    );

    // X-Reference-Id and Authorization are injected automatically by the MomoInterceptor!
    await momo.collection.requesttoPay(
      xReferenceId: referenceId,
      body: request,
    );
    _logger.i('   ✓ Request to pay sent to customer handset successfully.');

    // 4. Poll for Transaction Status
    _logger.i('4. Polling transaction status...');
    RequestToPayResult? status;
    var attempts = 0;

    while (attempts < 10) {
      attempts++;
      _logger.i('   Checking status (attempt $attempts/10)...');
      status = await momo.collection.requesttoPayTransactionStatus(
        referenceId: referenceId,
      );

      final state = status.status;
      _logger.i('   Current Status: $state');

      if (state == RequestToPayResultStatus.successful) {
        _logger.i('   ✓ Transaction Completed SUCCESSFUL!');
        break;
      } else if (state == RequestToPayResultStatus.failed) {
        _logger.e('   ✗ Transaction FAILED.');
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
