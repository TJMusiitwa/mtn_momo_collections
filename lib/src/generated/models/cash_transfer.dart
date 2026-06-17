// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

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

  /// External id is used as a reference to the transaction. External id is used for reconciliation.
  /// The external id will be included in transaction history report.
  final String? externalId;

  /// The originating country of the transfer (ISO 3166-1 alpha-2 country code).
  final String? orginatingCountry;

  /// The original amount in the originating country's currency before conversion.
  final String? originalAmount;

  /// The original currency (ISO4217) before conversion.
  final String? originalCurrency;

  /// Message that will be written in the payer transaction history message field.
  final String? payerMessage;

  /// Message that will be written in the payee transaction history note field.
  final String? payeeNote;

  /// The payer identification type (e.g. PassportNumber, NationalIdCard, DriversLicense, etc.)
  final String? payerIdentificationType;

  /// The payer identification number.
  final String? payerIdentificationNumber;

  /// The full identity string of the payer.
  final String? payerIdentity;

  /// First name of the payer.
  final String? payerFirstName;

  /// Surname of the payer.
  final String? payerSurName;

  /// Language code of the payer (ISO 639-1).
  final String? payerLanguageCode;

  /// Email address of the payer.
  final String? payerEmail;

  /// MSISDN (mobile number) of the payer.
  final String? payerMsisdn;

  /// Gender of the payer.
  final String? payerGender;

  static CashTransfer fromJson(Map<String, dynamic> json) =>
      CashTransferMapper.ensureInitialized().decodeMap<CashTransfer>(json);
}
