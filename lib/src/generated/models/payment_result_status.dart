// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'payment_result_status.mapper.dart';

@MappableEnum(defaultValue: PaymentResultStatus.unknown)
enum PaymentResultStatus {
  @MappableValue('CREATED') 
  created,

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
  static List<PaymentResultStatus> get $valuesDefined => values.where((value) => value != PaymentResultStatus.unknown).toList();
}
