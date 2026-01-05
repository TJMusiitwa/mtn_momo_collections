// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dart_mappable/dart_mappable.dart';

part 'account_holder_id_type2.mapper.dart';

/// Specifies the type of the accountHolderId.
///
/// Allowed values:.
/// msisdn.
/// email.
/// id.
/// alias.
@MappableEnum(defaultValue: 'unknown')
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

}
