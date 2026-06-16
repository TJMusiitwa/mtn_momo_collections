import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../exceptions.dart';
import '../token_manager.dart';

class MomoInterceptor extends Interceptor {
  final String subscriptionKey;
  final String targetEnvironment;
  final String userId;
  final String apiKey;
  final TokenManager tokenManager;
  final Future<String?> Function(RequestOptions options) onTokenExpired;
  final Uuid _uuid = const Uuid();

  MomoInterceptor({
    required this.subscriptionKey,
    required this.targetEnvironment,
    required this.userId,
    required this.apiKey,
    required this.tokenManager,
    required this.onTokenExpired,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Convert custom request body objects to Map/JSON using dart_mappable
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
        } catch (_) {
          // Keep as is if no serialization method exists
        }
      }
    }

    // Inject Subscription Key
    options.headers['Ocp-Apim-Subscription-Key'] = subscriptionKey;

    // Inject Target Environment
    options.headers['X-Target-Environment'] = targetEnvironment;

    // Inject UUID (X-Reference-Id) for POST requests if not present
    if (options.method.toUpperCase() == 'POST' &&
        !options.headers.containsKey('X-Reference-Id')) {
      options.headers['X-Reference-Id'] = _uuid.v4();
    }

    // Skip Auth for token creation endpoints, injecting Basic Auth for /token
    if (options.path.contains('/token') || options.path.contains('/apiuser')) {
      if (options.path.contains('/token')) {
        final basicAuth =
            'Basic ${base64Encode(utf8.encode('$userId:$apiKey'))}';
        options.headers['Authorization'] = basicAuth;
      }
      return handler.next(options);
    }

    // Handle Authorization
    if (!tokenManager.isValid) {
      try {
        final newToken = await onTokenExpired(options);
        if (newToken == null) {
          return handler.reject(
            DioException(
              requestOptions: options,
              error: 'Failed to obtain access token',
            ),
          );
        }
      } catch (e) {
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Failed to obtain access token: $e',
          ),
        );
      }
    }

    final token = tokenManager.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final mappedException = mapDioException(err);
    handler.reject(mappedException);
  }
}
