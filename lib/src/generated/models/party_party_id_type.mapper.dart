// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'party_party_id_type.dart';

class PartyPartyIdTypeMapper extends EnumMapper<PartyPartyIdType> {
  PartyPartyIdTypeMapper._();

  static PartyPartyIdTypeMapper? _instance;
  static PartyPartyIdTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PartyPartyIdTypeMapper._());
    }
    return _instance!;
  }

  static PartyPartyIdType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PartyPartyIdType decode(dynamic value) {
    switch (value) {
      case 'MSISDN':
        return PartyPartyIdType.msisdn;
      case 'EMAIL':
        return PartyPartyIdType.email;
      case 'PARTY_CODE':
        return PartyPartyIdType.partyCode;
      case 'unknown':
        return PartyPartyIdType.unknown;
      default:
        return PartyPartyIdType.values[3];
    }
  }

  @override
  dynamic encode(PartyPartyIdType self) {
    switch (self) {
      case PartyPartyIdType.msisdn:
        return 'MSISDN';
      case PartyPartyIdType.email:
        return 'EMAIL';
      case PartyPartyIdType.partyCode:
        return 'PARTY_CODE';
      case PartyPartyIdType.unknown:
        return 'unknown';
    }
  }
}

extension PartyPartyIdTypeMapperExtension on PartyPartyIdType {
  dynamic toValue() {
    PartyPartyIdTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PartyPartyIdType>(this);
  }
}

