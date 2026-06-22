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

/// Standalone CLI Example: Collections Pre-Approval (Payment Consent)
///
/// Demonstrates how to:
/// 1. Create a dynamic Sandbox user for Collections.
/// 2. Request a Pre-Approval (Mandate/Consent) from a Payer.
/// 3. Poll for the status of the Pre-Approval request.
/// 4. Verify successful versus rejected sandbox scenarios.
///
/// Run this example using:
/// `dart example/lib/collections_preapproval_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Collections Pre-Approval Example');
  print('==================================================');

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
      'Please define COLLECTIONS_KEY in your .env file or set MTN_MOMO_SUBSCRIPTION_KEY in your environment.',
    );
    return;
  }

  // Dynamically provision sandbox credentials if not provided
  if (userId.isEmpty || apiKey.isEmpty) {
    _logger.i(
        'Provisioning sandbox credentials dynamically using Subscription Key...');
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

  // Initialize client
  final momo = MtnMomo(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  // Run two scenarios: 1. Success case, 2. Rejected case
  await _runPreApprovalScenario(
      momo, '256772123456', 'Success Case (Standard User)');
  await _runPreApprovalScenario(
      momo, '46733123450', 'Rejected Case (User Not Found/Declined)');
}

Future<void> _runPreApprovalScenario(
  MtnMomo momo,
  String msisdn,
  String scenarioName,
) async {
  _logger.i('\n--- Running Scenario: $scenarioName ---');
  final referenceId = const Uuid().v4();
  _logger
      .i('Requesting pre-approval (reference ID: $referenceId) for $msisdn...');

  final preApproval = PreApproval(
    payer: Party(
      partyIdType: PartyPartyIdType.msisdn,
      partyId: msisdn,
    ),
    payerCurrency: 'EUR',
    payerMessage: 'Consent to charge your wallet for subscription services.',
    validityTime: 3600, // Valid for 1 hour
  );

  try {
    await momo.collection.preApproval(
      xReferenceId: referenceId,
      body: preApproval,
    );
    _logger
        .i('✓ Pre-Approval request submitted successfully. Polling status...');

    PreApprovalResult? status;
    var attempts = 0;

    while (attempts < 10) {
      attempts++;
      await Future.delayed(const Duration(seconds: 2));
      try {
        status = await momo.collection
            .getPreApprovalStatus(referenceId: referenceId);
        final state = status.status;
        _logger.i('  [Attempt $attempts] Current Status: $state');

        if (state == PreApprovalResultStatus.successful) {
          _logger.i('  ✓ Pre-Approval mandate GRANTED successfully!');
          break;
        } else if (state == PreApprovalResultStatus.failed) {
          _logger.e('  ✗ Pre-Approval request REJECTED/FAILED.');
          if (status.reason != null) {
            _logger.e('    Reason: ${status.reason?.code}');
          }
          break;
        }
      } on MtnMomoNotFoundException catch (_) {
        _logger.i(
            '  [Attempt $attempts] Pre-approval not propagated on gateway yet (404)...');
      }
    }
  } on MtnMomoException catch (e) {
    _logger.e('MTN MoMo Exception: ${e.message}');
  } catch (e) {
    _logger.e('Unexpected error: $e');
  }
}
