// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'party.dart';

part 'request_to_pay.mapper.dart';

@MappableClass()
class RequestToPay with RequestToPayMappable {

  const RequestToPay({
    this.amount,
    this.currency,
    this.externalId,
    this.payer,
    this.payerMessage,
    this.payeeNote,
  });
  final String? amount;
  final String? currency;
  final String? externalId;
  final Party? payer;
  final String? payerMessage;
  final String? payeeNote;


  static RequestToPay fromJson(Map<String, dynamic> json) => RequestToPayMapper.ensureInitialized().decodeMap<RequestToPay>(json);
}
