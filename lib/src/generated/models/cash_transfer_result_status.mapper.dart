// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cash_transfer_result_status.dart';

class CashTransferResultStatusMapper
    extends EnumMapper<CashTransferResultStatus> {
  CashTransferResultStatusMapper._();

  static CashTransferResultStatusMapper? _instance;
  static CashTransferResultStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = CashTransferResultStatusMapper._(),
      );
    }
    return _instance!;
  }

  static CashTransferResultStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CashTransferResultStatus decode(dynamic value) {
    switch (value) {
      case 'PENDING':
        return CashTransferResultStatus.pending;
      case 'SUCCESSFUL':
        return CashTransferResultStatus.successful;
      case 'FAILED':
        return CashTransferResultStatus.failed;
      case 'unknown':
        return CashTransferResultStatus.unknown;
      default:
        return CashTransferResultStatus.values[3];
    }
  }

  @override
  dynamic encode(CashTransferResultStatus self) {
    switch (self) {
      case CashTransferResultStatus.pending:
        return 'PENDING';
      case CashTransferResultStatus.successful:
        return 'SUCCESSFUL';
      case CashTransferResultStatus.failed:
        return 'FAILED';
      case CashTransferResultStatus.unknown:
        return 'unknown';
    }
  }
}

extension CashTransferResultStatusMapperExtension on CashTransferResultStatus {
  dynamic toValue() {
    CashTransferResultStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CashTransferResultStatus>(this);
  }
}

