// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

import 'party.dart';

part 'request_to_pay.mapper.dart';

@MappableClass()
class RequestToPay with RequestToPayMappable {
  const RequestToPay({
    this.amount,
    this.currency,
    this.externalId,
    this.payer,
    this.payerMessage,
    this.payeeNote,
  });
  /// Amount that will be debited from the payer account.
  final String? amount;
  /// ISO4217 Currency
  final String? currency;
  /// External id is used as a reference to the transaction. External id is used for reconciliation. The external id will be included in transaction history report. <br>External id is not required to be unique.
  final String? externalId;
  final Party? payer;
  /// Message that will be written in the payer transaction history message field.
  final String? payerMessage;
  /// Message that will be written in the payee transaction history note field.
  final String? payeeNote;


  static RequestToPay fromJson(Map<String, dynamic> json) => RequestToPayMapper.ensureInitialized().decodeMap<RequestToPay>(json);

}

