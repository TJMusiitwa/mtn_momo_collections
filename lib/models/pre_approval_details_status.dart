// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dart_mappable/dart_mappable.dart';

part 'pre_approval_details_status.mapper.dart';

@MappableEnum(defaultValue: 'unknown')
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

}
