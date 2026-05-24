// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'boolean_result.mapper.dart';

@MappableClass()
class BooleanResult with BooleanResultMappable {
  const BooleanResult({
    this.result,
  });
  final bool? result;


  static BooleanResult fromJson(Map<String, dynamic> json) => BooleanResultMapper.ensureInitialized().decodeMap<BooleanResult>(json);

}

