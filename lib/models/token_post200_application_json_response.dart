// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

part 'token_post200_application_json_response.mapper.dart';

@MappableClass()
class TokenPost200ApplicationJsonResponse with TokenPost200ApplicationJsonResponseMappable {

  const TokenPost200ApplicationJsonResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });
  @MappableField(key: 'access_token')
  final String? accessToken;
  @MappableField(key: 'token_type')
  final String? tokenType;
  @MappableField(key: 'expires_in')
  final int? expiresIn;


  static TokenPost200ApplicationJsonResponse fromJson(Map<String, dynamic> json) => TokenPost200ApplicationJsonResponseMapper.ensureInitialized().decodeMap<TokenPost200ApplicationJsonResponse>(json);
}
