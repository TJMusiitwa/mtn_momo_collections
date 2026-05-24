// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'account_holder_id_type2.mapper.dart';

/// Specifies the type of the accountHolderId.
///
/// Allowed values:.
/// msisdn.
/// email.
/// id.
/// alias.
@MappableEnum(defaultValue: AccountHolderIdType2.unknown)
enum AccountHolderIdType2 {
  @MappableValue('msisdn')
  msisdn,

  @MappableValue('email')
  email,

  @MappableValue('id')
  id,

  @MappableValue('alias')
  alias,

  @MappableValue('unknown')
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<AccountHolderIdType2> get $valuesDefined =>
      values.where((value) => value != AccountHolderIdType2.unknown).toList();
}
