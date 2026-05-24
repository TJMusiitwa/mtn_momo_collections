// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
  /// The ID of the pre-approval. Parameter cannot be NULL.
  final String preApprovalId;
  /// The Financial Resource Identifier of the receiving account.
  final String toFri;
  /// The Financial Resource Identifier of the sending account.
  final String fromFri;
  /// The currency of the account holder from where the debit happens. ISO4217 Currency
  final String fromCurrency;
  /// The date and time at which the pre-approval was created. Validated with IsIso8601DateTime. Parameter can not be NULL
  final String createdTime;
  final PreApprovalDetailsStatus status;
  /// Message. Validated with IsRestirctedString. Parameter can not be NULL.
  final String message;
  /// The date and time at which the pre-approval was approved. Validated with IsIso8601DateTime. Parameter can not be NULL.
  final String? approvedTime;
  /// The date and time at which the pre-approval expires. Validated with IsIso8601DateTime. Parameter can not be NULL.
  final String? expiryTime;
  final PreApprovalDetailsFrequency? frequency;
  /// The start date of the pre-approval. Validated with IsDateString. Parameter can not be NULL.
  final String? startDate;
  /// The date pre-approval was used last. Validated with IsIso8601DateTime. Parameter can not be NULL.
  final String? lastUsedDate;
  /// The offer description. Validated with IsRestrictedString. Parameter can not be NULL.
  final String? offer;
  /// The external reference id. Validated with IsExternalReferenceString. Parameter can not be NULL.
  final String? externalId;
  /// The max debit amount allowed. Contains a non-negative amount. Validated with IsAmount.
  final String? maxDebitAmount;


  static PreApprovalDetails fromJson(Map<String, dynamic> json) => PreApprovalDetailsMapper.ensureInitialized().decodeMap<PreApprovalDetails>(json);

}

