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

/// Standalone CLI Example: Resilient Error Handling
///
/// Demonstrates how the SDK translates flat Dio errors and status codes
/// into a rich, structured `MtnMomoException` hierarchy.
///
/// Run this example using:
/// `dart example/resilient_error_handling_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Resilient Error Handling Example');
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

  // Provision sandbox credentials dynamically if missing
  if (userId.isEmpty ||
      apiKey.isEmpty ||
      userId == 'a5db8b08-3067-4221-a3f2-ef971e467d5c') {
    _logger.i(
        'Sandbox credentials not provided. Provisioning dynamically first...');
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

      await sandboxClient.postV10Apiuser(
        xReferenceId: generatedUserId,
        body: const ApiUser(providerCallbackHost: 'callbacks.example.com'),
      );
      await Future.delayed(const Duration(seconds: 2));
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

  // Initialize client with valid credentials
  final momo = MtnMomo(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  // ----------------------------------------------------
  // Scenario 1: Trigger HTTP 404 Not Found
  // ----------------------------------------------------
  _logger.i('\n--- Scenario 1: Triggering HTTP 404 (Resource Not Found) ---');
  _logger.i('Validating inactive account holder status (46733123450)...');
  try {
    await momo.collection.validateAccountHolderStatus(
      accountHolderId: '46733123450', // Predefined Inactive number
      accountHolderIdType: 'msisdn',
    );
  } on MtnMomoNotFoundException catch (e) {
    _logger.w('✓ Caught expected MtnMomoNotFoundException (HTTP 404)!');
    _logger.w('  Error Message: ${e.message}');
  } catch (e) {
    _logger.e('  Unexpected error caught: $e');
  }

  // ----------------------------------------------------
  // Scenario 2: Trigger HTTP 409 Conflict
  // ----------------------------------------------------
  _logger
      .i('\n--- Scenario 2: Triggering HTTP 409 (Conflict/Duplicate ID) ---');
  final duplicateRefId = const Uuid().v4();
  _logger.i(
      'Sending initial Request to Pay with Reference ID: $duplicateRefId...');
  try {
    final request = RequestToPay(
      amount: '5000',
      currency: 'EUR',
      externalId: 'TXN_REF_ERR_1',
      payer: const Party(
        partyIdType: PartyPartyIdType.msisdn,
        partyId: '256772123456',
      ),
      payerMessage: 'First request',
      payeeNote: 'Resilient tests',
    );

    // This first call succeeds
    await momo.collection.requesttoPay(
      xReferenceId: duplicateRefId,
      body: request,
    );
    _logger.i(
        '  First request accepted. Sending duplicate request with identical Reference ID...');

    // This second call should fail with 409 Conflict
    await momo.collection.requesttoPay(
      xReferenceId: duplicateRefId,
      body: request,
    );
  } on MtnMomoConflictException catch (e) {
    _logger.w('✓ Caught expected MtnMomoConflictException (HTTP 409)!');
    _logger.w('  Error Message: ${e.message}');
  } catch (e) {
    _logger.e('  Unexpected error caught: $e');
  }

  // ----------------------------------------------------
  // Scenario 3: Trigger Business Logic Exception
  // ----------------------------------------------------
  _logger.i('\n--- Scenario 3: Triggering Business Logic Error (HTTP 400) ---');
  _logger.i(
      'Sending Request to Pay using unsupported currency USD to trigger error...');
  try {
    await momo.collection.requesttoPay(
      xReferenceId: const Uuid().v4(),
      body: RequestToPay(
        amount: '1000',
        currency: 'USD', // Unsupported currency
        externalId: 'TXN_REF_ERR_2',
        payer: const Party(
          partyIdType: PartyPartyIdType.msisdn,
          partyId: '256772123456',
        ),
        payerMessage: 'Business error test',
        payeeNote: 'Resilient tests',
      ),
    );
  } on MtnMomoTransactionException catch (e) {
    _logger.w('✓ Caught expected MtnMomoTransactionException!');
    _logger.w('  Error Code : ${e.errorCode.code}');
    _logger.w('  Description: ${e.errorCode.description}');
    _logger.w('  Message    : ${e.message}');
  } catch (e) {
    _logger.e('  Unexpected error caught: $e');
  }

  print('\n==================================================');
  print('          ERROR HANDLING ENDED');
  print('==================================================\n');
}
