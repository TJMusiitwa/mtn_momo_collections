// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'target_environment.mapper.dart';

@MappableClass()
class TargetEnvironment with TargetEnvironmentMappable {
  const TargetEnvironment({this.apiKey});

  /// The target environment
  final String? apiKey;

  static TargetEnvironment fromJson(Map<String, dynamic> json) =>
      TargetEnvironmentMapper.ensureInitialized().decodeMap<TargetEnvironment>(
        json,
      );
}
