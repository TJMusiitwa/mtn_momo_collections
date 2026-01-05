// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'api_user.dart';

class ApiUserMapper extends ClassMapperBase<ApiUser> {
  ApiUserMapper._();

  static ApiUserMapper? _instance;
  static ApiUserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiUserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApiUser';

  static String? _$providerCallbackHost(ApiUser v) => v.providerCallbackHost;
  static const Field<ApiUser, String> _f$providerCallbackHost = Field(
    'providerCallbackHost',
    _$providerCallbackHost,
    opt: true,
  );

  @override
  final MappableFields<ApiUser> fields = const {
    #providerCallbackHost: _f$providerCallbackHost,
  };

  static ApiUser _instantiate(DecodingData data) {
    return ApiUser(providerCallbackHost: data.dec(_f$providerCallbackHost));
  }

  @override
  final Function instantiate = _instantiate;

  static ApiUser fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApiUser>(map);
  }

  static ApiUser fromJson(String json) {
    return ensureInitialized().decodeJson<ApiUser>(json);
  }
}

mixin ApiUserMappable {
  String toJson() {
    return ApiUserMapper.ensureInitialized().encodeJson<ApiUser>(
      this as ApiUser,
    );
  }

  Map<String, dynamic> toMap() {
    return ApiUserMapper.ensureInitialized().encodeMap<ApiUser>(
      this as ApiUser,
    );
  }

  ApiUserCopyWith<ApiUser, ApiUser, ApiUser> get copyWith =>
      _ApiUserCopyWithImpl<ApiUser, ApiUser>(
        this as ApiUser,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ApiUserMapper.ensureInitialized().stringifyValue(this as ApiUser);
  }

  @override
  bool operator ==(Object other) {
    return ApiUserMapper.ensureInitialized().equalsValue(
      this as ApiUser,
      other,
    );
  }

  @override
  int get hashCode {
    return ApiUserMapper.ensureInitialized().hashValue(this as ApiUser);
  }
}

extension ApiUserValueCopy<$R, $Out> on ObjectCopyWith<$R, ApiUser, $Out> {
  ApiUserCopyWith<$R, ApiUser, $Out> get $asApiUser =>
      $base.as((v, t, t2) => _ApiUserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApiUserCopyWith<$R, $In extends ApiUser, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? providerCallbackHost});
  ApiUserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApiUserCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApiUser, $Out>
    implements ApiUserCopyWith<$R, ApiUser, $Out> {
  _ApiUserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApiUser> $mapper =
      ApiUserMapper.ensureInitialized();
  @override
  $R call({Object? providerCallbackHost = $none}) => $apply(
    FieldCopyWithData({
      if (providerCallbackHost != $none)
        #providerCallbackHost: providerCallbackHost,
    }),
  );
  @override
  ApiUser $make(CopyWithData data) => ApiUser(
    providerCallbackHost: data.get(
      #providerCallbackHost,
      or: $value.providerCallbackHost,
    ),
  );

  @override
  ApiUserCopyWith<$R2, ApiUser, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ApiUserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

