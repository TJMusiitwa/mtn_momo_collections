// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'error_reason_code.mapper.dart';

@MappableEnum(defaultValue: ErrorReasonCode.unknown)
enum ErrorReasonCode {
  @MappableValue('RESOURCE_NOT_FOUND')
  resourceNotFound,

  @MappableValue('RESOURCE_ALREADY_EXIST')
  resourceAlreadyExist,

  @MappableValue('unknown')
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<ErrorReasonCode> get $valuesDefined =>
      values.where((value) => value != ErrorReasonCode.unknown).toList();
}
