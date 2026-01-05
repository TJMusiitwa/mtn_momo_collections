// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'party.dart';

part 'transfer.mapper.dart';

@MappableClass()
class Transfer with TransferMappable {

  const Transfer({
    this.amount,
    this.currency,
    this.externalId,
    this.payee,
    this.payerMessage,
    this.payeeNote,
  });
  final String? amount;
  final String? currency;
  final String? externalId;
  final Party? payee;
  final String? payerMessage;
  final String? payeeNote;


  static Transfer fromJson(Map<String, dynamic> json) => TransferMapper.ensureInitialized().decodeMap<Transfer>(json);
}
