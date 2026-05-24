import 'package:dio/dio.dart';

import 'clients/collection_client.dart';
import 'clients/disbursements_client.dart';
import 'clients/sandbox_provisioning_client.dart';

/// MTN Momo Client coordinator for all API products.
class MtnMomoClient {
  MtnMomoClient(Dio dio, {String? baseUrl})
    : _dio = dio,
      _baseUrl = baseUrl ?? 'https://sandbox.momodeveloper.mtn.com';

  final Dio _dio;
  final String _baseUrl;

  static String get version => '1.0';

  CollectionClient? _collection;
  DisbursementsClient? _disbursements;
  SandboxProvisioningClient? _sandboxProvisioning;

  /// Access point for MTN Mobile Money Collections API.
  CollectionClient get collectionClient =>
      _collection ??= CollectionClient(_dio, baseUrl: _baseUrl);

  /// Access point for MTN Mobile Money Disbursements API.
  DisbursementsClient get disbursementsClient =>
      _disbursements ??= DisbursementsClient(_dio, baseUrl: _baseUrl);

  /// Access point for Sandbox User Provisioning API.
  SandboxProvisioningClient get sandboxProvisioningClient =>
      _sandboxProvisioning ??= SandboxProvisioningClient(
        _dio,
        baseUrl: _baseUrl,
      );
}
