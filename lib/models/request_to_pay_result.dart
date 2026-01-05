// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'error_reason.dart';
import 'party.dart';
import 'request_to_pay_result_status.dart';

part 'request_to_pay_result.mapper.dart';

@MappableClass()
class RequestToPayResult with RequestToPayResultMappable {

  const RequestToPayResult({
    this.amount,
    this.currency,
    this.financialTransactionId,
    this.externalId,
    this.payer,
    this.payerMessage,
    this.payeeNote,
    this.status,
    this.reason,
  });
  final String? amount;
  final String? currency;
  final String? financialTransactionId;
  final String? externalId;
  final Party? payer;
  final String? payerMessage;
  final String? payeeNote;
  final RequestToPayResultStatus? status;
  final ErrorReason? reason;


  static RequestToPayResult fromJson(Map<String, dynamic> json) => RequestToPayResultMapper.ensureInitialized().decodeMap<RequestToPayResult>(json);
}
