// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pre_approval_details_frequency.dart';

class PreApprovalDetailsFrequencyMapper
    extends EnumMapper<PreApprovalDetailsFrequency> {
  PreApprovalDetailsFrequencyMapper._();

  static PreApprovalDetailsFrequencyMapper? _instance;
  static PreApprovalDetailsFrequencyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = PreApprovalDetailsFrequencyMapper._(),
      );
    }
    return _instance!;
  }

  static PreApprovalDetailsFrequency fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PreApprovalDetailsFrequency decode(dynamic value) {
    switch (value) {
      case 'DAILY':
        return PreApprovalDetailsFrequency.daily;
      case 'MONTHLY':
        return PreApprovalDetailsFrequency.monthly;
      case 'WEEKLY':
        return PreApprovalDetailsFrequency.weekly;
      case 'unknown':
        return PreApprovalDetailsFrequency.unknown;
      default:
        return PreApprovalDetailsFrequency.values[3];
    }
  }

  @override
  dynamic encode(PreApprovalDetailsFrequency self) {
    switch (self) {
      case PreApprovalDetailsFrequency.daily:
        return 'DAILY';
      case PreApprovalDetailsFrequency.monthly:
        return 'MONTHLY';
      case PreApprovalDetailsFrequency.weekly:
        return 'WEEKLY';
      case PreApprovalDetailsFrequency.unknown:
        return 'unknown';
    }
  }
}

extension PreApprovalDetailsFrequencyMapperExtension
    on PreApprovalDetailsFrequency {
  dynamic toValue() {
    PreApprovalDetailsFrequencyMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PreApprovalDetailsFrequency>(this);
  }
}

