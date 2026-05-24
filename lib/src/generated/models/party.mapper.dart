// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'party.dart';

class PartyMapper extends ClassMapperBase<Party> {
  PartyMapper._();

  static PartyMapper? _instance;
  static PartyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PartyMapper._());
      PartyPartyIdTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Party';

  static PartyPartyIdType? _$partyIdType(Party v) => v.partyIdType;
  static const Field<Party, PartyPartyIdType> _f$partyIdType = Field(
    'partyIdType',
    _$partyIdType,
    opt: true,
  );
  static String? _$partyId(Party v) => v.partyId;
  static const Field<Party, String> _f$partyId = Field(
    'partyId',
    _$partyId,
    opt: true,
  );

  @override
  final MappableFields<Party> fields = const {
    #partyIdType: _f$partyIdType,
    #partyId: _f$partyId,
  };

  static Party _instantiate(DecodingData data) {
    return Party(
      partyIdType: data.dec(_f$partyIdType),
      partyId: data.dec(_f$partyId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Party fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Party>(map);
  }

  static Party fromJson(String json) {
    return ensureInitialized().decodeJson<Party>(json);
  }
}

mixin PartyMappable {
  String toJson() {
    return PartyMapper.ensureInitialized().encodeJson<Party>(this as Party);
  }

  Map<String, dynamic> toMap() {
    return PartyMapper.ensureInitialized().encodeMap<Party>(this as Party);
  }

  PartyCopyWith<Party, Party, Party> get copyWith =>
      _PartyCopyWithImpl<Party, Party>(this as Party, $identity, $identity);
  @override
  String toString() {
    return PartyMapper.ensureInitialized().stringifyValue(this as Party);
  }

  @override
  bool operator ==(Object other) {
    return PartyMapper.ensureInitialized().equalsValue(this as Party, other);
  }

  @override
  int get hashCode {
    return PartyMapper.ensureInitialized().hashValue(this as Party);
  }
}

extension PartyValueCopy<$R, $Out> on ObjectCopyWith<$R, Party, $Out> {
  PartyCopyWith<$R, Party, $Out> get $asParty =>
      $base.as((v, t, t2) => _PartyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PartyCopyWith<$R, $In extends Party, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({PartyPartyIdType? partyIdType, String? partyId});
  PartyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PartyCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Party, $Out>
    implements PartyCopyWith<$R, Party, $Out> {
  _PartyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Party> $mapper = PartyMapper.ensureInitialized();
  @override
  $R call({Object? partyIdType = $none, Object? partyId = $none}) => $apply(
    FieldCopyWithData({
      if (partyIdType != $none) #partyIdType: partyIdType,
      if (partyId != $none) #partyId: partyId,
    }),
  );
  @override
  Party $make(CopyWithData data) => Party(
    partyIdType: data.get(#partyIdType, or: $value.partyIdType),
    partyId: data.get(#partyId, or: $value.partyId),
  );

  @override
  PartyCopyWith<$R2, Party, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PartyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

