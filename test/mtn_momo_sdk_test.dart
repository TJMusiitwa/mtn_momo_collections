import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';
import 'package:test/test.dart';

class MockHttpClientAdapter implements HttpClientAdapter {
  ResponseBody Function(RequestOptions options)? handler;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (handler != null) {
      return handler!(options);
    }
    return ResponseBody.fromString(
      '{"status": "ok"}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('MtnMomoClient', () {
    late Dio dio;

    setUp(() {
      dio = Dio();
    });

    test('can be instantiated', () {
      expect(MtnMomoClient(dio), isA<MtnMomoClient>());
    });

    test('provides access to sub-clients', () {
      final client = MtnMomoClient(dio);
      expect(client.collectionClient, isNotNull);
      expect(client.disbursementsClient, isNotNull);
      expect(client.sandboxProvisioningClient, isNotNull);
    });
  });

  group('MtnMomo Integration', () {
    const baseUrl = 'https://sandbox.momodeveloper.mtn.com';
    const subKey = 'test_sub_key';
    const userId = 'test_user_id';
    const apiKey = 'test_api_key';

    test('can be instantiated with default sandbox environment', () {
      final momo = MtnMomo(
        baseUrl: baseUrl,
        subscriptionKey: subKey,
        userId: userId,
        apiKey: apiKey,
      );

      expect(momo.baseUrl, equals(baseUrl));
      expect(momo.subscriptionKey, equals(subKey));
      expect(momo.userId, equals(userId));
      expect(momo.apiKey, equals(apiKey));
      expect(momo.targetEnvironment, equals('sandbox'));
      expect(momo.collection, isNotNull);
      expect(momo.disbursements, isNotNull);
      expect(momo.sandbox, isNotNull);
    });

    test(
      'programmatic token fetch deduplication handles concurrent requests safely',
      () async {
        final mockAdapter = MockHttpClientAdapter();

        final momo = MtnMomo(
          baseUrl: baseUrl,
          subscriptionKey: subKey,
          userId: userId,
          apiKey: apiKey,
        );

        // Force MtnMomo' internally created Dio to use our mock adapter
        momo.dio.httpClientAdapter = mockAdapter;

        int tokenRequestCount = 0;
        int balanceRequestCount = 0;

        mockAdapter.handler = (options) {
          if (options.path.contains('/token')) {
            tokenRequestCount++;
            // Simulate slight latency so concurrent calls will overlap
            return ResponseBody.fromString(
              jsonEncode({
                'access_token': 'deduped_access_token',
                'token_type': 'Bearer',
                'expires_in': 3600,
              }),
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            );
          } else if (options.path.contains('/v1_0/account/balance')) {
            balanceRequestCount++;
            return ResponseBody.fromString(
              jsonEncode({'availableBalance': '150000.00', 'currency': 'UGX'}),
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            );
          }
          return ResponseBody.fromString('{}', 404);
        };

        // Dispatch 3 concurrent requests to getAccountBalance
        final futures = Future.wait([
          momo.collection.getAccountBalance(),
          momo.collection.getAccountBalance(),
          momo.collection.getAccountBalance(),
        ]);

        final balances = await futures;

        // Verify all 3 calls succeeded and received correct balance data
        expect(balances.length, equals(3));
        for (final balance in balances) {
          expect(balance.availableBalance, equals('150000.00'));
          expect(balance.currency, equals('UGX'));
        }

        // Verify token fetch endpoint `/token/` was hit exactly ONCE
        expect(tokenRequestCount, equals(1));

        // Verify balance endpoint was hit 3 times (once per concurrent call after token resolution)
        expect(balanceRequestCount, equals(3));
      },
    );
  });
}
