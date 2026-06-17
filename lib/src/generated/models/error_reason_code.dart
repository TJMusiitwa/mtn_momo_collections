// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'error_reason_code.mapper.dart';

@MappableEnum(defaultValue: ErrorReasonCode.unknown)
enum ErrorReasonCode {
  @MappableValue('PAYEE_NOT_FOUND') 
  payeeNotFound,

  @MappableValue('PAYER_NOT_FOUND') 
  payerNotFound,

  @MappableValue('NOT_ALLOWED') 
  notAllowed,

  @MappableValue('NOT_ALLOWED_TARGET_ENVIRONMENT') 
  notAllowedTargetEnvironment,

  @MappableValue('INVALID_CALLBACK_URL_HOST') 
  invalidCallbackUrlHost,

  @MappableValue('INVALID_CURRENCY') 
  invalidCurrency,

  @MappableValue('SERVICE_UNAVAILABLE') 
  serviceUnavailable,

  @MappableValue('INTERNAL_PROCESSING_ERROR') 
  internalProcessingError,

  @MappableValue('NOT_ENOUGH_FUNDS') 
  notEnoughFunds,

  @MappableValue('PAYER_LIMIT_REACHED') 
  payerLimitReached,

  @MappableValue('PAYEE_NOT_ALLOWED_TO_RECEIVE') 
  payeeNotAllowedToReceive,

  @MappableValue('PAYMENT_NOT_APPROVED') 
  paymentNotApproved,

  @MappableValue('RESOURCE_NOT_FOUND') 
  resourceNotFound,

  @MappableValue('APPROVAL_REJECTED') 
  approvalRejected,

  @MappableValue('EXPIRED') 
  expired,

  /// Incorrect name has been replaced. Original name: `TRANSACTION_CANCELED.`.
  @MappableValue('TRANSACTION_CANCELED.') 
  undefined0,

  @MappableValue('RESOURCE_ALREADY_EXIST') 
  resourceAlreadyExist,

  @MappableValue('TRANSACTION_NOT_COMPLETED') 
  transactionNotCompleted,

  @MappableValue('TRANSACTION_NOT_FOUND') 
  transactionNotFound,

  @MappableValue('INFORMATIONAL_SCOPE_INSTRUCTION') 
  informationalScopeInstruction,

  @MappableValue('MISSING_SCOPE_INSTRUCTION') 
  missingScopeInstruction,

  @MappableValue('MORE_THAN_ONE_FINANCIAL_SCOPE_NOT_SUPPORTED') 
  moreThanOneFinancialScopeNotSupported,

  @MappableValue('UNSUPPORTED_SCOPE_COMBINATION') 
  unsupportedScopeCombination,

  @MappableValue('CONSENT_MISMATCH') 
  consentMismatch,

  @MappableValue('UNSUPPORTED_SCOPE') 
  unsupportedScope,

  @MappableValue('NOT_FOUND') 
  notFound,

  @MappableValue('unknown') 
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<ErrorReasonCode> get $valuesDefined => values.where((value) => value != ErrorReasonCode.unknown).toList();
}
