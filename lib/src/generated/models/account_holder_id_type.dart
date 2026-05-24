// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'account_holder_id_type.mapper.dart';

/// Type of account holder identity passed in accountHolderId path param.Possible values:MSISDN Email AliasID (account ID)
@MappableEnum(defaultValue: AccountHolderIdType.unknown)
enum AccountHolderIdType {
  @MappableValue('MSISDN')
  msisdn,

  @MappableValue('email')
  email,

  @MappableValue('alias')
  alias,

  @MappableValue('id')
  id,

  @MappableValue('unknown')
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<AccountHolderIdType> get $valuesDefined =>
      values.where((value) => value != AccountHolderIdType.unknown).toList();
}
