// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


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
    this.status,
    this.expirationDateTime,
    this.reason,
  });
  final Party? payer;
  final String? payerCurrency;
  final String? payerMessage;
  final PreApprovalResultStatus? status;
  final int? expirationDateTime;
  final ErrorReason? reason;


  static PreApprovalResult fromJson(Map<String, dynamic> json) => PreApprovalResultMapper.ensureInitialized().decodeMap<PreApprovalResult>(json);
}
