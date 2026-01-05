// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'oauth2_token_request.dart';

class Oauth2TokenRequestMapper extends ClassMapperBase<Oauth2TokenRequest> {
  Oauth2TokenRequestMapper._();

  static Oauth2TokenRequestMapper? _instance;
  static Oauth2TokenRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Oauth2TokenRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Oauth2TokenRequest';

  static String? _$grantType(Oauth2TokenRequest v) => v.grantType;
  static const Field<Oauth2TokenRequest, String> _f$grantType = Field(
    'grantType',
    _$grantType,
    key: r'grant_type',
    opt: true,
  );
  static String? _$authReqId(Oauth2TokenRequest v) => v.authReqId;
  static const Field<Oauth2TokenRequest, String> _f$authReqId = Field(
    'authReqId',
    _$authReqId,
    key: r'auth_req_id',
    opt: true,
  );
  static String? _$refreshToken(Oauth2TokenRequest v) => v.refreshToken;
  static const Field<Oauth2TokenRequest, String> _f$refreshToken = Field(
    'refreshToken',
    _$refreshToken,
    key: r'refresh_token',
    opt: true,
  );

  @override
  final MappableFields<Oauth2TokenRequest> fields = const {
    #grantType: _f$grantType,
    #authReqId: _f$authReqId,
    #refreshToken: _f$refreshToken,
  };

  static Oauth2TokenRequest _instantiate(DecodingData data) {
    return Oauth2TokenRequest(
      grantType: data.dec(_f$grantType),
      authReqId: data.dec(_f$authReqId),
      refreshToken: data.dec(_f$refreshToken),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Oauth2TokenRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Oauth2TokenRequest>(map);
  }

  static Oauth2TokenRequest fromJson(String json) {
    return ensureInitialized().decodeJson<Oauth2TokenRequest>(json);
  }
}

mixin Oauth2TokenRequestMappable {
  String toJson() {
    return Oauth2TokenRequestMapper.ensureInitialized()
        .encodeJson<Oauth2TokenRequest>(this as Oauth2TokenRequest);
  }

  Map<String, dynamic> toMap() {
    return Oauth2TokenRequestMapper.ensureInitialized()
        .encodeMap<Oauth2TokenRequest>(this as Oauth2TokenRequest);
  }

  Oauth2TokenRequestCopyWith<
    Oauth2TokenRequest,
    Oauth2TokenRequest,
    Oauth2TokenRequest
  >
  get copyWith =>
      _Oauth2TokenRequestCopyWithImpl<Oauth2TokenRequest, Oauth2TokenRequest>(
        this as Oauth2TokenRequest,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return Oauth2TokenRequestMapper.ensureInitialized().stringifyValue(
      this as Oauth2TokenRequest,
    );
  }

  @override
  bool operator ==(Object other) {
    return Oauth2TokenRequestMapper.ensureInitialized().equalsValue(
      this as Oauth2TokenRequest,
      other,
    );
  }

  @override
  int get hashCode {
    return Oauth2TokenRequestMapper.ensureInitialized().hashValue(
      this as Oauth2TokenRequest,
    );
  }
}

extension Oauth2TokenRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Oauth2TokenRequest, $Out> {
  Oauth2TokenRequestCopyWith<$R, Oauth2TokenRequest, $Out>
  get $asOauth2TokenRequest => $base.as(
    (v, t, t2) => _Oauth2TokenRequestCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class Oauth2TokenRequestCopyWith<
  $R,
  $In extends Oauth2TokenRequest,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? grantType, String? authReqId, String? refreshToken});
  Oauth2TokenRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _Oauth2TokenRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Oauth2TokenRequest, $Out>
    implements Oauth2TokenRequestCopyWith<$R, Oauth2TokenRequest, $Out> {
  _Oauth2TokenRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Oauth2TokenRequest> $mapper =
      Oauth2TokenRequestMapper.ensureInitialized();
  @override
  $R call({
    Object? grantType = $none,
    Object? authReqId = $none,
    Object? refreshToken = $none,
  }) => $apply(
    FieldCopyWithData({
      if (grantType != $none) #grantType: grantType,
      if (authReqId != $none) #authReqId: authReqId,
      if (refreshToken != $none) #refreshToken: refreshToken,
    }),
  );
  @override
  Oauth2TokenRequest $make(CopyWithData data) => Oauth2TokenRequest(
    grantType: data.get(#grantType, or: $value.grantType),
    authReqId: data.get(#authReqId, or: $value.authReqId),
    refreshToken: data.get(#refreshToken, or: $value.refreshToken),
  );

  @override
  Oauth2TokenRequestCopyWith<$R2, Oauth2TokenRequest, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _Oauth2TokenRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

