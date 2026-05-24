// ignore_for_file: avoid_print
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';
import 'package:uuid/uuid.dart';

final _logger = Logger(
  printer: SimplePrinter(colors: true),
);

/// Standalone CLI Example: Disbursements
///
/// Demonstrates how to use the high-level `MomoCollections` wrapper to:
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
  final subscriptionKey =
      Platform.environment['MTN_MOMO_DISB_SUBSCRIPTION_KEY'] ??
          Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
          'a9acc520ea7d487baa58af01167d5659';
  final userId = Platform.environment['MTN_MOMO_DISB_USER_ID'] ??
      Platform.environment['MTN_MOMO_USER_ID'] ??
      'a5db8b08-3067-4221-a3f2-ef971e467d5c';
  final apiKey = Platform.environment['MTN_MOMO_DISB_API_KEY'] ??
      Platform.environment['MTN_MOMO_API_KEY'] ??
      'c85fe56b02664ff0a184e116e04d49a7';

  if (subscriptionKey == 'YOUR_SUBSCRIPTION_KEY' ||
      userId.isEmpty ||
      apiKey.isEmpty) {
    _logger.w(
      'Required credentials (Subscription Key, API User ID, or API Key) are missing!\n'
      '1. Get your Primary or Secondary Subscription Key from your Profile on the MTN MoMo Developer portal (https://momodeveloper.mtn.com/).\n'
      '2. Run sandbox_provisioning_example.dart using your Subscription Key to dynamically register your Sandbox API User ID and retrieve your Sandbox API Key.\n'
      '3. Export them as environment variables (MTN_MOMO_DISB_SUBSCRIPTION_KEY, MTN_MOMO_DISB_USER_ID, MTN_MOMO_DISB_API_KEY) or edit this file to paste them.',
    );
    return;
  }

  // --- Initialization ---
  final momo = MomoCollections(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  try {
    // 1. Check Disbursements Account Balance
    _logger.i('1. Checking merchant Disbursements account balance...');
    final balance = await momo.disbursements.getAccountBalance();
    _logger.i('   Balance: ${balance.availableBalance} ${balance.currency}');

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
      transfer: transferBody,
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
