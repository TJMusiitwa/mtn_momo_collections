// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'basic_user_info_json_response.dart';

class BasicUserInfoJsonResponseMapper
    extends ClassMapperBase<BasicUserInfoJsonResponse> {
  BasicUserInfoJsonResponseMapper._();

  static BasicUserInfoJsonResponseMapper? _instance;
  static BasicUserInfoJsonResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = BasicUserInfoJsonResponseMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'BasicUserInfoJsonResponse';

  static String? _$givenName(BasicUserInfoJsonResponse v) => v.givenName;
  static const Field<BasicUserInfoJsonResponse, String> _f$givenName = Field(
    'givenName',
    _$givenName,
    key: r'given_name',
    opt: true,
  );
  static String? _$familyName(BasicUserInfoJsonResponse v) => v.familyName;
  static const Field<BasicUserInfoJsonResponse, String> _f$familyName = Field(
    'familyName',
    _$familyName,
    key: r'family_name',
    opt: true,
  );
  static String? _$birthdate(BasicUserInfoJsonResponse v) => v.birthdate;
  static const Field<BasicUserInfoJsonResponse, String> _f$birthdate = Field(
    'birthdate',
    _$birthdate,
    opt: true,
  );
  static String? _$locale(BasicUserInfoJsonResponse v) => v.locale;
  static const Field<BasicUserInfoJsonResponse, String> _f$locale = Field(
    'locale',
    _$locale,
    opt: true,
  );
  static String? _$gender(BasicUserInfoJsonResponse v) => v.gender;
  static const Field<BasicUserInfoJsonResponse, String> _f$gender = Field(
    'gender',
    _$gender,
    opt: true,
  );
  static String? _$status(BasicUserInfoJsonResponse v) => v.status;
  static const Field<BasicUserInfoJsonResponse, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );

  @override
  final MappableFields<BasicUserInfoJsonResponse> fields = const {
    #givenName: _f$givenName,
    #familyName: _f$familyName,
    #birthdate: _f$birthdate,
    #locale: _f$locale,
    #gender: _f$gender,
    #status: _f$status,
  };

  static BasicUserInfoJsonResponse _instantiate(DecodingData data) {
    return BasicUserInfoJsonResponse(
      givenName: data.dec(_f$givenName),
      familyName: data.dec(_f$familyName),
      birthdate: data.dec(_f$birthdate),
      locale: data.dec(_f$locale),
      gender: data.dec(_f$gender),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BasicUserInfoJsonResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BasicUserInfoJsonResponse>(map);
  }

  static BasicUserInfoJsonResponse fromJson(String json) {
    return ensureInitialized().decodeJson<BasicUserInfoJsonResponse>(json);
  }
}

mixin BasicUserInfoJsonResponseMappable {
  String toJson() {
    return BasicUserInfoJsonResponseMapper.ensureInitialized()
        .encodeJson<BasicUserInfoJsonResponse>(
          this as BasicUserInfoJsonResponse,
        );
  }

  Map<String, dynamic> toMap() {
    return BasicUserInfoJsonResponseMapper.ensureInitialized()
        .encodeMap<BasicUserInfoJsonResponse>(
          this as BasicUserInfoJsonResponse,
        );
  }

  BasicUserInfoJsonResponseCopyWith<
    BasicUserInfoJsonResponse,
    BasicUserInfoJsonResponse,
    BasicUserInfoJsonResponse
  >
  get copyWith =>
      _BasicUserInfoJsonResponseCopyWithImpl<
        BasicUserInfoJsonResponse,
        BasicUserInfoJsonResponse
      >(this as BasicUserInfoJsonResponse, $identity, $identity);
  @override
  String toString() {
    return BasicUserInfoJsonResponseMapper.ensureInitialized().stringifyValue(
      this as BasicUserInfoJsonResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return BasicUserInfoJsonResponseMapper.ensureInitialized().equalsValue(
      this as BasicUserInfoJsonResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return BasicUserInfoJsonResponseMapper.ensureInitialized().hashValue(
      this as BasicUserInfoJsonResponse,
    );
  }
}

extension BasicUserInfoJsonResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BasicUserInfoJsonResponse, $Out> {
  BasicUserInfoJsonResponseCopyWith<$R, BasicUserInfoJsonResponse, $Out>
  get $asBasicUserInfoJsonResponse => $base.as(
    (v, t, t2) => _BasicUserInfoJsonResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class BasicUserInfoJsonResponseCopyWith<
  $R,
  $In extends BasicUserInfoJsonResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? givenName,
    String? familyName,
    String? birthdate,
    String? locale,
    String? gender,
    String? status,
  });
  BasicUserInfoJsonResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BasicUserInfoJsonResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BasicUserInfoJsonResponse, $Out>
    implements
        BasicUserInfoJsonResponseCopyWith<$R, BasicUserInfoJsonResponse, $Out> {
  _BasicUserInfoJsonResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BasicUserInfoJsonResponse> $mapper =
      BasicUserInfoJsonResponseMapper.ensureInitialized();
  @override
  $R call({
    Object? givenName = $none,
    Object? familyName = $none,
    Object? birthdate = $none,
    Object? locale = $none,
    Object? gender = $none,
    Object? status = $none,
  }) => $apply(
    FieldCopyWithData({
      if (givenName != $none) #givenName: givenName,
      if (familyName != $none) #familyName: familyName,
      if (birthdate != $none) #birthdate: birthdate,
      if (locale != $none) #locale: locale,
      if (gender != $none) #gender: gender,
      if (status != $none) #status: status,
    }),
  );
  @override
  BasicUserInfoJsonResponse $make(CopyWithData data) =>
      BasicUserInfoJsonResponse(
        givenName: data.get(#givenName, or: $value.givenName),
        familyName: data.get(#familyName, or: $value.familyName),
        birthdate: data.get(#birthdate, or: $value.birthdate),
        locale: data.get(#locale, or: $value.locale),
        gender: data.get(#gender, or: $value.gender),
        status: data.get(#status, or: $value.status),
      );

  @override
  BasicUserInfoJsonResponseCopyWith<$R2, BasicUserInfoJsonResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BasicUserInfoJsonResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

