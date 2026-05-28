// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'transfer_result_status.mapper.dart';

@MappableEnum(defaultValue: TransferResultStatus.unknown)
enum TransferResultStatus {
  @MappableValue('PENDING') 
  pending,

  @MappableValue('SUCCESSFUL') 
  successful,

  @MappableValue('FAILED') 
  failed,

  @MappableValue('unknown') 
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<TransferResultStatus> get $valuesDefined => values.where((value) => value != TransferResultStatus.unknown).toList();
}
