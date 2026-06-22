// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'pre_approval_details_frequency.mapper.dart';

@MappableEnum(defaultValue: PreApprovalDetailsFrequency.unknown)
enum PreApprovalDetailsFrequency {
  @MappableValue('DAILY')
  daily,

  @MappableValue('MONTHLY')
  monthly,

  @MappableValue('WEEKLY')
  weekly,

  @MappableValue('unknown')
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<PreApprovalDetailsFrequency> get $valuesDefined => values
      .where((value) => value != PreApprovalDetailsFrequency.unknown)
      .toList();
}
