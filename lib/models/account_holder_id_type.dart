// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dart_mappable/dart_mappable.dart';

part 'account_holder_id_type.mapper.dart';

/// Type of account holder identity passed in accountHolderId path param.
///
/// Possible values:.
/// MSISDN.
///
/// Email.
///
/// Alias.
///
/// ID (account ID).
@MappableEnum(defaultValue: 'unknown')
enum AccountHolderIdType {
  @MappableValue('MSISDN') 
  msisdn,

  @MappableValue('Email') 
  email,

  @MappableValue('Alias') 
  alias,

  @MappableValue('ID') 
  iD,

  @MappableValue('unknown') 
  unknown;

}
