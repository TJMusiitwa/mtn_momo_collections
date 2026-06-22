// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'api_user_key_result.mapper.dart';

@MappableClass()
class ApiUserKeyResult with ApiUserKeyResultMappable {
  const ApiUserKeyResult({this.apiKey});

  /// The created API user key
  final String? apiKey;

  static ApiUserKeyResult fromJson(Map<String, dynamic> json) =>
      ApiUserKeyResultMapper.ensureInitialized().decodeMap<ApiUserKeyResult>(
        json,
      );
}
