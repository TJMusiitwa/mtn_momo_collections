// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bcauthorize_response.dart';

class BcauthorizeResponseMapper extends ClassMapperBase<BcauthorizeResponse> {
  BcauthorizeResponseMapper._();

  static BcauthorizeResponseMapper? _instance;
  static BcauthorizeResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcauthorizeResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BcauthorizeResponse';

  static String? _$authReqId(BcauthorizeResponse v) => v.authReqId;
  static const Field<BcauthorizeResponse, String> _f$authReqId = Field(
    'authReqId',
    _$authReqId,
    key: r'auth_req_id',
    opt: true,
  );
  static num? _$interval(BcauthorizeResponse v) => v.interval;
  static const Field<BcauthorizeResponse, num> _f$interval = Field(
    'interval',
    _$interval,
    opt: true,
  );
  static num? _$expiresIn(BcauthorizeResponse v) => v.expiresIn;
  static const Field<BcauthorizeResponse, num> _f$expiresIn = Field(
    'expiresIn',
    _$expiresIn,
    key: r'expires_in',
    opt: true,
  );

  @override
  final MappableFields<BcauthorizeResponse> fields = const {
    #authReqId: _f$authReqId,
    #interval: _f$interval,
    #expiresIn: _f$expiresIn,
  };

  static BcauthorizeResponse _instantiate(DecodingData data) {
    return BcauthorizeResponse(
      authReqId: data.dec(_f$authReqId),
      interval: data.dec(_f$interval),
      expiresIn: data.dec(_f$expiresIn),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BcauthorizeResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BcauthorizeResponse>(map);
  }

  static BcauthorizeResponse fromJson(String json) {
    return ensureInitialized().decodeJson<BcauthorizeResponse>(json);
  }
}

mixin BcauthorizeResponseMappable {
  String toJson() {
    return BcauthorizeResponseMapper.ensureInitialized()
        .encodeJson<BcauthorizeResponse>(this as BcauthorizeResponse);
  }

  Map<String, dynamic> toMap() {
    return BcauthorizeResponseMapper.ensureInitialized()
        .encodeMap<BcauthorizeResponse>(this as BcauthorizeResponse);
  }

  BcauthorizeResponseCopyWith<
    BcauthorizeResponse,
    BcauthorizeResponse,
    BcauthorizeResponse
  >
  get copyWith =>
      _BcauthorizeResponseCopyWithImpl<
        BcauthorizeResponse,
        BcauthorizeResponse
      >(this as BcauthorizeResponse, $identity, $identity);
  @override
  String toString() {
    return BcauthorizeResponseMapper.ensureInitialized().stringifyValue(
      this as BcauthorizeResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return BcauthorizeResponseMapper.ensureInitialized().equalsValue(
      this as BcauthorizeResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return BcauthorizeResponseMapper.ensureInitialized().hashValue(
      this as BcauthorizeResponse,
    );
  }
}

extension BcauthorizeResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BcauthorizeResponse, $Out> {
  BcauthorizeResponseCopyWith<$R, BcauthorizeResponse, $Out>
  get $asBcauthorizeResponse => $base.as(
    (v, t, t2) => _BcauthorizeResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class BcauthorizeResponseCopyWith<
  $R,
  $In extends BcauthorizeResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? authReqId, num? interval, num? expiresIn});
  BcauthorizeResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BcauthorizeResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BcauthorizeResponse, $Out>
    implements BcauthorizeResponseCopyWith<$R, BcauthorizeResponse, $Out> {
  _BcauthorizeResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BcauthorizeResponse> $mapper =
      BcauthorizeResponseMapper.ensureInitialized();
  @override
  $R call({
    Object? authReqId = $none,
    Object? interval = $none,
    Object? expiresIn = $none,
  }) => $apply(
    FieldCopyWithData({
      if (authReqId != $none) #authReqId: authReqId,
      if (interval != $none) #interval: interval,
      if (expiresIn != $none) #expiresIn: expiresIn,
    }),
  );
  @override
  BcauthorizeResponse $make(CopyWithData data) => BcauthorizeResponse(
    authReqId: data.get(#authReqId, or: $value.authReqId),
    interval: data.get(#interval, or: $value.interval),
    expiresIn: data.get(#expiresIn, or: $value.expiresIn),
  );

  @override
  BcauthorizeResponseCopyWith<$R2, BcauthorizeResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BcauthorizeResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

