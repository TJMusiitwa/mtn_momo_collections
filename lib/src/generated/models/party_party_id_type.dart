// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'party_party_id_type.mapper.dart';

@MappableEnum(defaultValue: PartyPartyIdType.unknown)
enum PartyPartyIdType {
  @MappableValue('MSISDN') 
  msisdn,

  @MappableValue('EMAIL') 
  email,

  @MappableValue('PARTY_CODE') 
  partyCode,

  @MappableValue('unknown') 
  unknown;

  @override
  String toString() => toValue().toString();

  /// Returns all defined enum values excluding the unknown value.
  static List<PartyPartyIdType> get $valuesDefined => values.where((value) => value != PartyPartyIdType.unknown).toList();
}
