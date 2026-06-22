// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'bcauthorize_access_type.mapper.dart';

/// Value either online, or offline.
@MappableEnum(defaultValue: BcauthorizeAccessType.unknown)
enum BcauthorizeAccessType {
  @MappableValue('online')
  online,

  @MappableValue('offline')
  offline,

  @MappableValue('unknown')
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<BcauthorizeAccessType> get $valuesDefined =>
      values.where((value) => value != BcauthorizeAccessType.unknown).toList();
}
