// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'cash_transfer_result_payer_identification_type.mapper.dart';

/// Identification type of the payer
@MappableEnum(defaultValue: CashTransferResultPayerIdentificationType.unknown)
enum CashTransferResultPayerIdentificationType {
  @MappableValue('PASS')
  pass,

  @MappableValue('CPFA')
  cpfa,

  @MappableValue('SRSSA')
  srssa,

  @MappableValue('NRIN')
  nrin,

  @MappableValue('OTHR')
  othr,

  @MappableValue('DRLC')
  drlc,

  @MappableValue('SOCS')
  socs,

  @MappableValue('AREG')
  areg,

  @MappableValue('IDCD')
  idcd,

  @MappableValue('EMID')
  emid,

  @MappableValue('unknown')
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<CashTransferResultPayerIdentificationType> get $valuesDefined =>
      values
          .where(
            (value) =>
                value != CashTransferResultPayerIdentificationType.unknown,
          )
          .toList();
}
