// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'bcauthorize_response.mapper.dart';

@MappableClass()
class BcauthorizeResponse with BcauthorizeResponseMappable {
  const BcauthorizeResponse({
    this.authReqId,
    this.interval,
    this.expiresIn,
  });
  /// Authentication request ID as an UUID.
  @MappableField(key: 'auth_req_id')
  final String? authReqId;
  /// Indicates how long time the client should wait between retries towards the endpoint /oauth2/token.
  final num? interval;
  /// Shows when the authentication request ID expires, in seconds.
  @MappableField(key: 'expires_in')
  final num? expiresIn;


  static BcauthorizeResponse fromJson(Map<String, dynamic> json) => BcauthorizeResponseMapper.ensureInitialized().decodeMap<BcauthorizeResponse>(json);

}

