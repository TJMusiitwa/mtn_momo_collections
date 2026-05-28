// ignore_for_file: avoid_print
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';
import 'package:uuid/uuid.dart';

final _logger = Logger(
  printer: SimplePrinter(colors: true),
);

/// Standalone CLI Example: Collections
///
/// Demonstrates how to use the high-level `MomoCollections` wrapper to:
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
  final subscriptionKey = Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
      'a9acc520ea7d487baa58af01167d5659';
  final userId = Platform.environment['MTN_MOMO_USER_ID'] ??
      'a5db8b08-3067-4221-a3f2-ef971e467d5c';
  final apiKey = Platform.environment['MTN_MOMO_API_KEY'] ??
      'c85fe56b02664ff0a184e116e04d49a7';

  if (subscriptionKey == 'YOUR_SUBSCRIPTION_KEY' ||
      userId.isEmpty ||
      apiKey.isEmpty) {
    _logger.w(
      'Required credentials (Subscription Key, API User ID, or API Key) are missing!\n'
      '1. Get your Primary or Secondary Subscription Key from your Profile on the MTN MoMo Developer portal (https://momodeveloper.mtn.com/).\n'
      '2. Run sandbox_provisioning_example.dart using your Subscription Key to dynamically register your Sandbox API User ID and retrieve your Sandbox API Key.\n'
      '3. Export them as environment variables (MTN_MOMO_SUBSCRIPTION_KEY, MTN_MOMO_USER_ID, MTN_MOMO_API_KEY) or edit this file to paste them.',
    );
    return;
  }

  // --- Initialization ---
  // The MomoCollections client wraps all underlying Retrofit clients, manages
  // access tokens under the hood, and automatically handles key injection.
  final momo = MomoCollections(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  try {
    // 1. Check Account Balance
    _logger.i('1. Checking merchant Collections balance...');
    final balance = await momo.collection.getAccountBalance();
    _logger.i('   Balance: ${balance.availableBalance} ${balance.currency}');

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
