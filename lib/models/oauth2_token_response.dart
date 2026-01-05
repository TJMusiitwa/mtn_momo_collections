// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

part 'oauth2_token_response.mapper.dart';

@MappableClass()
class Oauth2TokenResponse with Oauth2TokenResponseMappable {

  const Oauth2TokenResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.scope,
    this.refreshToken,
    this.refreshTokenExpiredIn,
  });
  @MappableField(key: 'access_token')
  final String? accessToken;
  @MappableField(key: 'token_type')
  final String? tokenType;
  @MappableField(key: 'expires_in')
  final num? expiresIn;
  final String? scope;
  @MappableField(key: 'refresh_token')
  final String? refreshToken;
  @MappableField(key: 'refresh_token_expired_in')
  final int? refreshTokenExpiredIn;


  static Oauth2TokenResponse fromJson(Map<String, dynamic> json) => Oauth2TokenResponseMapper.ensureInitialized().decodeMap<Oauth2TokenResponse>(json);
}
