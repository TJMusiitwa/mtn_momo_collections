// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

part 'money.mapper.dart';

@MappableClass()
class Money with MoneyMappable {

  const Money({
    this.amount,
    this.currency,
  });
  final String? amount;
  final String? currency;


  static Money fromJson(Map<String, dynamic> json) => MoneyMapper.ensureInitialized().decodeMap<Money>(json);
}
