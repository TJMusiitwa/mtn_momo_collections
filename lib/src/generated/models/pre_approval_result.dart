// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

import 'error_reason.dart';
import 'party.dart';
import 'pre_approval_result_status.dart';

part 'pre_approval_result.mapper.dart';

@MappableClass()
class PreApprovalResult with PreApprovalResultMappable {
  const PreApprovalResult({
    this.payer,
    this.payerCurrency,
    this.payerMessage,
    this.validityTime,
    this.status,
    this.reason,
  });
  final Party? payer;
  /// ISO4217 Currency
  final String? payerCurrency;
  /// The mesage that is shown to the approver.
  final String? payerMessage;
  /// The request validity time of the pre-approval
  final int? validityTime;
  final PreApprovalResultStatus? status;
  final ErrorReason? reason;


  static PreApprovalResult fromJson(Map<String, dynamic> json) => PreApprovalResultMapper.ensureInitialized().decodeMap<PreApprovalResult>(json);

}

