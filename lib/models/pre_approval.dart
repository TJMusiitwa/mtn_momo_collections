// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


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
  final String? payerCurrency;
  final String? payerMessage;
  final int? validityTime;


  static PreApproval fromJson(Map<String, dynamic> json) => PreApprovalMapper.ensureInitialized().decodeMap<PreApproval>(json);
}
