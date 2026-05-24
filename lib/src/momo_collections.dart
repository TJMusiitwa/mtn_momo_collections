import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mtn_momo_collections/src/generated/export.dart';
import 'package:mtn_momo_collections/src/interceptors/momo_interceptor.dart';
import 'package:mtn_momo_collections/src/token_manager.dart';

class MomoCollections {
  final String baseUrl;
  final String subscriptionKey;
  final String userId;
  final String apiKey;
  final String targetEnvironment;

  late final Dio _dio;
  late final CollectionClient _collectionClient;
  late final DisbursementsClient _disbursementsClient;
  late final SandboxProvisioningClient _sandboxProvisioningClient;
  final TokenManager _tokenManager = TokenManager();
  final Logger _logger = Logger();

  MomoCollections({
    required this.baseUrl,
    required this.subscriptionKey,
    required this.userId,
    required this.apiKey,
    this.targetEnvironment = 'sandbox',
  }) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));

    _dio.interceptors.add(
      MomoInterceptor(
        subscriptionKey: subscriptionKey,
        targetEnvironment: targetEnvironment,
        tokenManager: _tokenManager,
        onTokenExpired: _fetchToken,
      ),
    );

    _collectionClient = CollectionClient(_dio, baseUrl: baseUrl);
    _disbursementsClient = DisbursementsClient(_dio, baseUrl: baseUrl);
    _sandboxProvisioningClient = SandboxProvisioningClient(
      _dio,
      baseUrl: baseUrl,
    );
  }

  CollectionClient get collection => _collectionClient;
  DisbursementsClient get disbursements => _disbursementsClient;
  SandboxProvisioningClient get sandbox => _sandboxProvisioningClient;
  Dio get dio => _dio;

  Future<String?>? _tokenFetchFuture;

  Future<String?> _fetchToken() async {
    if (_tokenFetchFuture != null) {
      return _tokenFetchFuture;
    }

    _tokenFetchFuture = () async {
      try {
        final basicAuth =
            'Basic ${base64Encode(utf8.encode('$userId:$apiKey'))}';
        final response = await _collectionClient.createAccessToken(
          authorization: basicAuth,
        );
        _tokenManager.setToken(response);
        return response.accessToken;
      } catch (e) {
        // If token fetch fails, we can't do much. The interceptor will reject the original request.
        _logger.e('Error fetching token', error: e);
        return null;
      } finally {
        _tokenFetchFuture = null;
      }
    }();

    return _tokenFetchFuture;
  }
}
