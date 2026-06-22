// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'money.mapper.dart';

@MappableClass()
class Money with MoneyMappable {
  const Money({this.amount, this.currency});

  /// A positive amount
  final String? amount;

  /// Currency in ISO4217 format
  final String? currency;

  static Money fromJson(Map<String, dynamic> json) =>
      MoneyMapper.ensureInitialized().decodeMap<Money>(json);
}
