// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dart_mappable/dart_mappable.dart';

part 'access_type.mapper.dart';

/// Indicates the type of access required
@MappableEnum(defaultValue: 'unknown')
enum AccessType {
  @MappableValue('online') 
  online,

  @MappableValue('offline') 
  offline,

  @MappableValue('unknown') 
  unknown;

}
