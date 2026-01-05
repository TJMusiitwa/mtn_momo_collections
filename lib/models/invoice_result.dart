// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'error_reason.dart';
import 'invoice_result_status.dart';
import 'party.dart';

part 'invoice_result.mapper.dart';

@MappableClass()
class InvoiceResult with InvoiceResultMappable {

  const InvoiceResult({
    this.referenceId,
    this.externalId,
    this.amount,
    this.currency,
    this.status,
    this.paymentReference,
    this.invoiceId,
    this.expiryDateTime,
    this.payeeFirstName,
    this.payeeLastName,
    this.errorReason,
    this.intendedPayer,
    this.description,
  });
  final String? referenceId;
  final String? externalId;
  final String? amount;
  final String? currency;
  final InvoiceResultStatus? status;
  final String? paymentReference;
  final String? invoiceId;
  final String? expiryDateTime;
  final String? payeeFirstName;
  final String? payeeLastName;
  final ErrorReason? errorReason;
  final Party? intendedPayer;
  final String? description;


  static InvoiceResult fromJson(Map<String, dynamic> json) => InvoiceResultMapper.ensureInitialized().decodeMap<InvoiceResult>(json);
}
