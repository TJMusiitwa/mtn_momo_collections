// ignore_for_file: avoid_print
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';

final _logger = Logger(
  printer: SimplePrinter(colors: true),
);

/// Standalone CLI Example: Thread Safety & Token Deduplication
///
/// Demonstrates the thread-safe token manager in the SDK.
/// When your app spawns multiple parallel HTTP requests at once without a valid token,
/// standard interceptors would launch duplicate parallel auth requests.
///
/// This SDK uses concurrent future deduplication: all requests queue up and await
/// the single in-flight token fetch future, preventing redundant load, rate limits,
/// or authentication race conditions.
///
/// Run this example using:
/// `dart example/thread_safety_deduplication_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Token Fetch Deduplication Example');
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
  final momo = MomoCollections(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: subscriptionKey,
    userId: userId,
    apiKey: apiKey,
    targetEnvironment: 'sandbox',
  );

  _logger
      .i('Spawning 3 parallel balance inquiries at the exact same moment...');
  _logger.i(
      'Check the logger output below: you will notice that the Token Interceptor');
  _logger.i(
      'triggers a SINGLE access token request. All three parallel balance queries');
  _logger.i(
      'wait for it to complete and then proceed with the newly generated token!');
  print('');

  try {
    // Fire 3 asynchronous balance fetches simultaneously
    final results = await Future.wait([
      momo.collection.getAccountBalance(),
      momo.collection.getAccountBalance(),
      momo.collection.getAccountBalance(),
    ]);

    _logger.i('   ✓ Concurrent requests completed successfully!');
    for (var i = 0; i < results.length; i++) {
      final balance = results[i];
      _logger.i(
          '     Request $i balance: ${balance.availableBalance} ${balance.currency}');
    }
  } on MtnMomoException catch (e) {
    _logger.e('MTN MoMo Error occurred: ${e.message}');
  } catch (e) {
    _logger.e('An unexpected error occurred: $e');
  }

  print('\n==================================================');
  print('          DEDUPLICATION COMPLETED');
  print('==================================================\n');
}
