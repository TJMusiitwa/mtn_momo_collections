// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

part 'oauth2_token_request.mapper.dart';

@MappableClass()
class Oauth2TokenRequest with Oauth2TokenRequestMappable {

  const Oauth2TokenRequest({
    this.grantType,
    this.authReqId,
    this.refreshToken,
  });
  @MappableField(key: 'grant_type')
  final String? grantType;
  @MappableField(key: 'auth_req_id')
  final String? authReqId;
  @MappableField(key: 'refresh_token')
  final String? refreshToken;


  static Oauth2TokenRequest fromJson(Map<String, dynamic> json) => Oauth2TokenRequestMapper.ensureInitialized().decodeMap<Oauth2TokenRequest>(json);
}
