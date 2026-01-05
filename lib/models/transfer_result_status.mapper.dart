// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transfer_result_status.dart';

class TransferResultStatusMapper extends EnumMapper<TransferResultStatus> {
  TransferResultStatusMapper._();

  static TransferResultStatusMapper? _instance;
  static TransferResultStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransferResultStatusMapper._());
    }
    return _instance!;
  }

  static TransferResultStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TransferResultStatus decode(dynamic value) {
    switch (value) {
      case 'PENDING':
        return TransferResultStatus.pending;
      case 'SUCCESSFUL':
        return TransferResultStatus.successful;
      case 'FAILED':
        return TransferResultStatus.failed;
      case 'unknown':
        return TransferResultStatus.unknown;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TransferResultStatus self) {
    switch (self) {
      case TransferResultStatus.pending:
        return 'PENDING';
      case TransferResultStatus.successful:
        return 'SUCCESSFUL';
      case TransferResultStatus.failed:
        return 'FAILED';
      case TransferResultStatus.unknown:
        return 'unknown';
    }
  }
}

extension TransferResultStatusMapperExtension on TransferResultStatus {
  dynamic toValue() {
    TransferResultStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TransferResultStatus>(this);
  }
}

