// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'error_reason.dart';
import 'payment_result_status.dart';

part 'payment_result.mapper.dart';

@MappableClass()
class PaymentResult with PaymentResultMappable {

  const PaymentResult({
    this.referenceId,
    this.status,
    this.financialTransactionId,
    this.reason,
  });
  final String? referenceId;
  final PaymentResultStatus? status;
  final String? financialTransactionId;
  final ErrorReason? reason;


  static PaymentResult fromJson(Map<String, dynamic> json) => PaymentResultMapper.ensureInitialized().decodeMap<PaymentResult>(json);
}
