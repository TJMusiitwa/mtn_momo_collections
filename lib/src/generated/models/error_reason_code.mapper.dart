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
      case 'RESOURCE_NOT_FOUND':
        return ErrorReasonCode.resourceNotFound;
      case 'RESOURCE_ALREADY_EXIST':
        return ErrorReasonCode.resourceAlreadyExist;
      case 'unknown':
        return ErrorReasonCode.unknown;
      default:
        return ErrorReasonCode.values[2];
    }
  }

  @override
  dynamic encode(ErrorReasonCode self) {
    switch (self) {
      case ErrorReasonCode.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case ErrorReasonCode.resourceAlreadyExist:
        return 'RESOURCE_ALREADY_EXIST';
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

