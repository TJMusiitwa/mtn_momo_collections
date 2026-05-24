// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'token_post200_application_json_response.mapper.dart';

@MappableClass()
class TokenPost200ApplicationJsonResponse with TokenPost200ApplicationJsonResponseMappable {
  const TokenPost200ApplicationJsonResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });
  /// A JWT token which can be used to authrize against the other API end-points. The format of the token follows the JWT standard format (see jwt.io for an example). This is the token that should be sent in in the Authorization header when calling the other API end-points.
  @MappableField(key: 'access_token')
  final String? accessToken;
  /// The token type.
  @MappableField(key: 'token_type')
  final String? tokenType;
  /// The validity time in seconds of the token.
  @MappableField(key: 'expires_in')
  final int? expiresIn;


  static TokenPost200ApplicationJsonResponse fromJson(Map<String, dynamic> json) => TokenPost200ApplicationJsonResponseMapper.ensureInitialized().decodeMap<TokenPost200ApplicationJsonResponse>(json);

}

