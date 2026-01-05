// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pre_approval_result_status.dart';

class PreApprovalResultStatusMapper
    extends EnumMapper<PreApprovalResultStatus> {
  PreApprovalResultStatusMapper._();

  static PreApprovalResultStatusMapper? _instance;
  static PreApprovalResultStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = PreApprovalResultStatusMapper._(),
      );
    }
    return _instance!;
  }

  static PreApprovalResultStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PreApprovalResultStatus decode(dynamic value) {
    switch (value) {
      case 'PENDING':
        return PreApprovalResultStatus.pending;
      case 'SUCCESSFUL':
        return PreApprovalResultStatus.successful;
      case 'FAILED':
        return PreApprovalResultStatus.failed;
      case 'unknown':
        return PreApprovalResultStatus.unknown;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PreApprovalResultStatus self) {
    switch (self) {
      case PreApprovalResultStatus.pending:
        return 'PENDING';
      case PreApprovalResultStatus.successful:
        return 'SUCCESSFUL';
      case PreApprovalResultStatus.failed:
        return 'FAILED';
      case PreApprovalResultStatus.unknown:
        return 'unknown';
    }
  }
}

extension PreApprovalResultStatusMapperExtension on PreApprovalResultStatus {
  dynamic toValue() {
    PreApprovalResultStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PreApprovalResultStatus>(this);
  }
}

