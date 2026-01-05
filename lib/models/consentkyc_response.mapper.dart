// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'consentkyc_response.dart';

class ConsentkycResponseMapper extends ClassMapperBase<ConsentkycResponse> {
  ConsentkycResponseMapper._();

  static ConsentkycResponseMapper? _instance;
  static ConsentkycResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConsentkycResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ConsentkycResponse';

  static String? _$sub(ConsentkycResponse v) => v.sub;
  static const Field<ConsentkycResponse, String> _f$sub = Field(
    'sub',
    _$sub,
    opt: true,
  );
  static String? _$name(ConsentkycResponse v) => v.name;
  static const Field<ConsentkycResponse, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$givenName(ConsentkycResponse v) => v.givenName;
  static const Field<ConsentkycResponse, String> _f$givenName = Field(
    'givenName',
    _$givenName,
    key: r'given_name',
    opt: true,
  );
  static String? _$familyName(ConsentkycResponse v) => v.familyName;
  static const Field<ConsentkycResponse, String> _f$familyName = Field(
    'familyName',
    _$familyName,
    key: r'family_name',
    opt: true,
  );
  static String? _$middleName(ConsentkycResponse v) => v.middleName;
  static const Field<ConsentkycResponse, String> _f$middleName = Field(
    'middleName',
    _$middleName,
    key: r'middle_name',
    opt: true,
  );
  static String? _$email(ConsentkycResponse v) => v.email;
  static const Field<ConsentkycResponse, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static bool? _$emailVerified(ConsentkycResponse v) => v.emailVerified;
  static const Field<ConsentkycResponse, bool> _f$emailVerified = Field(
    'emailVerified',
    _$emailVerified,
    key: r'email_verified',
    opt: true,
  );
  static String? _$gender(ConsentkycResponse v) => v.gender;
  static const Field<ConsentkycResponse, String> _f$gender = Field(
    'gender',
    _$gender,
    opt: true,
  );
  static String? _$locale(ConsentkycResponse v) => v.locale;
  static const Field<ConsentkycResponse, String> _f$locale = Field(
    'locale',
    _$locale,
    opt: true,
  );
  static String? _$phoneNumber(ConsentkycResponse v) => v.phoneNumber;
  static const Field<ConsentkycResponse, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'phone_number',
    opt: true,
  );
  static bool? _$phoneNumberVerified(ConsentkycResponse v) =>
      v.phoneNumberVerified;
  static const Field<ConsentkycResponse, bool> _f$phoneNumberVerified = Field(
    'phoneNumberVerified',
    _$phoneNumberVerified,
    key: r'phone_number_verified',
    opt: true,
  );
  static String? _$address(ConsentkycResponse v) => v.address;
  static const Field<ConsentkycResponse, String> _f$address = Field(
    'address',
    _$address,
    key: r'Address',
    opt: true,
  );
  static num? _$updatedAt(ConsentkycResponse v) => v.updatedAt;
  static const Field<ConsentkycResponse, num> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$status(ConsentkycResponse v) => v.status;
  static const Field<ConsentkycResponse, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$birthdate(ConsentkycResponse v) => v.birthdate;
  static const Field<ConsentkycResponse, String> _f$birthdate = Field(
    'birthdate',
    _$birthdate,
    opt: true,
  );
  static String? _$creditScore(ConsentkycResponse v) => v.creditScore;
  static const Field<ConsentkycResponse, String> _f$creditScore = Field(
    'creditScore',
    _$creditScore,
    key: r'credit_score',
    opt: true,
  );
  static bool? _$active(ConsentkycResponse v) => v.active;
  static const Field<ConsentkycResponse, bool> _f$active = Field(
    'active',
    _$active,
    opt: true,
  );
  static String? _$countryOfBirth(ConsentkycResponse v) => v.countryOfBirth;
  static const Field<ConsentkycResponse, String> _f$countryOfBirth = Field(
    'countryOfBirth',
    _$countryOfBirth,
    key: r'country_of_birth',
    opt: true,
  );
  static String? _$regionOfBirth(ConsentkycResponse v) => v.regionOfBirth;
  static const Field<ConsentkycResponse, String> _f$regionOfBirth = Field(
    'regionOfBirth',
    _$regionOfBirth,
    key: r'region_of_birth',
    opt: true,
  );
  static String? _$cityOfBirth(ConsentkycResponse v) => v.cityOfBirth;
  static const Field<ConsentkycResponse, String> _f$cityOfBirth = Field(
    'cityOfBirth',
    _$cityOfBirth,
    key: r'city_of_birth',
    opt: true,
  );
  static String? _$occupation(ConsentkycResponse v) => v.occupation;
  static const Field<ConsentkycResponse, String> _f$occupation = Field(
    'occupation',
    _$occupation,
    opt: true,
  );
  static String? _$employerName(ConsentkycResponse v) => v.employerName;
  static const Field<ConsentkycResponse, String> _f$employerName = Field(
    'employerName',
    _$employerName,
    key: r'employer_name',
    opt: true,
  );
  static String? _$identificationType(ConsentkycResponse v) =>
      v.identificationType;
  static const Field<ConsentkycResponse, String> _f$identificationType = Field(
    'identificationType',
    _$identificationType,
    key: r'identification_type',
    opt: true,
  );
  static String? _$identificationValue(ConsentkycResponse v) =>
      v.identificationValue;
  static const Field<ConsentkycResponse, String> _f$identificationValue = Field(
    'identificationValue',
    _$identificationValue,
    key: r'identification_value',
    opt: true,
  );

  @override
  final MappableFields<ConsentkycResponse> fields = const {
    #sub: _f$sub,
    #name: _f$name,
    #givenName: _f$givenName,
    #familyName: _f$familyName,
    #middleName: _f$middleName,
    #email: _f$email,
    #emailVerified: _f$emailVerified,
    #gender: _f$gender,
    #locale: _f$locale,
    #phoneNumber: _f$phoneNumber,
    #phoneNumberVerified: _f$phoneNumberVerified,
    #address: _f$address,
    #updatedAt: _f$updatedAt,
    #status: _f$status,
    #birthdate: _f$birthdate,
    #creditScore: _f$creditScore,
    #active: _f$active,
    #countryOfBirth: _f$countryOfBirth,
    #regionOfBirth: _f$regionOfBirth,
    #cityOfBirth: _f$cityOfBirth,
    #occupation: _f$occupation,
    #employerName: _f$employerName,
    #identificationType: _f$identificationType,
    #identificationValue: _f$identificationValue,
  };

  static ConsentkycResponse _instantiate(DecodingData data) {
    return ConsentkycResponse(
      sub: data.dec(_f$sub),
      name: data.dec(_f$name),
      givenName: data.dec(_f$givenName),
      familyName: data.dec(_f$familyName),
      middleName: data.dec(_f$middleName),
      email: data.dec(_f$email),
      emailVerified: data.dec(_f$emailVerified),
      gender: data.dec(_f$gender),
      locale: data.dec(_f$locale),
      phoneNumber: data.dec(_f$phoneNumber),
      phoneNumberVerified: data.dec(_f$phoneNumberVerified),
      address: data.dec(_f$address),
      updatedAt: data.dec(_f$updatedAt),
      status: data.dec(_f$status),
      birthdate: data.dec(_f$birthdate),
      creditScore: data.dec(_f$creditScore),
      active: data.dec(_f$active),
      countryOfBirth: data.dec(_f$countryOfBirth),
      regionOfBirth: data.dec(_f$regionOfBirth),
      cityOfBirth: data.dec(_f$cityOfBirth),
      occupation: data.dec(_f$occupation),
      employerName: data.dec(_f$employerName),
      identificationType: data.dec(_f$identificationType),
      identificationValue: data.dec(_f$identificationValue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ConsentkycResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConsentkycResponse>(map);
  }

  static ConsentkycResponse fromJson(String json) {
    return ensureInitialized().decodeJson<ConsentkycResponse>(json);
  }
}

mixin ConsentkycResponseMappable {
  String toJson() {
    return ConsentkycResponseMapper.ensureInitialized()
        .encodeJson<ConsentkycResponse>(this as ConsentkycResponse);
  }

  Map<String, dynamic> toMap() {
    return ConsentkycResponseMapper.ensureInitialized()
        .encodeMap<ConsentkycResponse>(this as ConsentkycResponse);
  }

  ConsentkycResponseCopyWith<
    ConsentkycResponse,
    ConsentkycResponse,
    ConsentkycResponse
  >
  get copyWith =>
      _ConsentkycResponseCopyWithImpl<ConsentkycResponse, ConsentkycResponse>(
        this as ConsentkycResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ConsentkycResponseMapper.ensureInitialized().stringifyValue(
      this as ConsentkycResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return ConsentkycResponseMapper.ensureInitialized().equalsValue(
      this as ConsentkycResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return ConsentkycResponseMapper.ensureInitialized().hashValue(
      this as ConsentkycResponse,
    );
  }
}

extension ConsentkycResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConsentkycResponse, $Out> {
  ConsentkycResponseCopyWith<$R, ConsentkycResponse, $Out>
  get $asConsentkycResponse => $base.as(
    (v, t, t2) => _ConsentkycResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ConsentkycResponseCopyWith<
  $R,
  $In extends ConsentkycResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? sub,
    String? name,
    String? givenName,
    String? familyName,
    String? middleName,
    String? email,
    bool? emailVerified,
    String? gender,
    String? locale,
    String? phoneNumber,
    bool? phoneNumberVerified,
    String? address,
    num? updatedAt,
    String? status,
    String? birthdate,
    String? creditScore,
    bool? active,
    String? countryOfBirth,
    String? regionOfBirth,
    String? cityOfBirth,
    String? occupation,
    String? employerName,
    String? identificationType,
    String? identificationValue,
  });
  ConsentkycResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ConsentkycResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConsentkycResponse, $Out>
    implements ConsentkycResponseCopyWith<$R, ConsentkycResponse, $Out> {
  _ConsentkycResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ConsentkycResponse> $mapper =
      ConsentkycResponseMapper.ensureInitialized();
  @override
  $R call({
    Object? sub = $none,
    Object? name = $none,
    Object? givenName = $none,
    Object? familyName = $none,
    Object? middleName = $none,
    Object? email = $none,
    Object? emailVerified = $none,
    Object? gender = $none,
    Object? locale = $none,
    Object? phoneNumber = $none,
    Object? phoneNumberVerified = $none,
    Object? address = $none,
    Object? updatedAt = $none,
    Object? status = $none,
    Object? birthdate = $none,
    Object? creditScore = $none,
    Object? active = $none,
    Object? countryOfBirth = $none,
    Object? regionOfBirth = $none,
    Object? cityOfBirth = $none,
    Object? occupation = $none,
    Object? employerName = $none,
    Object? identificationType = $none,
    Object? identificationValue = $none,
  }) => $apply(
    FieldCopyWithData({
      if (sub != $none) #sub: sub,
      if (name != $none) #name: name,
      if (givenName != $none) #givenName: givenName,
      if (familyName != $none) #familyName: familyName,
      if (middleName != $none) #middleName: middleName,
      if (email != $none) #email: email,
      if (emailVerified != $none) #emailVerified: emailVerified,
      if (gender != $none) #gender: gender,
      if (locale != $none) #locale: locale,
      if (phoneNumber != $none) #phoneNumber: phoneNumber,
      if (phoneNumberVerified != $none)
        #phoneNumberVerified: phoneNumberVerified,
      if (address != $none) #address: address,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (status != $none) #status: status,
      if (birthdate != $none) #birthdate: birthdate,
      if (creditScore != $none) #creditScore: creditScore,
      if (active != $none) #active: active,
      if (countryOfBirth != $none) #countryOfBirth: countryOfBirth,
      if (regionOfBirth != $none) #regionOfBirth: regionOfBirth,
      if (cityOfBirth != $none) #cityOfBirth: cityOfBirth,
      if (occupation != $none) #occupation: occupation,
      if (employerName != $none) #employerName: employerName,
      if (identificationType != $none) #identificationType: identificationType,
      if (identificationValue != $none)
        #identificationValue: identificationValue,
    }),
  );
  @override
  ConsentkycResponse $make(CopyWithData data) => ConsentkycResponse(
    sub: data.get(#sub, or: $value.sub),
    name: data.get(#name, or: $value.name),
    givenName: data.get(#givenName, or: $value.givenName),
    familyName: data.get(#familyName, or: $value.familyName),
    middleName: data.get(#middleName, or: $value.middleName),
    email: data.get(#email, or: $value.email),
    emailVerified: data.get(#emailVerified, or: $value.emailVerified),
    gender: data.get(#gender, or: $value.gender),
    locale: data.get(#locale, or: $value.locale),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    phoneNumberVerified: data.get(
      #phoneNumberVerified,
      or: $value.phoneNumberVerified,
    ),
    address: data.get(#address, or: $value.address),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    status: data.get(#status, or: $value.status),
    birthdate: data.get(#birthdate, or: $value.birthdate),
    creditScore: data.get(#creditScore, or: $value.creditScore),
    active: data.get(#active, or: $value.active),
    countryOfBirth: data.get(#countryOfBirth, or: $value.countryOfBirth),
    regionOfBirth: data.get(#regionOfBirth, or: $value.regionOfBirth),
    cityOfBirth: data.get(#cityOfBirth, or: $value.cityOfBirth),
    occupation: data.get(#occupation, or: $value.occupation),
    employerName: data.get(#employerName, or: $value.employerName),
    identificationType: data.get(
      #identificationType,
      or: $value.identificationType,
    ),
    identificationValue: data.get(
      #identificationValue,
      or: $value.identificationValue,
    ),
  );

  @override
  ConsentkycResponseCopyWith<$R2, ConsentkycResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ConsentkycResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

