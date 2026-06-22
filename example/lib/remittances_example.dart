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

/// Standalone CLI Example: Remittances
///
/// Demonstrates how to use the high-level `MomoCollections` wrapper to:
/// 1. Retrieve the remittances account balance.
/// 2. Validate payee wallet status (is recipient active).
/// 3. Initiate a standard remittance transfer.
/// 4. Poll transfer status until a terminal state is reached.
/// 5. Initiate a cross-border cash transfer with full payer identity details.
/// 6. Poll cash transfer status until a terminal state is reached.
///
/// Sandbox Use Cases (from https://momodeveloper.mtn.com/api-documentation/testing):
///   - Any valid MSISDN not in the special-case list → SUCCESSFUL
///   - MSISDN 46733123450 → TransferPayeeFailed / AccountHolderActiveMsisdnNotFound
///   - MSISDN 46733123451 → TransferPayeeRejected
///   - MSISDN 46733123455 → TransferPayeeNotEnoughFunds
///   - MSISDN 46733123457 → TransferPayeeNotFound
///   - CashTransfer amount '1000' → SUCCESSFUL
///   - CashTransfer amount '2000' → FAILED (CashTransferTransactionFailed)
///
/// Run this example using:
/// `dart example/lib/remittances_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Remittances Workflow Example');
  print('==================================================');

  // --- Configuration ---
  final env = _loadEnv();
  final subscriptionKey =
      Platform.environment['MTN_MOMO_REM_SUBSCRIPTION_KEY'] ??
          Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
          env['REMITTANCES_KEY'] ??
          '';

  var userId = Platform.environment['MTN_MOMO_REM_USER_ID'] ??
      Platform.environment['MTN_MOMO_USER_ID'] ??
      env['REMITTANCES_USER_ID'] ??
      '';
  var apiKey = Platform.environment['MTN_MOMO_REM_API_KEY'] ??
      Platform.environment['MTN_MOMO_API_KEY'] ??
      env['REMITTANCES_API_KEY'] ??
      '';

  if (subscriptionKey.isEmpty) {
    _logger.w(
      'Required credentials (Subscription Key) are missing!\n'
      'Please obtain your Remittances Subscription Key from your Profile on the MTN MoMo Developer portal (https://momodeveloper.mtn.com/)\n'
      'and export it as an environment variable (MTN_MOMO_REM_SUBSCRIPTION_KEY) or define it in a .env file as REMITTANCES_KEY.',
    );
    return;
  }

  // Dynamically provision a temporary Sandbox User & Key if not provided
  if (userId.isEmpty || apiKey.isEmpty) {
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
  // Important: Use a dedicated MomoCollections instance for Remittances!
  // Sharing an instance across products causes token cache collisions.
  final momo = MomoCollections(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  try {
    // 1. Check Remittances Account Balance
    _logger.i('1. Checking Remittances account balance...');
    try {
      final balance = await momo.remittance.getAccountBalance();
      _logger.i('   Balance: ${balance.availableBalance} ${balance.currency}');
    } on MtnMomoException catch (e) {
      if (e is MtnMomoTransactionException ||
          e is MtnMomoServerException ||
          e is MtnMomoForbiddenException) {
        _logger.w(
          '   Note: Remittances balance endpoint returned a gateway error (expected volatile sandbox behavior): $e',
        );
      } else {
        rethrow;
      }
    }

    // 2. Validate Recipient Phone Number
    // Any MSISDN not in the special-case list results in Success (sandbox)
    const payeeMsisdn = '256772987654';
    _logger.i('2. Checking if payee wallet status is active ($payeeMsisdn)...');
    await momo.remittance.validateAccountHolderStatus(
      accountHolderId: payeeMsisdn,
      accountHolderIdType: 'msisdn',
    );
    _logger.i('   ✓ Payee wallet verified and active.');

    // 3. Initiate Remittance Transfer
    // Sandbox: amount 1000 EUR → SUCCESSFUL
    final transferReferenceId = const Uuid().v4();
    _logger.i(
        '3. Creating Remittance Transfer ($transferReferenceId) for 1,000 EUR to recipient...');

    final transferBody = Transfer(
      amount: '1000',
      currency: 'EUR', // Sandbox requires EUR
      externalId: 'REM_TXN_${DateTime.now().millisecondsSinceEpoch}',
      payee: const Party(
        partyIdType: PartyPartyIdType.msisdn,
        partyId: payeeMsisdn,
      ),
      payerMessage: 'Family support transfer',
      payeeNote: 'Remittance received',
    );

    await momo.remittance.transfer(
      xReferenceId: transferReferenceId,
      body: transferBody,
    );
    _logger.i('   ✓ Remittance transfer initiated successfully.');

    // 4. Poll Transfer Status
    _logger.i('4. Polling remittance transfer status...');
    TransferResult? transferStatus;
    for (int attempts = 1; attempts <= 10; attempts++) {
      _logger.i('   Checking status (attempt $attempts/10)...');
      transferStatus = await momo.remittance.getTransferStatus(
        referenceId: transferReferenceId,
      );

      final state = transferStatus.status;
      _logger.i('   Current Status: $state');

      if (state == TransferResultStatus.successful) {
        _logger.i('   ✓ Transfer completed SUCCESSFULLY!');
        break;
      } else if (state == TransferResultStatus.failed) {
        _logger.e('   ✗ Transfer FAILED.');
        if (transferStatus.reason != null) {
          _logger.e('     Failure Reason: ${transferStatus.reason?.code}');
        }
        break;
      }

      await Future.delayed(const Duration(seconds: 3));
    }

    // 5. Initiate Cross-Border Cash Transfer
    // Sandbox: amount 1000 EUR → SUCCESSFUL
    final cashReferenceId = const Uuid().v4();
    _logger.i(
        '5. Creating Cross-Border Cash Transfer ($cashReferenceId) with payer identity...');

    final cashTransferBody = CashTransfer(
      amount: '1000',
      currency: 'EUR',
      externalId: 'CASH_TXN_${DateTime.now().millisecondsSinceEpoch}',
      payee: const Party(
        partyIdType: PartyPartyIdType.msisdn,
        partyId: payeeMsisdn,
      ),
      // Cross-border payer identity information
      orginatingCountry: 'SE',
      originalAmount: '10000',
      originalCurrency: 'SEK',
      payerMessage: 'Cross-border remittance from Sweden',
      payeeNote: 'Cash transfer received',
      payerIdentificationType: CashTransferPayerIdentificationType.pass,
      payerIdentificationNumber: 'AB123456',
      payerFirstName: 'Erik',
      payerSurName: 'Andersson',
      payerLanguageCode: 'sv',
      payerEmail: 'erik.andersson@example.se',
      payerMsisdn: '46701234567',
      payerGender: 'M',
    );

    await momo.remittance.cashTransfer(
      xReferenceId: cashReferenceId,
      body: cashTransferBody,
    );
    _logger.i('   ✓ Cash transfer initiated successfully.');

    // 6. Poll Cash Transfer Status
    _logger.i('6. Polling cash transfer status...');
    CashTransferResult? cashStatus;
    for (int attempts = 1; attempts <= 10; attempts++) {
      _logger.i('   Checking status (attempt $attempts/10)...');
      cashStatus = await momo.remittance.getCashTransferStatus(
        referenceId: cashReferenceId,
      );

      final state = cashStatus.status;
      _logger.i('   Current Status: $state');

      if (state == 'SUCCESSFUL') {
        _logger.i('   ✓ Cash transfer completed SUCCESSFULLY!');
        break;
      } else if (state == 'FAILED') {
        _logger.e('   ✗ Cash transfer FAILED.');
        if (cashStatus.reason != null) {
          _logger.e('     Failure Reason: ${cashStatus.reason}');
        }
        break;
      }

      await Future.delayed(const Duration(seconds: 3));
    }
  } on MtnMomoException catch (e) {
    _logger.e('MTN MoMo Error occurred: ${e.message}');
  } catch (e) {
    _logger.e('An unexpected error occurred: $e');
  }
}
