// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pre_approval_details_status.dart';

class PreApprovalDetailsStatusMapper
    extends EnumMapper<PreApprovalDetailsStatus> {
  PreApprovalDetailsStatusMapper._();

  static PreApprovalDetailsStatusMapper? _instance;
  static PreApprovalDetailsStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = PreApprovalDetailsStatusMapper._(),
      );
    }
    return _instance!;
  }

  static PreApprovalDetailsStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PreApprovalDetailsStatus decode(dynamic value) {
    switch (value) {
      case 'APPROVED':
        return PreApprovalDetailsStatus.approved;
      case 'CANCELLED':
        return PreApprovalDetailsStatus.cancelled;
      case 'EXPIRED':
        return PreApprovalDetailsStatus.expired;
      case 'REJECTED':
        return PreApprovalDetailsStatus.rejected;
      case 'PENDING':
        return PreApprovalDetailsStatus.pending;
      case 'unknown':
        return PreApprovalDetailsStatus.unknown;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PreApprovalDetailsStatus self) {
    switch (self) {
      case PreApprovalDetailsStatus.approved:
        return 'APPROVED';
      case PreApprovalDetailsStatus.cancelled:
        return 'CANCELLED';
      case PreApprovalDetailsStatus.expired:
        return 'EXPIRED';
      case PreApprovalDetailsStatus.rejected:
        return 'REJECTED';
      case PreApprovalDetailsStatus.pending:
        return 'PENDING';
      case PreApprovalDetailsStatus.unknown:
        return 'unknown';
    }
  }
}

extension PreApprovalDetailsStatusMapperExtension on PreApprovalDetailsStatus {
  dynamic toValue() {
    PreApprovalDetailsStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PreApprovalDetailsStatus>(this);
  }
}

