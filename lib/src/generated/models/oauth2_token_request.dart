// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'oauth2_token_request.mapper.dart';

@MappableClass()
class Oauth2TokenRequest with Oauth2TokenRequestMappable {
  const Oauth2TokenRequest({this.grantType, this.authReqId, this.refreshToken});

  /// Value ca be either "urn:openid:params:grant-type:ciba" or refresh_token
  @MappableField(key: 'grant_type')
  final String? grantType;

  /// Authentication request ID.Value is only mandatory if grant_type is "urn:openid:params:grant-type:ciba"
  @MappableField(key: 'auth_req_id')
  final String? authReqId;

  /// UUID.Refresh token retrieved from oauth2 token endpoint for consents with grant_type offline. This parameter is only valid if grant_type is refresh_token.
  @MappableField(key: 'refresh_token')
  final String? refreshToken;

  static Oauth2TokenRequest fromJson(Map<String, dynamic> json) =>
      Oauth2TokenRequestMapper.ensureInitialized()
          .decodeMap<Oauth2TokenRequest>(json);
}
