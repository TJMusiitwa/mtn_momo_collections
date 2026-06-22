// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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

  /// The reference id for this invoice.
  final String? referenceId;

  /// An external transaction id to tie to the payment.
  final String? externalId;

  /// A positive amount for this invoice.
  final String? amount;

  /// ISO4217 Currency - The currency used in this invoice.
  final String? currency;
  final InvoiceResultStatus? status;

  /// A unique id that identifies a pending invoice.
  final String? paymentReference;

  /// An id for the invoice.
  final String? invoiceId;

  /// DateTime for when invoice expires, in YYYY-MM-DD:THH:mm:ss format.
  final String? expiryDateTime;

  /// First name of the payee in this invoice.
  final String? payeeFirstName;

  /// Surname of the payee in this invoice
  final String? payeeLastName;
  final ErrorReason? errorReason;
  final Party? intendedPayer;

  /// An optional description of the invoice.
  final String? description;

  static InvoiceResult fromJson(Map<String, dynamic> json) =>
      InvoiceResultMapper.ensureInitialized().decodeMap<InvoiceResult>(json);
}
