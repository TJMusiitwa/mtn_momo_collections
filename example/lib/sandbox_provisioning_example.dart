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

/// Standalone CLI Example: Sandbox Provisioning
///
/// Demonstrates how to programmatically create a Sandbox API User and generate
/// an API Key using the MTN MoMo Developer sandbox environment.
///
/// Run this example using:
/// `dart example/sandbox_provisioning_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Sandbox Provisioning Example');
  print('==================================================');

  // --- Configuration ---
  final env = _loadEnv();
  final subscriptionKey = Platform.environment['MTN_MOMO_SUBSCRIPTION_KEY'] ??
      env['COLLECTIONS_KEY'] ??
      env['DISBURSMENTS_KEY'] ??
      'a9acc520ea7d487baa58af01167d5659';

  if (subscriptionKey == 'YOUR_SUBSCRIPTION_KEY' || subscriptionKey.isEmpty) {
    _logger.w(
      'Subscription Key is missing!\n'
      'Please obtain your Subscription Key from your Profile on the MTN MoMo Developer portal (https://momodeveloper.mtn.com/)\n'
      'and export it as an environment variable (MTN_MOMO_SUBSCRIPTION_KEY) or define it in a .env file as COLLECTIONS_KEY or DISBURSMENTS_KEY.',
    );
    return;
  }

  const baseUrl = 'https://sandbox.momodeveloper.mtn.com';
  final uuid = const Uuid();

  // A unique UUID version 4 is required as the X-Reference-Id
  final userUuid = uuid.v4();

  // Create the baseline Dio client configured with the subscription key
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Ocp-Apim-Subscription-Key': subscriptionKey,
        'Content-Type': 'application/json',
      },
    ),
  );

  // Initialize the Sandbox Provisioning Client
  final sandboxProvisioner = SandboxProvisioningClient(dio);

  try {
    // 1. Create API User
    _logger.i('1. Creating Sandbox API User...');
    _logger.i('   X-Reference-Id (User ID): $userUuid');

    await sandboxProvisioner.postV10Apiuser(
      xReferenceId: userUuid,
      body: const ApiUser(
        providerCallbackHost: 'callbacks.my-awesome-app.com',
      ),
    );
    _logger.i('   ✓ API User created successfully on the MTN gateway.');

    // 2. Wait for database propagation
    _logger.i('2. Waiting for sandbox database propagation (2s)...');
    await Future.delayed(const Duration(seconds: 2));

    // 3. Generate API Key
    _logger.i('3. Generating API Key for User ID: $userUuid');
    final response = await sandboxProvisioner.postV10ApiuserApikey(
      xReferenceId: userUuid,
    );
    final apiKey = response.apiKey;

    if (apiKey == null || apiKey.isEmpty) {
      _logger.e('   ✗ Failed to generate API Key: Response was empty.');
      return;
    }

    _logger.i('   ✓ API Key acquired: $apiKey');

    print('\n==================================================');
    print('          PROVISIONING COMPLETED!');
    print('==================================================');
    print('Use these credentials in your MomoCollections client:');
    print('User ID (API User): $userUuid');
    print('API Key           : $apiKey');
    print('Target Environment: sandbox');
    print('==================================================\n');
  } on MtnMomoException catch (e) {
    _logger.e('MTN MoMo Error occurred: ${e.message}');
  } catch (e) {
    _logger.e('An unexpected error occurred: $e');
  }
}
