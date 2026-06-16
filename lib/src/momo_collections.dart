import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mtn_momo_collections/src/generated/export.dart';
import 'package:mtn_momo_collections/src/interceptors/momo_interceptor.dart';
import 'package:mtn_momo_collections/src/mappers/error_reason_custom_mapper.dart';
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
    // Register custom mapper for ErrorReason to handle String/Map mismatch in Sandbox
    // We must ensure the generated mapper is initialized first, otherwise its lazy
    // initialization will overwrite our custom mapper in the global container.
    ErrorReasonMapper.ensureInitialized();
    MapperContainer.globals.use(const ErrorReasonCustomMapper());

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      MomoInterceptor(
        subscriptionKey: subscriptionKey,
        targetEnvironment: targetEnvironment,
        userId: userId,
        apiKey: apiKey,
        tokenManager: _tokenManager,
        onTokenExpired: _fetchToken,
      ),
    );

    _collectionClient = CollectionClient(_dio, baseUrl: '$baseUrl/collection');
    _disbursementsClient = DisbursementsClient(
      _dio,
      baseUrl: '$baseUrl/disbursement',
    );
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

  Future<String?> _fetchToken(RequestOptions options) async {
    if (_tokenFetchFuture != null) {
      return _tokenFetchFuture;
    }

    _tokenFetchFuture = () async {
      try {
        final isDisbursement = options.baseUrl.contains('/disbursement');
        final response = isDisbursement
            ? await _disbursementsClient.createAccessToken()
            : await _collectionClient.createAccessToken();
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
