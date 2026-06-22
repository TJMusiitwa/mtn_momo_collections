// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

import 'cash_transfer_payer_identification_type.dart';
import 'party.dart';

part 'cash_transfer.mapper.dart';

@MappableClass()
class CashTransfer with CashTransferMappable {
  const CashTransfer({
    this.amount,
    this.currency,
    this.payee,
    this.externalId,
    this.orginatingCountry,
    this.originalAmount,
    this.originalCurrency,
    this.payerMessage,
    this.payeeNote,
    this.payerIdentificationType,
    this.payerIdentificationNumber,
    this.payerIdentity,
    this.payerFirstName,
    this.payerSurName,
    this.payerLanguageCode,
    this.payerEmail,
    this.payerMsisdn,
    this.payerGender,
  });

  /// Amount that will be debited from the payer account.
  final String? amount;

  /// ISO4217 Currency
  final String? currency;
  final Party? payee;

  /// External id is used as a reference to the transaction. External id is used for reconciliation. The external id will be included in transaction history report. <br>External id is not required to be unique.
  final String? externalId;

  /// Country where the request came from
  final String? orginatingCountry;

  /// Amount that was sent before any foreign exchange
  final String? originalAmount;

  /// ISO4217 Currency of the originalAmoun
  final String? originalCurrency;

  /// Message that will be written in the payer transaction history message field.
  final String? payerMessage;

  /// Message that will be written in the payee transaction history note field.
  final String? payeeNote;

  /// Identification type of the payer
  final CashTransferPayerIdentificationType? payerIdentificationType;

  /// Identification number of the payer
  final String? payerIdentificationNumber;

  /// Identification of the payer
  final String? payerIdentity;

  /// FirstName
  final String? payerFirstName;

  /// Surname
  final String? payerSurName;

  /// LanguageCode
  final String? payerLanguageCode;

  /// Email
  final String? payerEmail;

  /// Msisdn
  final String? payerMsisdn;

  /// GenderCode according to ISO 20022
  final String? payerGender;

  static CashTransfer fromJson(Map<String, dynamic> json) =>
      CashTransferMapper.ensureInitialized().decodeMap<CashTransfer>(json);
}
