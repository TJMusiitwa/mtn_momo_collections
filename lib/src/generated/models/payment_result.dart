// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
  /// The reference id for this Payment.
  final String? referenceId;
  final PaymentResultStatus? status;
  /// A transaction id associated with this payment.
  final String? financialTransactionId;
  final ErrorReason? reason;


  static PaymentResult fromJson(Map<String, dynamic> json) => PaymentResultMapper.ensureInitialized().decodeMap<PaymentResult>(json);

}

