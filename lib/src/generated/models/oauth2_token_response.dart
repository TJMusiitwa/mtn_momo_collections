// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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

  /// Oauth2 JWT access token.The generated token is valid 3600 seconds as default.
  @MappableField(key: 'access_token')
  final String? accessToken;

  /// Value is Bearer
  @MappableField(key: 'token_type')
  final String? tokenType;

  /// Shows when the authentication request ID expires, in seconds.
  @MappableField(key: 'expires_in')
  final num? expiresIn;

  /// List of scopes that belongs to the authentication request ID.
  final String? scope;

  /// UUID of the refresh_token
  @MappableField(key: 'refresh_token')
  final String? refreshToken;

  /// The time in seconds until the consent can no longer be refreshed. Based on the default value for consent validity, or the value set to parameter consent_valid_in sent in the bc-authorize request.
  @MappableField(key: 'refresh_token_expired_in')
  final int? refreshTokenExpiredIn;

  static Oauth2TokenResponse fromJson(Map<String, dynamic> json) =>
      Oauth2TokenResponseMapper.ensureInitialized()
          .decodeMap<Oauth2TokenResponse>(json);
}
