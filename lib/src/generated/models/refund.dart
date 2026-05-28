// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'refund.mapper.dart';

@MappableClass()
class Refund with RefundMappable {
  const Refund({
    this.amount,
    this.currency,
    this.externalId,
    this.payerMessage,
    this.payeeNote,
    this.referenceIdToRefund,
  });
  /// Amount that will be debited from the payer account.
  final String? amount;
  /// ISO4217 Currency
  final String? currency;
  /// External id is used as a reference to the transaction. External id is used for reconciliation. The external id will be included in transaction history report. <br>External id is not required to be unique.
  final String? externalId;
  /// Message that will be written in the payer transaction history message field.
  final String? payerMessage;
  /// Message that will be written in the payee transaction history note field.
  final String? payeeNote;
  /// Format - UUID. Recource ID of the created refund transaction. This ID is used, for example, validating the status of the‘ ’transaction generated using UUID version 4.
  final String? referenceIdToRefund;


  static Refund fromJson(Map<String, dynamic> json) => RefundMapper.ensureInitialized().decodeMap<Refund>(json);

}

