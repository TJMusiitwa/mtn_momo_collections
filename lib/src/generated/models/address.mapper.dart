// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'address.dart';

class AddressMapper extends ClassMapperBase<Address> {
  AddressMapper._();

  static AddressMapper? _instance;
  static AddressMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Address';

  static String? _$formatted(Address v) => v.formatted;
  static const Field<Address, String> _f$formatted = Field(
    'formatted',
    _$formatted,
    opt: true,
  );
  static String? _$streetAddress(Address v) => v.streetAddress;
  static const Field<Address, String> _f$streetAddress = Field(
    'streetAddress',
    _$streetAddress,
    key: r'street_address',
    opt: true,
  );
  static String? _$locality(Address v) => v.locality;
  static const Field<Address, String> _f$locality = Field(
    'locality',
    _$locality,
    opt: true,
  );
  static String? _$region(Address v) => v.region;
  static const Field<Address, String> _f$region = Field(
    'region',
    _$region,
    opt: true,
  );
  static String? _$postalCode(Address v) => v.postalCode;
  static const Field<Address, String> _f$postalCode = Field(
    'postalCode',
    _$postalCode,
    key: r'postal_code',
    opt: true,
  );
  static String? _$country(Address v) => v.country;
  static const Field<Address, String> _f$country = Field(
    'country',
    _$country,
    opt: true,
  );

  @override
  final MappableFields<Address> fields = const {
    #formatted: _f$formatted,
    #streetAddress: _f$streetAddress,
    #locality: _f$locality,
    #region: _f$region,
    #postalCode: _f$postalCode,
    #country: _f$country,
  };

  static Address _instantiate(DecodingData data) {
    return Address(
      formatted: data.dec(_f$formatted),
      streetAddress: data.dec(_f$streetAddress),
      locality: data.dec(_f$locality),
      region: data.dec(_f$region),
      postalCode: data.dec(_f$postalCode),
      country: data.dec(_f$country),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Address fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Address>(map);
  }

  static Address fromJson(String json) {
    return ensureInitialized().decodeJson<Address>(json);
  }
}

mixin AddressMappable {
  String toJson() {
    return AddressMapper.ensureInitialized().encodeJson<Address>(
      this as Address,
    );
  }

  Map<String, dynamic> toMap() {
    return AddressMapper.ensureInitialized().encodeMap<Address>(
      this as Address,
    );
  }

  AddressCopyWith<Address, Address, Address> get copyWith =>
      _AddressCopyWithImpl<Address, Address>(
        this as Address,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AddressMapper.ensureInitialized().stringifyValue(this as Address);
  }

  @override
  bool operator ==(Object other) {
    return AddressMapper.ensureInitialized().equalsValue(
      this as Address,
      other,
    );
  }

  @override
  int get hashCode {
    return AddressMapper.ensureInitialized().hashValue(this as Address);
  }
}

extension AddressValueCopy<$R, $Out> on ObjectCopyWith<$R, Address, $Out> {
  AddressCopyWith<$R, Address, $Out> get $asAddress =>
      $base.as((v, t, t2) => _AddressCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AddressCopyWith<$R, $In extends Address, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? formatted,
    String? streetAddress,
    String? locality,
    String? region,
    String? postalCode,
    String? country,
  });
  AddressCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AddressCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Address, $Out>
    implements AddressCopyWith<$R, Address, $Out> {
  _AddressCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Address> $mapper =
      AddressMapper.ensureInitialized();
  @override
  $R call({
    Object? formatted = $none,
    Object? streetAddress = $none,
    Object? locality = $none,
    Object? region = $none,
    Object? postalCode = $none,
    Object? country = $none,
  }) => $apply(
    FieldCopyWithData({
      if (formatted != $none) #formatted: formatted,
      if (streetAddress != $none) #streetAddress: streetAddress,
      if (locality != $none) #locality: locality,
      if (region != $none) #region: region,
      if (postalCode != $none) #postalCode: postalCode,
      if (country != $none) #country: country,
    }),
  );
  @override
  Address $make(CopyWithData data) => Address(
    formatted: data.get(#formatted, or: $value.formatted),
    streetAddress: data.get(#streetAddress, or: $value.streetAddress),
    locality: data.get(#locality, or: $value.locality),
    region: data.get(#region, or: $value.region),
    postalCode: data.get(#postalCode, or: $value.postalCode),
    country: data.get(#country, or: $value.country),
  );

  @override
  AddressCopyWith<$R2, Address, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AddressCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

