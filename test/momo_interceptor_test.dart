import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';
import 'package:mtn_momo_sdk/src/interceptors/momo_interceptor.dart';
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
  group('MomoInterceptor', () {
    late Dio dio;
    late TokenManager tokenManager;
    late MockHttpClientAdapter mockAdapter;
    late List<Future<String?> Function()> tokenExpiredCalls;
    late Future<String?> Function(RequestOptions options) onTokenExpiredMock;

    setUp(() {
      dio = Dio();
      mockAdapter = MockHttpClientAdapter();
      dio.httpClientAdapter = mockAdapter;
      tokenManager = TokenManager();

      tokenExpiredCalls = [];
      onTokenExpiredMock = (options) async {
        if (tokenExpiredCalls.isNotEmpty) {
          return tokenExpiredCalls.removeAt(0)();
        }
        return 'mock_fetched_access_token';
      };

      dio.interceptors.add(
        MomoInterceptor(
          subscriptionKey: 'test_subscription_key_123',
          targetEnvironment: 'sandbox',
          userId: 'test_user_id_123',
          apiKey: 'test_api_key_123',
          tokenManager: tokenManager,
          onTokenExpired: onTokenExpiredMock,
        ),
      );
    });

    test('injects subscription key and target environment headers', () async {
      RequestOptions? interceptedOptions;
      mockAdapter.handler = (options) {
        interceptedOptions = options;
        return ResponseBody.fromString('{}', 200);
      };

      // Set token so we don't trigger token fetching in this test
      tokenManager.setToken(
        const TokenPost200ApplicationJsonResponse(
          accessToken: 'existing_token',
          expiresIn: 3600,
        ),
      );

      await dio.get('/some-endpoint');

      expect(interceptedOptions, isNotNull);
      expect(
        interceptedOptions!.headers['Ocp-Apim-Subscription-Key'],
        equals('test_subscription_key_123'),
      );
      expect(
        interceptedOptions!.headers['X-Target-Environment'],
        equals('sandbox'),
      );
    });

    test(
      'generates and injects X-Reference-Id for POST requests if missing',
      () async {
        RequestOptions? interceptedOptions;
        mockAdapter.handler = (options) {
          interceptedOptions = options;
          return ResponseBody.fromString('{}', 200);
        };

        tokenManager.setToken(
          const TokenPost200ApplicationJsonResponse(
            accessToken: 'existing_token',
            expiresIn: 3600,
          ),
        );

        await dio.post('/create-something', data: {});

        expect(interceptedOptions, isNotNull);
        final refId = interceptedOptions!.headers['X-Reference-Id'];
        expect(refId, isNotNull);
        expect(refId, isA<String>());
        // UUID v4 format verification
        expect(
          RegExp(
            r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
          ).hasMatch(refId as String),
          isTrue,
        );
      },
    );

    test(
      'does NOT overwrite X-Reference-Id if already provided in a POST request',
      () async {
        RequestOptions? interceptedOptions;
        mockAdapter.handler = (options) {
          interceptedOptions = options;
          return ResponseBody.fromString('{}', 200);
        };

        tokenManager.setToken(
          const TokenPost200ApplicationJsonResponse(
            accessToken: 'existing_token',
            expiresIn: 3600,
          ),
        );

        const customRefId = 'custom-user-supplied-uuid-value';
        await dio.post(
          '/create-something',
          data: {},
          options: Options(headers: {'X-Reference-Id': customRefId}),
        );

        expect(interceptedOptions, isNotNull);
        expect(
          interceptedOptions!.headers['X-Reference-Id'],
          equals(customRefId),
        );
      },
    );

    test('does NOT inject X-Reference-Id for GET requests', () async {
      RequestOptions? interceptedOptions;
      mockAdapter.handler = (options) {
        interceptedOptions = options;
        return ResponseBody.fromString('{}', 200);
      };

      tokenManager.setToken(
        const TokenPost200ApplicationJsonResponse(
          accessToken: 'existing_token',
          expiresIn: 3600,
        ),
      );

      await dio.get('/fetch-something');

      expect(interceptedOptions, isNotNull);
      expect(
        interceptedOptions!.headers.containsKey('X-Reference-Id'),
        isFalse,
      );
    });

    test(
      'skips auth check and token injection for /token and /apiuser routes',
      () async {
        RequestOptions? interceptedOptions;
        mockAdapter.handler = (options) {
          interceptedOptions = options;
          return ResponseBody.fromString('{}', 200);
        };

        // Ensure token is invalid
        expect(tokenManager.isValid, isFalse);

        await dio.post('/collection/token');
        await dio.post('/v1_0/apiuser');

        expect(interceptedOptions, isNotNull);
        expect(
          interceptedOptions!.headers.containsKey('Authorization'),
          isFalse,
        );
        // Ensure onTokenExpired was never called
        expect(tokenExpiredCalls, isEmpty);
      },
    );

    test('injects existing valid access token from TokenManager', () async {
      RequestOptions? interceptedOptions;
      mockAdapter.handler = (options) {
        interceptedOptions = options;
        return ResponseBody.fromString('{}', 200);
      };

      tokenManager.setToken(
        const TokenPost200ApplicationJsonResponse(
          accessToken: 'pre_existing_token',
          expiresIn: 1000,
        ),
      );

      await dio.get('/protected-endpoint');

      expect(interceptedOptions, isNotNull);
      expect(
        interceptedOptions!.headers['Authorization'],
        equals('Bearer pre_existing_token'),
      );
    });

    test(
      'automatically re-fetches and injects token if expired/absent',
      () async {
        RequestOptions? interceptedOptions;
        mockAdapter.handler = (options) {
          interceptedOptions = options;
          return ResponseBody.fromString('{}', 200);
        };

        expect(tokenManager.isValid, isFalse);

        bool fetchCalled = false;
        tokenExpiredCalls.add(() async {
          fetchCalled = true;
          // Simulating the fetched token update
          tokenManager.setToken(
            const TokenPost200ApplicationJsonResponse(
              accessToken: 'newly_fetched_token',
              expiresIn: 3600,
            ),
          );
          return 'newly_fetched_token';
        });

        await dio.get('/protected-endpoint');

        expect(fetchCalled, isTrue);
        expect(interceptedOptions, isNotNull);
        expect(
          interceptedOptions!.headers['Authorization'],
          equals('Bearer newly_fetched_token'),
        );
        expect(tokenManager.isValid, isTrue);
        expect(tokenManager.accessToken, equals('newly_fetched_token'));
      },
    );

    test('rejects request if onTokenExpired yields null', () async {
      expect(tokenManager.isValid, isFalse);

      tokenExpiredCalls.add(() async => null);

      expect(
        () => dio.get('/protected-endpoint'),
        throwsA(
          isA<DioException>().having(
            (e) => e.error,
            'error message',
            contains('Failed to obtain access token'),
          ),
        ),
      );
    });

    test('rejects request if onTokenExpired throws an exception', () async {
      expect(tokenManager.isValid, isFalse);

      tokenExpiredCalls.add(() async => throw Exception('Network down'));

      expect(
        () => dio.get('/protected-endpoint'),
        throwsA(
          isA<DioException>().having(
            (e) => e.error,
            'error message',
            contains('Failed to obtain access token: Exception: Network down'),
          ),
        ),
      );
    });

    test(
      'onError intercepts DioException and rejects with mapped MtnMomoException',
      () async {
        mockAdapter.handler = (options) {
          return ResponseBody.fromString(
            '{"message": "Access Denied"}',
            401,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );
        };

        tokenManager.setToken(
          const TokenPost200ApplicationJsonResponse(
            accessToken: 'some_token',
            expiresIn: 3600,
          ),
        );

        expect(
          () => dio.get('/protected-endpoint'),
          throwsA(isA<MtnMomoAuthException>()),
        );
      },
    );
  });
}
