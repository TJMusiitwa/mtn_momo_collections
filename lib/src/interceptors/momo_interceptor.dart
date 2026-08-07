import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../exceptions.dart';
import '../token_manager.dart';

final class MomoInterceptor extends Interceptor {
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
    _normalizeData(options);
    _injectHeaders(options);

    if (_handleTokenEndpoints(options, handler)) return;

    if (!await _ensureToken(options, handler)) return;

    final token = tokenManager.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  void _normalizeData(RequestOptions options) {
    final data = options.data;
    if (data == null) return;

    final shouldConvert = switch (data) {
      Map() || List() || String() || FormData() => false,
      _ => true,
    };
    if (!shouldConvert) return;

    options.data = _trySerialize(data);
  }

  Object? _trySerialize(dynamic data) {
    try {
      return (data as dynamic).toMap();
    } catch (_) {
      try {
        return (data as dynamic).toJson();
      } catch (_) {
        return data;
      }
    }
  }

  void _injectHeaders(RequestOptions options) {
    options.headers['Ocp-Apim-Subscription-Key'] = subscriptionKey;
    options.headers['X-Target-Environment'] = targetEnvironment;

    if (options.method.toUpperCase() == 'POST' &&
        !options.headers.containsKey('X-Reference-Id')) {
      options.headers['X-Reference-Id'] = _uuid.v4();
    }
  }

  bool _handleTokenEndpoints(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final isAuthEndpoint =
        options.path.contains('/token') || options.path.contains('/apiuser');
    if (!isAuthEndpoint) return false;

    if (options.path.contains('/token')) {
      final basicAuth = 'Basic ${base64Encode(utf8.encode('$userId:$apiKey'))}';
      options.headers['Authorization'] = basicAuth;
    }
    handler.next(options);
    return true;
  }

  Future<bool> _ensureToken(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (tokenManager.isValid) return true;

    try {
      final newToken = await onTokenExpired(options);
      if (newToken != null) return true;

      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Failed to obtain access token',
        ),
      );
      return false;
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Failed to obtain access token: $e',
        ),
      );
      return false;
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final mappedException = mapDioException(err);
    handler.reject(mappedException);
  }
}
