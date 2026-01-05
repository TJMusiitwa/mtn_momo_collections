// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


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
  final String? externalId;
  final String? amount;
  final String? currency;
  final String? validityDuration;
  final Party? intendedPayer;
  final Party? payee;
  final String? description;


  static CreateInvoice fromJson(Map<String, dynamic> json) => CreateInvoiceMapper.ensureInitialized().decodeMap<CreateInvoice>(json);
}
