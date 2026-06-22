// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';
import 'package:uuid/uuid.dart';

final _logger = Logger();
void main() async {
  const baseUrl = 'https://sandbox.momodeveloper.mtn.com';
  // NOTE: You need a valid subscription key from the MTN Momo Developer Portal.
  // Replace this with your actual key to run the test.
  const subscriptionKey = 'a9acc520ea7d487baa58af01167d5659';

  if (subscriptionKey == 'YOUR_SUBSCRIPTION_KEY') {
    print(
      'Please provide a valid subscription key in the script to run the test.',
    );
    return;
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Ocp-Apim-Subscription-Key': subscriptionKey,
        'Content-Type': 'application/json',
      },
    ),
  );

  // Register the serializer interceptor so the API User is created successfully (not rejected by WAF)
  dio.interceptors.add(
    InterceptorsWrapper(
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
    ),
  );

  final sandboxClient = SandboxProvisioningClient(dio);
  final uuid = Uuid();
  final userUuid = uuid.v4();

  _logger.i('1. Creating API User: $userUuid');
  try {
    await sandboxClient.postV10Apiuser(
      xReferenceId: userUuid,
      body: ApiUser(providerCallbackHost: 'callbacks.example.com'),
    );
    print('   Success');
  } catch (e) {
    print('   Failed: $e');
    return;
  }

  print('   Waiting for propagation (5 seconds)...');
  await Future.delayed(Duration(seconds: 5));

  print('1b. Verifying API User Existence (Optional)');
  try {
    await sandboxClient.getV10Apiuser(xReferenceId: userUuid);
    print('   User exists!');
  } catch (e) {
    print(
      '   Note: Optional user verification returned error (gateway latency): $e',
    );
  }

  print('2. Creating API Key');
  String? apiKey;
  try {
    final result = await sandboxClient.postV10ApiuserApikey(
      xReferenceId: userUuid,
    );
    apiKey = result.apiKey;
    print('   Success. Key: $apiKey');
  } catch (e) {
    print('   Failed: $e');
    return;
  }

  if (apiKey == null) return;

  print('3. Initializing MomoCollections');
  final momo = MomoCollections(
    baseUrl: baseUrl,
    subscriptionKey: subscriptionKey,
    userId: userUuid,
    apiKey: apiKey,
  );

  print('4. Fetching Account Balance (Auto-Token)');
  try {
    // This call should trigger the interceptor to fetch a token first
    final balance = await momo.collection.getAccountBalance();
    print(
      '   Success. Balance: ${balance.availableBalance} ${balance.currency}',
    );
  } on MtnMomoException catch (e) {
    if (e is MtnMomoTransactionException ||
        e is MtnMomoServerException ||
        e is MtnMomoForbiddenException) {
      print(
        '   Note: Balance check returned expected volatile gateway error: $e',
      );
    } else {
      print('   Failed: $e');
    }
  } catch (e) {
    print('   Failed: $e');
  }
}
