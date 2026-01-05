// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'pre_approval_details_frequency.dart';
import 'pre_approval_details_status.dart';

part 'pre_approval_details.mapper.dart';

@MappableClass()
class PreApprovalDetails with PreApprovalDetailsMappable {

  const PreApprovalDetails({
    required this.preApprovalId,
    required this.toFri,
    required this.fromFri,
    required this.fromCurrency,
    required this.createdTime,
    required this.status,
    required this.message,
    this.approvedTime,
    this.expiryTime,
    this.frequency,
    this.startDate,
    this.lastUsedDate,
    this.offer,
    this.externalId,
    this.maxDebitAmount,
  });
  final String preApprovalId;
  final String toFri;
  final String fromFri;
  final String fromCurrency;
  final String createdTime;
  final PreApprovalDetailsStatus status;
  final String message;
  final String? approvedTime;
  final String? expiryTime;
  final PreApprovalDetailsFrequency? frequency;
  final String? startDate;
  final String? lastUsedDate;
  final String? offer;
  final String? externalId;
  final String? maxDebitAmount;


  static PreApprovalDetails fromJson(Map<String, dynamic> json) => PreApprovalDetailsMapper.ensureInitialized().decodeMap<PreApprovalDetails>(json);
}
