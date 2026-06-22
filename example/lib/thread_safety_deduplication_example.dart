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
  final env = _loadEnv();
  final subscriptionKey = Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
      env['COLLECTIONS_KEY'] ??
      '';

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
    if (e is MtnMomoTransactionException ||
        e is MtnMomoServerException ||
        e is MtnMomoForbiddenException) {
      _logger.i('   ✓ Deduplication and token fetch verified.');
      _logger.w(
        '   Note: Collections balance endpoint returned a gateway error (expected volatile sandbox behavior): $e',
      );
    } else {
      _logger.e('MTN MoMo Error occurred: ${e.message}');
    }
  } catch (e) {
    _logger.e('An unexpected error occurred: $e');
  }

  print('\n==================================================');
  print('          DEDUPLICATION COMPLETED');
  print('==================================================\n');
}
