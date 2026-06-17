// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'error_reason_code.dart';

class ErrorReasonCodeMapper extends EnumMapper<ErrorReasonCode> {
  ErrorReasonCodeMapper._();

  static ErrorReasonCodeMapper? _instance;
  static ErrorReasonCodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorReasonCodeMapper._());
    }
    return _instance!;
  }

  static ErrorReasonCode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ErrorReasonCode decode(dynamic value) {
    switch (value) {
      case 'PAYEE_NOT_FOUND':
        return ErrorReasonCode.payeeNotFound;
      case 'PAYER_NOT_FOUND':
        return ErrorReasonCode.payerNotFound;
      case 'NOT_ALLOWED':
        return ErrorReasonCode.notAllowed;
      case 'NOT_ALLOWED_TARGET_ENVIRONMENT':
        return ErrorReasonCode.notAllowedTargetEnvironment;
      case 'INVALID_CALLBACK_URL_HOST':
        return ErrorReasonCode.invalidCallbackUrlHost;
      case 'INVALID_CURRENCY':
        return ErrorReasonCode.invalidCurrency;
      case 'SERVICE_UNAVAILABLE':
        return ErrorReasonCode.serviceUnavailable;
      case 'INTERNAL_PROCESSING_ERROR':
        return ErrorReasonCode.internalProcessingError;
      case 'NOT_ENOUGH_FUNDS':
        return ErrorReasonCode.notEnoughFunds;
      case 'PAYER_LIMIT_REACHED':
        return ErrorReasonCode.payerLimitReached;
      case 'PAYEE_NOT_ALLOWED_TO_RECEIVE':
        return ErrorReasonCode.payeeNotAllowedToReceive;
      case 'PAYMENT_NOT_APPROVED':
        return ErrorReasonCode.paymentNotApproved;
      case 'RESOURCE_NOT_FOUND':
        return ErrorReasonCode.resourceNotFound;
      case 'APPROVAL_REJECTED':
        return ErrorReasonCode.approvalRejected;
      case 'EXPIRED':
        return ErrorReasonCode.expired;
      case 'TRANSACTION_CANCELED.':
        return ErrorReasonCode.undefined0;
      case 'RESOURCE_ALREADY_EXIST':
        return ErrorReasonCode.resourceAlreadyExist;
      case 'TRANSACTION_NOT_COMPLETED':
        return ErrorReasonCode.transactionNotCompleted;
      case 'TRANSACTION_NOT_FOUND':
        return ErrorReasonCode.transactionNotFound;
      case 'INFORMATIONAL_SCOPE_INSTRUCTION':
        return ErrorReasonCode.informationalScopeInstruction;
      case 'MISSING_SCOPE_INSTRUCTION':
        return ErrorReasonCode.missingScopeInstruction;
      case 'MORE_THAN_ONE_FINANCIAL_SCOPE_NOT_SUPPORTED':
        return ErrorReasonCode.moreThanOneFinancialScopeNotSupported;
      case 'UNSUPPORTED_SCOPE_COMBINATION':
        return ErrorReasonCode.unsupportedScopeCombination;
      case 'CONSENT_MISMATCH':
        return ErrorReasonCode.consentMismatch;
      case 'UNSUPPORTED_SCOPE':
        return ErrorReasonCode.unsupportedScope;
      case 'NOT_FOUND':
        return ErrorReasonCode.notFound;
      case 'unknown':
        return ErrorReasonCode.unknown;
      default:
        return ErrorReasonCode.values[26];
    }
  }

  @override
  dynamic encode(ErrorReasonCode self) {
    switch (self) {
      case ErrorReasonCode.payeeNotFound:
        return 'PAYEE_NOT_FOUND';
      case ErrorReasonCode.payerNotFound:
        return 'PAYER_NOT_FOUND';
      case ErrorReasonCode.notAllowed:
        return 'NOT_ALLOWED';
      case ErrorReasonCode.notAllowedTargetEnvironment:
        return 'NOT_ALLOWED_TARGET_ENVIRONMENT';
      case ErrorReasonCode.invalidCallbackUrlHost:
        return 'INVALID_CALLBACK_URL_HOST';
      case ErrorReasonCode.invalidCurrency:
        return 'INVALID_CURRENCY';
      case ErrorReasonCode.serviceUnavailable:
        return 'SERVICE_UNAVAILABLE';
      case ErrorReasonCode.internalProcessingError:
        return 'INTERNAL_PROCESSING_ERROR';
      case ErrorReasonCode.notEnoughFunds:
        return 'NOT_ENOUGH_FUNDS';
      case ErrorReasonCode.payerLimitReached:
        return 'PAYER_LIMIT_REACHED';
      case ErrorReasonCode.payeeNotAllowedToReceive:
        return 'PAYEE_NOT_ALLOWED_TO_RECEIVE';
      case ErrorReasonCode.paymentNotApproved:
        return 'PAYMENT_NOT_APPROVED';
      case ErrorReasonCode.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case ErrorReasonCode.approvalRejected:
        return 'APPROVAL_REJECTED';
      case ErrorReasonCode.expired:
        return 'EXPIRED';
      case ErrorReasonCode.undefined0:
        return 'TRANSACTION_CANCELED.';
      case ErrorReasonCode.resourceAlreadyExist:
        return 'RESOURCE_ALREADY_EXIST';
      case ErrorReasonCode.transactionNotCompleted:
        return 'TRANSACTION_NOT_COMPLETED';
      case ErrorReasonCode.transactionNotFound:
        return 'TRANSACTION_NOT_FOUND';
      case ErrorReasonCode.informationalScopeInstruction:
        return 'INFORMATIONAL_SCOPE_INSTRUCTION';
      case ErrorReasonCode.missingScopeInstruction:
        return 'MISSING_SCOPE_INSTRUCTION';
      case ErrorReasonCode.moreThanOneFinancialScopeNotSupported:
        return 'MORE_THAN_ONE_FINANCIAL_SCOPE_NOT_SUPPORTED';
      case ErrorReasonCode.unsupportedScopeCombination:
        return 'UNSUPPORTED_SCOPE_COMBINATION';
      case ErrorReasonCode.consentMismatch:
        return 'CONSENT_MISMATCH';
      case ErrorReasonCode.unsupportedScope:
        return 'UNSUPPORTED_SCOPE';
      case ErrorReasonCode.notFound:
        return 'NOT_FOUND';
      case ErrorReasonCode.unknown:
        return 'unknown';
    }
  }
}

extension ErrorReasonCodeMapperExtension on ErrorReasonCode {
  dynamic toValue() {
    ErrorReasonCodeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ErrorReasonCode>(this);
  }
}

