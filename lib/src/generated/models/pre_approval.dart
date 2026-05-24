// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

import 'party.dart';

part 'pre_approval.mapper.dart';

@MappableClass()
class PreApproval with PreApprovalMappable {
  const PreApproval({
    this.payer,
    this.payerCurrency,
    this.payerMessage,
    this.validityTime,
  });
  final Party? payer;

  /// ISO4217 Currency
  final String? payerCurrency;

  /// The mesage that is shown to the approver.
  final String? payerMessage;

  /// The request validity time of the pre-approval
  final int? validityTime;

  static PreApproval fromJson(Map<String, dynamic> json) =>
      PreApprovalMapper.ensureInitialized().decodeMap<PreApproval>(json);
}
