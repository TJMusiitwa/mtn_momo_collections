// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'api_user_key_result.dart';

class ApiUserKeyResultMapper extends ClassMapperBase<ApiUserKeyResult> {
  ApiUserKeyResultMapper._();

  static ApiUserKeyResultMapper? _instance;
  static ApiUserKeyResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiUserKeyResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApiUserKeyResult';

  static String? _$apiKey(ApiUserKeyResult v) => v.apiKey;
  static const Field<ApiUserKeyResult, String> _f$apiKey = Field(
    'apiKey',
    _$apiKey,
    opt: true,
  );

  @override
  final MappableFields<ApiUserKeyResult> fields = const {#apiKey: _f$apiKey};

  static ApiUserKeyResult _instantiate(DecodingData data) {
    return ApiUserKeyResult(apiKey: data.dec(_f$apiKey));
  }

  @override
  final Function instantiate = _instantiate;

  static ApiUserKeyResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApiUserKeyResult>(map);
  }

  static ApiUserKeyResult fromJson(String json) {
    return ensureInitialized().decodeJson<ApiUserKeyResult>(json);
  }
}

mixin ApiUserKeyResultMappable {
  String toJson() {
    return ApiUserKeyResultMapper.ensureInitialized()
        .encodeJson<ApiUserKeyResult>(this as ApiUserKeyResult);
  }

  Map<String, dynamic> toMap() {
    return ApiUserKeyResultMapper.ensureInitialized()
        .encodeMap<ApiUserKeyResult>(this as ApiUserKeyResult);
  }

  ApiUserKeyResultCopyWith<ApiUserKeyResult, ApiUserKeyResult, ApiUserKeyResult>
  get copyWith =>
      _ApiUserKeyResultCopyWithImpl<ApiUserKeyResult, ApiUserKeyResult>(
        this as ApiUserKeyResult,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ApiUserKeyResultMapper.ensureInitialized().stringifyValue(
      this as ApiUserKeyResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApiUserKeyResultMapper.ensureInitialized().equalsValue(
      this as ApiUserKeyResult,
      other,
    );
  }

  @override
  int get hashCode {
    return ApiUserKeyResultMapper.ensureInitialized().hashValue(
      this as ApiUserKeyResult,
    );
  }
}

extension ApiUserKeyResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApiUserKeyResult, $Out> {
  ApiUserKeyResultCopyWith<$R, ApiUserKeyResult, $Out>
  get $asApiUserKeyResult =>
      $base.as((v, t, t2) => _ApiUserKeyResultCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApiUserKeyResultCopyWith<$R, $In extends ApiUserKeyResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? apiKey});
  ApiUserKeyResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ApiUserKeyResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApiUserKeyResult, $Out>
    implements ApiUserKeyResultCopyWith<$R, ApiUserKeyResult, $Out> {
  _ApiUserKeyResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApiUserKeyResult> $mapper =
      ApiUserKeyResultMapper.ensureInitialized();
  @override
  $R call({Object? apiKey = $none}) =>
      $apply(FieldCopyWithData({if (apiKey != $none) #apiKey: apiKey}));
  @override
  ApiUserKeyResult $make(CopyWithData data) =>
      ApiUserKeyResult(apiKey: data.get(#apiKey, or: $value.apiKey));

  @override
  ApiUserKeyResultCopyWith<$R2, ApiUserKeyResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApiUserKeyResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

