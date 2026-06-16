// ignore_for_file: avoid_print
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';
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

/// Standalone CLI Example: Disbursements Payout & Refund
///
/// Demonstrates how to:
/// 1. Create a dynamic Sandbox user for Disbursements.
/// 2. Disburse funds to a payee wallet (Transfer).
/// 3. Refund the disbursed funds using the original Transfer Reference ID.
/// 4. Poll and monitor the status of the Refund request.
///
/// Run this example using:
/// `dart example/lib/disbursements_refund_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Disbursements Payout & Refund Example');
  print('==================================================');

  final env = _loadEnv();
  final subscriptionKey =
      Platform.environment['MTN_MOMO_DISB_SUBSCRIPTION_KEY'] ??
          Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
          env['DISBURSMENTS_KEY'] ??
          'bbc813d659cf48fe8bf5b5043938ad85';

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
      'Please define DISBURSMENTS_KEY in your .env file or set MTN_MOMO_DISB_SUBSCRIPTION_KEY in your environment.',
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
  final momo = MomoCollections(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  const payeeMsisdn = '256772987654';
  final originalTransferRefId = const Uuid().v4();

  // 1. Perform Transfer first
  _logger.i(
      '\n1. Performing initial Payout Transfer of 5,000 EUR to payee ($payeeMsisdn)...');
  try {
    await momo.disbursements.transfer(
      xReferenceId: originalTransferRefId,
      body: Transfer(
        amount: '5000',
        currency: 'EUR',
        externalId: 'TXN_PAYOUT_REF_100',
        payee: const Party(
          partyIdType: PartyPartyIdType.msisdn,
          partyId: payeeMsisdn,
        ),
        payerMessage: 'Salary Payment',
        payeeNote: 'Salary transfer',
      ),
    );
    _logger.i(
        '✓ Transfer initiated successfully. Waiting on success state propagation...');
    await Future.delayed(const Duration(seconds: 3));
  } on MtnMomoException catch (e) {
    _logger.e('Failed to execute initial transfer: ${e.message}');
    return;
  }

  // 2. Trigger Refund referencing the Transfer
  final refundRefId = const Uuid().v4();
  _logger.i(
      '\n2. Triggering Refund request ($refundRefId) for the original transfer...');
  try {
    final refund = Refund(
      amount: '5000',
      currency: 'EUR',
      externalId: 'TXN_REFUND_REF_100',
      referenceIdToRefund: originalTransferRefId, // Refers to original transfer
      payerMessage: 'Refund salary payment error',
      payeeNote: 'Refunding salary payout',
    );

    await momo.disbursements.refundV1(
      xReferenceId: refundRefId,
      body: refund,
    );
    _logger.i('✓ Refund request accepted. Polling status on gateway...');

    // 3. Poll Refund Status
    RefundResult? status;
    var attempts = 0;

    while (attempts < 10) {
      attempts++;
      await Future.delayed(const Duration(seconds: 2));
      try {
        status =
            await momo.disbursements.getRefundStatus(referenceId: refundRefId);
        final state = status.status;
        _logger.i('   [Attempt $attempts/10] Current Status: $state');

        if (state == RefundResultStatus.successful) {
          _logger.i('   ✓ Payout Refund completed SUCCESSFUL!');
          break;
        } else if (state == RefundResultStatus.failed) {
          _logger.e('   ✗ Payout Refund FAILED.');
          if (status.reason != null) {
            _logger.e('     Reason: ${status.reason?.code}');
          }
          break;
        }
      } on MtnMomoNotFoundException catch (_) {
        _logger.i(
            '   [Attempt $attempts/10] Refund not propagated on gateway yet (404)...');
      }
    }
  } on MtnMomoException catch (e) {
    _logger.e('MTN MoMo Exception: ${e.message}');
  } catch (e) {
    _logger.e('Unexpected error during refund: $e');
  }

  print('\n==================================================');
  print('          REFUND PROCESS ENDED');
  print('==================================================\n');
}
