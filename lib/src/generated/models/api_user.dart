// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'api_user.mapper.dart';

/// The create API user information
@MappableClass()
class ApiUser with ApiUserMappable {
  const ApiUser({
    this.providerCallbackHost,
  });
  /// The provider callback host
  final String? providerCallbackHost;


  static ApiUser fromJson(Map<String, dynamic> json) => ApiUserMapper.ensureInitialized().decodeMap<ApiUser>(json);

}

