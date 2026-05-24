// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'refund_result_status.dart';

class RefundResultStatusMapper extends EnumMapper<RefundResultStatus> {
  RefundResultStatusMapper._();

  static RefundResultStatusMapper? _instance;
  static RefundResultStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RefundResultStatusMapper._());
    }
    return _instance!;
  }

  static RefundResultStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RefundResultStatus decode(dynamic value) {
    switch (value) {
      case 'PENDING':
        return RefundResultStatus.pending;
      case 'SUCCESSFUL':
        return RefundResultStatus.successful;
      case 'FAILED':
        return RefundResultStatus.failed;
      case 'unknown':
        return RefundResultStatus.unknown;
      default:
        return RefundResultStatus.values[3];
    }
  }

  @override
  dynamic encode(RefundResultStatus self) {
    switch (self) {
      case RefundResultStatus.pending:
        return 'PENDING';
      case RefundResultStatus.successful:
        return 'SUCCESSFUL';
      case RefundResultStatus.failed:
        return 'FAILED';
      case RefundResultStatus.unknown:
        return 'unknown';
    }
  }
}

extension RefundResultStatusMapperExtension on RefundResultStatus {
  dynamic toValue() {
    RefundResultStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RefundResultStatus>(this);
  }
}

