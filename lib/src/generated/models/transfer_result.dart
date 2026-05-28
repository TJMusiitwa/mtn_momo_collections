// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
  /// Amount that will be debited from the payer account.
  final String? amount;
  /// ISO4217 Currency
  final String? currency;
  /// Financial transactionIdd from mobile money manager.<br> Used to connect to the specific financial transaction made in the account
  final String? financialTransactionId;
  /// External id is used as a reference to the transaction. External id is used for reconciliation. The external id will be included in transaction history report. <br>External id is not required to be unique.
  final String? externalId;
  final Party? payee;
  /// Message that will be written in the payer transaction history message field.
  final String? payerMessage;
  /// Message that will be written in the payee transaction history note field.
  final String? payeeNote;
  final TransferResultStatus? status;
  final ErrorReason? reason;


  static TransferResult fromJson(Map<String, dynamic> json) => TransferResultMapper.ensureInitialized().decodeMap<TransferResult>(json);

}

