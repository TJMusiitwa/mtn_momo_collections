// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

part 'bcauthorize_response.mapper.dart';

@MappableClass()
class BcauthorizeResponse with BcauthorizeResponseMappable {

  const BcauthorizeResponse({
    this.authReqId,
    this.interval,
    this.expiresIn,
  });
  @MappableField(key: 'auth_req_id')
  final String? authReqId;
  final num? interval;
  @MappableField(key: 'expires_in')
  final num? expiresIn;


  static BcauthorizeResponse fromJson(Map<String, dynamic> json) => BcauthorizeResponseMapper.ensureInitialized().decodeMap<BcauthorizeResponse>(json);
}
