// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

import 'error_reason.dart';
import 'party.dart';
import 'cash_transfer_result_status.dart';

part 'cash_transfer_result.mapper.dart';

@MappableClass()
class CashTransferResult with CashTransferResultMappable {
  const CashTransferResult({
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

  /// Amount that was transferred.
  final String? amount;

  /// ISO4217 Currency
  final String? currency;

  /// Financial transaction ID from mobile money manager.
  /// Used to connect to the specific financial transaction made in the account.
  final String? financialTransactionId;

  /// External id is used as a reference to the transaction. External id is used for reconciliation.
  final String? externalId;

  final Party? payee;

  /// Message that was written in the payer transaction history message field.
  final String? payerMessage;

  /// Message that was written in the payee transaction history note field.
  final String? payeeNote;

  final CashTransferResultStatus? status;

  final ErrorReason? reason;

  static CashTransferResult fromJson(Map<String, dynamic> json) =>
      CashTransferResultMapper.ensureInitialized()
          .decodeMap<CashTransferResult>(json);
}
