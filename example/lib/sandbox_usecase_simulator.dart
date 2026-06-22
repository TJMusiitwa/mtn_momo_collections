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

/// Standalone CLI Example: Sandbox Use Cases Simulator
///
/// Demonstrates how to trigger and catch specific Sandbox scenarios
/// using MTN MoMo predefined test numbers (MSISDNs).
///
/// Run this example using:
/// `dart example/lib/sandbox_usecase_simulator.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Sandbox Use Cases Simulator');
  print('==================================================');

  final env = _loadEnv();
  final subscriptionKey = Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
      env['COLLECTIONS_KEY'] ??
      'a9acc520ea7d487baa58af01167d5659';

  var userId = Platform.environment['MTN_MOMO_USER_ID'] ??
      env['COLLECTIONS_USER_ID'] ??
      '';
  var apiKey = Platform.environment['MTN_MOMO_API_KEY'] ??
      env['COLLECTIONS_API_KEY'] ??
      '';

  if (subscriptionKey == 'YOUR_SUBSCRIPTION_KEY' || subscriptionKey.isEmpty) {
    _logger.w(
      'Required credentials (Subscription Key) are missing!\n'
      'Please define COLLECTIONS_KEY in your .env file or set MTN_MOMO_SUBSCRIPTION_KEY in your environment.',
    );
    return;
  }

  // Provision credentials dynamically if missing
  if (userId.isEmpty || apiKey.isEmpty) {
    _logger.i('Provisioning sandbox credentials dynamically...');
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

  final momo = MtnMomo(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  // 1. Success Case
  await _simulateCollect(
      momo, '256772123456', 'Success Case (Standard MSISDN)');

  // 2. Account Not Found
  await _simulateValidation(momo, '46733123450', 'Account Holder Not Found');

  // 3. Account Holder Inactive (Expired)
  await _simulateCollect(
      momo, '46733123451', 'Account Holder Not Active (Expired Status)');

  // 4. Operation Not Allowed
  await _simulateValidation(momo, '46733123452', 'Operation Not Allowed');

  // 5. Target Environment Forbidden
  await _simulateCollect(momo, '46733123453', 'Target Environment Forbidden');

  // 6. Internal Processing Error
  await _simulateCollect(
      momo, '46733123454', 'Internal Processing Error Status');
}

Future<void> _simulateValidation(
    MtnMomo momo, String msisdn, String label) async {
  _logger.i(
      '\n--- Running Account Validation Simulation: $label (MSISDN: $msisdn) ---');
  try {
    await momo.collection.validateAccountHolderStatus(
      accountHolderId: msisdn,
      accountHolderIdType: 'msisdn',
    );
    _logger.i(
        '✓ Account holder validation completed successfully (Account is Active).');
  } on MtnMomoException catch (e) {
    _logger.w('✓ Caught expected MtnMomoException:');
    _logger.w('  Type   : ${e.runtimeType}');
    _logger.w('  Message: ${e.message}');
  }
}

Future<void> _simulateCollect(
    MtnMomo momo, String msisdn, String label) async {
  _logger
      .i('\n--- Running Collection Simulation: $label (MSISDN: $msisdn) ---');
  final referenceId = const Uuid().v4();

  try {
    await momo.collection.requesttoPay(
      xReferenceId: referenceId,
      body: RequestToPay(
        amount: '1000',
        currency: 'EUR',
        externalId: 'TXN_SIM_${referenceId.substring(0, 8)}',
        payer: Party(
          partyIdType: PartyPartyIdType.msisdn,
          partyId: msisdn,
        ),
        payerMessage: 'Simulation of $label',
        payeeNote: 'Sandbox simulation',
      ),
    );
    _logger.i('✓ Request to Pay submitted. Polling transaction status...');

    RequestToPayResult? status;
    var attempts = 0;

    while (attempts < 10) {
      attempts++;
      await Future.delayed(const Duration(seconds: 2));
      try {
        status = await momo.collection
            .requesttoPayTransactionStatus(referenceId: referenceId);
        final state = status.status;
        _logger.i('  [Poll $attempts/10] Current Status: $state');

        if (state == RequestToPayResultStatus.successful) {
          _logger.i('  ✓ Transaction completed SUCCESSFUL!');
          break;
        } else if (state == RequestToPayResultStatus.failed) {
          _logger.e('  ✗ Transaction FAILED on the gateway.');
          if (status.reason != null) {
            _logger.e('    Failure Reason: ${status.reason?.code}');
          }
          break;
        }
      } on MtnMomoNotFoundException catch (_) {
        _logger.i(
            '  [Poll $attempts/10] Transaction not propagated on gateway yet (404)...');
      }
    }
  } on MtnMomoException catch (e) {
    _logger
        .w('✓ Caught expected MtnMomoException during request initialization:');
    _logger.w('  Type   : ${e.runtimeType}');
    _logger.w('  Message: ${e.message}');
  } catch (e) {
    _logger.e('  Unexpected error: $e');
  }
}
