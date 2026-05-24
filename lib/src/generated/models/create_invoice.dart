// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

import 'party.dart';

part 'create_invoice.mapper.dart';

@MappableClass()
class CreateInvoice with CreateInvoiceMappable {
  const CreateInvoice({
    this.externalId,
    this.amount,
    this.currency,
    this.validityDuration,
    this.intendedPayer,
    this.payee,
    this.description,
  });
  /// External id is used as a reference to the transaction. External id is used for reconciliation. The external id will be included in transaction history report. <br>External id is not required to be unique.
  final String? externalId;
  /// Amount that will be debited from the payer account.
  final String? amount;
  /// ISO4217 Currency
  final String? currency;
  /// ValidityTime - The duration that the invoice is valid in seconds.
  final String? validityDuration;
  final Party? intendedPayer;
  final Party? payee;
  /// Message that will be written in the payer transaction history message field.
  final String? description;


  static CreateInvoice fromJson(Map<String, dynamic> json) => CreateInvoiceMapper.ensureInitialized().decodeMap<CreateInvoice>(json);

}

