// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_user.dart';
import '../models/api_user_key_result.dart';

part 'sandbox_provisioning_client.g.dart';

@RestApi()
abstract class SandboxProvisioningClient {
  factory SandboxProvisioningClient(Dio dio, {String? baseUrl}) = _SandboxProvisioningClient;

  /// /apiuser - POST.
  ///
  /// Used to create an API user in the sandbox target environment.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID for the API user to be created. UUID version 4 is required.
  @POST('/v1_0/apiuser')
  Future<void> postV10Apiuser({
    @Header('X-Reference-Id') required String xReferenceId,
    @Body() ApiUser? apiUser,
  });

  /// /v1_0/apiuser/{X-Reference-Id}/apikey - POST.
  ///
  /// Used to create an API key for an API user in the sandbox target environment.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID for the API user to be created. UUID version 4 is required.
  @POST('/v1_0/apiuser/{X-Reference-Id}/apikey')
  Future<ApiUserKeyResult> postV10ApiuserApikey({
    @Path('X-Reference-Id') required String xReferenceId,
  });

  /// /v1_0/apiuser/{X-Reference-Id} - GET.
  ///
  /// Used to get API user information.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID for the API user to be created. UUID version 4 is required.
  @GET('/v1_0/apiuser/{X-Reference-Id}')
  Future<void> getV10Apiuser({
    @Path('X-Reference-Id') required String xReferenceId,
  });
}
