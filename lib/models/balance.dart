// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

part 'balance.mapper.dart';

/// The available balance of the account
@MappableClass()
class Balance with BalanceMappable {

  const Balance({
    this.availableBalance,
    this.currency,
  });
  final String? availableBalance;
  final String? currency;


  static Balance fromJson(Map<String, dynamic> json) => BalanceMapper.ensureInitialized().decodeMap<Balance>(json);
}
