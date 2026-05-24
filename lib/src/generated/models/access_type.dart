// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'access_type.mapper.dart';

@MappableEnum(defaultValue: AccessType.unknown)
enum AccessType {
  @MappableValue('online') 
  online,

  @MappableValue('offline') 
  offline,

  @MappableValue('unknown') 
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<AccessType> get $valuesDefined => values.where((value) => value != AccessType.unknown).toList();
}
