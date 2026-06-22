import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mtn_momo_collections/src/generated/export.dart';
import 'package:mtn_momo_collections/src/interceptors/momo_interceptor.dart';
import 'package:mtn_momo_collections/src/mappers/error_reason_custom_mapper.dart';
import 'package:mtn_momo_collections/src/token_manager.dart';

/// High-level wrapper for the MTN Mobile Money (MoMo) API.
///
/// Handles OAuth2 token lifecycle automatically, including lazy fetching,
/// caching, and thread-safe deduplication of concurrent token requests.
///
/// > **Important**: Always use separate, dedicated `MomoCollections` instances
/// > for Collections, Disbursements, and Remittances. Sharing a single instance
/// > across products causes OAuth2 token cache collisions that result in
/// > `401 Unauthorized` errors, because each product uses distinct credentials.
///
/// Example:
/// ```dart
/// final momo = MomoCollections(
///   baseUrl: 'https://sandbox.momodeveloper.mtn.com',
///   subscriptionKey: 'YOUR_OCP_APIM_SUBSCRIPTION_KEY',
///   userId: 'YOUR_API_USER_ID',
///   apiKey: 'YOUR_API_KEY',
/// );
///
/// final balance = await momo.collection.getAccountBalance();
/// ```
class MomoCollections {
  final String baseUrl;
  final String subscriptionKey;
  final String userId;
  final String apiKey;
  final String targetEnvironment;

  late final Dio _dio;
  late final CollectionClient _collectionClient;
  late final DisbursementsClient _disbursementsClient;
  late final RemittanceClient _remittanceClient;
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
    _remittanceClient = RemittanceClient(_dio, baseUrl: '$baseUrl/remittance');
    _sandboxProvisioningClient = SandboxProvisioningClient(
      _dio,
      baseUrl: baseUrl,
    );
  }

  /// Access point for the MTN Mobile Money Collections API.
  ///
  /// Use this to request payments (USSD push), poll transaction status,
  /// manage invoices, pre-approvals, and check the merchant wallet balance.
  ///
  /// > **Important**: Always use a **dedicated** `MomoCollections` instance
  /// > for Collections. Sharing a single instance across products will cause
  /// > OAuth2 token cache collisions, resulting in `401 Unauthorized` errors.
  CollectionClient get collection => _collectionClient;

  /// Access point for the MTN Mobile Money Disbursements API.
  ///
  /// Use this to transfer funds to a recipient's mobile wallet, poll transfer
  /// status, and check the disbursements merchant wallet balance.
  ///
  /// > **Important**: Always use a **dedicated** `MomoCollections` instance
  /// > for Disbursements to avoid token cache collisions with other products.
  DisbursementsClient get disbursements => _disbursementsClient;

  /// Access point for the MTN Mobile Money Remittances API.
  ///
  /// Use this to initiate cross-border money transfers, including standard
  /// remittance transfers and cash transfers with full payer identity support
  /// for compliance.
  ///
  /// > **Important**: Always use a **dedicated** `MomoCollections` instance
  /// > for Remittances. Sharing a single instance across Collections,
  /// > Disbursements, and Remittances will cause OAuth2 token cache collisions,
  /// > resulting in `401 Unauthorized` errors.
  RemittanceClient get remittance => _remittanceClient;

  /// Access point for the MTN MoMo Sandbox User Provisioning API.
  ///
  /// Use this to programmatically create sandbox API users and retrieve their
  /// API keys before running sandbox integration tests. This client does not
  /// require an OAuth2 Bearer token; it uses the subscription key only.
  SandboxProvisioningClient get sandbox => _sandboxProvisioningClient;

  /// The underlying [Dio] HTTP client used by this `MomoCollections` instance.
  ///
  /// Exposed for advanced use cases such as adding additional interceptors,
  /// inspecting request/response logs, or testing with mock adapters.
  Dio get dio => _dio;

  Future<String?>? _tokenFetchFuture;

  Future<String?> _fetchToken(RequestOptions options) async {
    if (_tokenFetchFuture != null) {
      return _tokenFetchFuture;
    }

    _tokenFetchFuture = () async {
      try {
        final isDisbursement = options.baseUrl.contains('/disbursement');
        final isRemittance = options.baseUrl.contains('/remittance');
        final TokenPost200ApplicationJsonResponse response;
        if (isRemittance) {
          response = await _remittanceClient.createAccessToken();
        } else if (isDisbursement) {
          response = await _disbursementsClient.createAccessToken();
        } else {
          response = await _collectionClient.createAccessToken();
        }
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
