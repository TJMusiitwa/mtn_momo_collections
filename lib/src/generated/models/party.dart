// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

import 'party_party_id_type.dart';

part 'party.mapper.dart';

/// Party identifies a account holder in the wallet platform. Party consists of two parameters, type and partyId. Each type have its own validation of the partyId<br> MSISDN - Mobile Number validated according to ITU-T E.164. Validated with IsMSISDN<br> EMAIL - Validated to be a valid e-mail format. Validated with IsEmail<br> PARTY_CODE - UUID of the party. Validated with IsUuid
@MappableClass()
class Party with PartyMappable {
  const Party({this.partyIdType, this.partyId});
  final PartyPartyIdType? partyIdType;
  final String? partyId;

  static Party fromJson(Map<String, dynamic> json) =>
      PartyMapper.ensureInitialized().decodeMap<Party>(json);
}
