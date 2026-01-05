// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:mtn_momo_collections/clients/collection_client.dart';
import 'package:mtn_momo_collections/clients/sandbox_provisioning_client.dart';

/// MTN Momo Client `v1.0`.
class MtnMomoClient {
  MtnMomoClient(Dio dio, {String? baseUrl})
    : _dio = dio,
      _baseUrl = baseUrl ?? 'https://sandbox.momodeveloper.mtn.com';

  final Dio _dio;
  final String _baseUrl;

  static String get version => '1.0';

  CollectionClient? _collection;
  SandboxProvisioningClient? _sandboxProvisioning;

  CollectionClient get collectionClient =>
      _collection ??= CollectionClient(_dio, baseUrl: _baseUrl);
  SandboxProvisioningClient get sandboxProvisioningClient =>
      _sandboxProvisioning ??= SandboxProvisioningClient(
        _dio,
        baseUrl: _baseUrl,
      );
}
