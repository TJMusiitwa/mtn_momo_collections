// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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

  /// Amount that will be debited from the payer account.
  final String? amount;

  /// ISO4217 Currency
  final String? currency;

  /// Financial transactionIdd from mobile money manager.<br> Used to connect to the specific financial transaction made in the account
  final String? financialTransactionId;

  /// External id provided in the creation of the requestToPay transaction.
  final String? externalId;
  final Party? payer;

  /// Message that will be written in the payer transaction history message field.
  final String? payerMessage;

  /// Message that will be written in the payee transaction history note field.
  final String? payeeNote;
  final RequestToPayResultStatus? status;
  final ErrorReason? reason;

  static RequestToPayResult fromJson(Map<String, dynamic> json) =>
      RequestToPayResultMapper.ensureInitialized()
          .decodeMap<RequestToPayResult>(json);
}
