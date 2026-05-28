// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'pre_approval_details_status.mapper.dart';

@MappableEnum(defaultValue: PreApprovalDetailsStatus.unknown)
enum PreApprovalDetailsStatus {
  @MappableValue('APPROVED') 
  approved,

  @MappableValue('CANCELLED') 
  cancelled,

  @MappableValue('EXPIRED') 
  expired,

  @MappableValue('REJECTED') 
  rejected,

  @MappableValue('PENDING') 
  pending,

  @MappableValue('unknown') 
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<PreApprovalDetailsStatus> get $valuesDefined => values.where((value) => value != PreApprovalDetailsStatus.unknown).toList();
}
