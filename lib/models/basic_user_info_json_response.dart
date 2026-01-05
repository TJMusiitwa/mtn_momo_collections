// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

part 'basic_user_info_json_response.mapper.dart';

@MappableClass()
class BasicUserInfoJsonResponse with BasicUserInfoJsonResponseMappable {

  const BasicUserInfoJsonResponse({
    this.givenName,
    this.familyName,
    this.birthdate,
    this.locale,
    this.gender,
    this.status,
  });
  @MappableField(key: 'given_name')
  final String? givenName;
  @MappableField(key: 'family_name')
  final String? familyName;
  final String? birthdate;
  final String? locale;
  final String? gender;
  final String? status;


  static BasicUserInfoJsonResponse fromJson(Map<String, dynamic> json) => BasicUserInfoJsonResponseMapper.ensureInitialized().decodeMap<BasicUserInfoJsonResponse>(json);
}
