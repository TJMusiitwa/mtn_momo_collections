// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'oauth2_token_response.dart';

class Oauth2TokenResponseMapper extends ClassMapperBase<Oauth2TokenResponse> {
  Oauth2TokenResponseMapper._();

  static Oauth2TokenResponseMapper? _instance;
  static Oauth2TokenResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Oauth2TokenResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Oauth2TokenResponse';

  static String? _$accessToken(Oauth2TokenResponse v) => v.accessToken;
  static const Field<Oauth2TokenResponse, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
    opt: true,
  );
  static String? _$tokenType(Oauth2TokenResponse v) => v.tokenType;
  static const Field<Oauth2TokenResponse, String> _f$tokenType = Field(
    'tokenType',
    _$tokenType,
    key: r'token_type',
    opt: true,
  );
  static num? _$expiresIn(Oauth2TokenResponse v) => v.expiresIn;
  static const Field<Oauth2TokenResponse, num> _f$expiresIn = Field(
    'expiresIn',
    _$expiresIn,
    key: r'expires_in',
    opt: true,
  );
  static String? _$scope(Oauth2TokenResponse v) => v.scope;
  static const Field<Oauth2TokenResponse, String> _f$scope = Field(
    'scope',
    _$scope,
    opt: true,
  );
  static String? _$refreshToken(Oauth2TokenResponse v) => v.refreshToken;
  static const Field<Oauth2TokenResponse, String> _f$refreshToken = Field(
    'refreshToken',
    _$refreshToken,
    key: r'refresh_token',
    opt: true,
  );
  static int? _$refreshTokenExpiredIn(Oauth2TokenResponse v) =>
      v.refreshTokenExpiredIn;
  static const Field<Oauth2TokenResponse, int> _f$refreshTokenExpiredIn = Field(
    'refreshTokenExpiredIn',
    _$refreshTokenExpiredIn,
    key: r'refresh_token_expired_in',
    opt: true,
  );

  @override
  final MappableFields<Oauth2TokenResponse> fields = const {
    #accessToken: _f$accessToken,
    #tokenType: _f$tokenType,
    #expiresIn: _f$expiresIn,
    #scope: _f$scope,
    #refreshToken: _f$refreshToken,
    #refreshTokenExpiredIn: _f$refreshTokenExpiredIn,
  };

  static Oauth2TokenResponse _instantiate(DecodingData data) {
    return Oauth2TokenResponse(
      accessToken: data.dec(_f$accessToken),
      tokenType: data.dec(_f$tokenType),
      expiresIn: data.dec(_f$expiresIn),
      scope: data.dec(_f$scope),
      refreshToken: data.dec(_f$refreshToken),
      refreshTokenExpiredIn: data.dec(_f$refreshTokenExpiredIn),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Oauth2TokenResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Oauth2TokenResponse>(map);
  }

  static Oauth2TokenResponse fromJson(String json) {
    return ensureInitialized().decodeJson<Oauth2TokenResponse>(json);
  }
}

mixin Oauth2TokenResponseMappable {
  String toJson() {
    return Oauth2TokenResponseMapper.ensureInitialized()
        .encodeJson<Oauth2TokenResponse>(this as Oauth2TokenResponse);
  }

  Map<String, dynamic> toMap() {
    return Oauth2TokenResponseMapper.ensureInitialized()
        .encodeMap<Oauth2TokenResponse>(this as Oauth2TokenResponse);
  }

  Oauth2TokenResponseCopyWith<
    Oauth2TokenResponse,
    Oauth2TokenResponse,
    Oauth2TokenResponse
  >
  get copyWith =>
      _Oauth2TokenResponseCopyWithImpl<
        Oauth2TokenResponse,
        Oauth2TokenResponse
      >(this as Oauth2TokenResponse, $identity, $identity);
  @override
  String toString() {
    return Oauth2TokenResponseMapper.ensureInitialized().stringifyValue(
      this as Oauth2TokenResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return Oauth2TokenResponseMapper.ensureInitialized().equalsValue(
      this as Oauth2TokenResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return Oauth2TokenResponseMapper.ensureInitialized().hashValue(
      this as Oauth2TokenResponse,
    );
  }
}

extension Oauth2TokenResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Oauth2TokenResponse, $Out> {
  Oauth2TokenResponseCopyWith<$R, Oauth2TokenResponse, $Out>
  get $asOauth2TokenResponse => $base.as(
    (v, t, t2) => _Oauth2TokenResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class Oauth2TokenResponseCopyWith<
  $R,
  $In extends Oauth2TokenResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? accessToken,
    String? tokenType,
    num? expiresIn,
    String? scope,
    String? refreshToken,
    int? refreshTokenExpiredIn,
  });
  Oauth2TokenResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _Oauth2TokenResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Oauth2TokenResponse, $Out>
    implements Oauth2TokenResponseCopyWith<$R, Oauth2TokenResponse, $Out> {
  _Oauth2TokenResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Oauth2TokenResponse> $mapper =
      Oauth2TokenResponseMapper.ensureInitialized();
  @override
  $R call({
    Object? accessToken = $none,
    Object? tokenType = $none,
    Object? expiresIn = $none,
    Object? scope = $none,
    Object? refreshToken = $none,
    Object? refreshTokenExpiredIn = $none,
  }) => $apply(
    FieldCopyWithData({
      if (accessToken != $none) #accessToken: accessToken,
      if (tokenType != $none) #tokenType: tokenType,
      if (expiresIn != $none) #expiresIn: expiresIn,
      if (scope != $none) #scope: scope,
      if (refreshToken != $none) #refreshToken: refreshToken,
      if (refreshTokenExpiredIn != $none)
        #refreshTokenExpiredIn: refreshTokenExpiredIn,
    }),
  );
  @override
  Oauth2TokenResponse $make(CopyWithData data) => Oauth2TokenResponse(
    accessToken: data.get(#accessToken, or: $value.accessToken),
    tokenType: data.get(#tokenType, or: $value.tokenType),
    expiresIn: data.get(#expiresIn, or: $value.expiresIn),
    scope: data.get(#scope, or: $value.scope),
    refreshToken: data.get(#refreshToken, or: $value.refreshToken),
    refreshTokenExpiredIn: data.get(
      #refreshTokenExpiredIn,
      or: $value.refreshTokenExpiredIn,
    ),
  );

  @override
  Oauth2TokenResponseCopyWith<$R2, Oauth2TokenResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _Oauth2TokenResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

