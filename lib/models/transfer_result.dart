// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'error_reason.dart';
import 'party.dart';
import 'transfer_result_status.dart';

part 'transfer_result.mapper.dart';

@MappableClass()
class TransferResult with TransferResultMappable {

  const TransferResult({
    this.amount,
    this.currency,
    this.financialTransactionId,
    this.externalId,
    this.payee,
    this.payerMessage,
    this.payeeNote,
    this.status,
    this.reason,
  });
  final String? amount;
  final String? currency;
  final String? financialTransactionId;
  final String? externalId;
  final Party? payee;
  final String? payerMessage;
  final String? payeeNote;
  final TransferResultStatus? status;
  final ErrorReason? reason;


  static TransferResult fromJson(Map<String, dynamic> json) => TransferResultMapper.ensureInitialized().decodeMap<TransferResult>(json);
}
