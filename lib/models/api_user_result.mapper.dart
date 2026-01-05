// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'api_user_result.dart';

class ApiUserResultMapper extends ClassMapperBase<ApiUserResult> {
  ApiUserResultMapper._();

  static ApiUserResultMapper? _instance;
  static ApiUserResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiUserResultMapper._());
      PaymentServerUrlMapper.ensureInitialized();
      TargetEnvironmentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ApiUserResult';

  static String? _$providerCallbackHost(ApiUserResult v) =>
      v.providerCallbackHost;
  static const Field<ApiUserResult, String> _f$providerCallbackHost = Field(
    'providerCallbackHost',
    _$providerCallbackHost,
    opt: true,
  );
  static PaymentServerUrl? _$paymentServerUrl(ApiUserResult v) =>
      v.paymentServerUrl;
  static const Field<ApiUserResult, PaymentServerUrl> _f$paymentServerUrl =
      Field('paymentServerUrl', _$paymentServerUrl, opt: true);
  static TargetEnvironment? _$targetEnvironment(ApiUserResult v) =>
      v.targetEnvironment;
  static const Field<ApiUserResult, TargetEnvironment> _f$targetEnvironment =
      Field('targetEnvironment', _$targetEnvironment, opt: true);

  @override
  final MappableFields<ApiUserResult> fields = const {
    #providerCallbackHost: _f$providerCallbackHost,
    #paymentServerUrl: _f$paymentServerUrl,
    #targetEnvironment: _f$targetEnvironment,
  };

  static ApiUserResult _instantiate(DecodingData data) {
    return ApiUserResult(
      providerCallbackHost: data.dec(_f$providerCallbackHost),
      paymentServerUrl: data.dec(_f$paymentServerUrl),
      targetEnvironment: data.dec(_f$targetEnvironment),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ApiUserResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApiUserResult>(map);
  }

  static ApiUserResult fromJson(String json) {
    return ensureInitialized().decodeJson<ApiUserResult>(json);
  }
}

mixin ApiUserResultMappable {
  String toJson() {
    return ApiUserResultMapper.ensureInitialized().encodeJson<ApiUserResult>(
      this as ApiUserResult,
    );
  }

  Map<String, dynamic> toMap() {
    return ApiUserResultMapper.ensureInitialized().encodeMap<ApiUserResult>(
      this as ApiUserResult,
    );
  }

  ApiUserResultCopyWith<ApiUserResult, ApiUserResult, ApiUserResult>
  get copyWith => _ApiUserResultCopyWithImpl<ApiUserResult, ApiUserResult>(
    this as ApiUserResult,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ApiUserResultMapper.ensureInitialized().stringifyValue(
      this as ApiUserResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApiUserResultMapper.ensureInitialized().equalsValue(
      this as ApiUserResult,
      other,
    );
  }

  @override
  int get hashCode {
    return ApiUserResultMapper.ensureInitialized().hashValue(
      this as ApiUserResult,
    );
  }
}

extension ApiUserResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApiUserResult, $Out> {
  ApiUserResultCopyWith<$R, ApiUserResult, $Out> get $asApiUserResult =>
      $base.as((v, t, t2) => _ApiUserResultCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApiUserResultCopyWith<$R, $In extends ApiUserResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PaymentServerUrlCopyWith<$R, PaymentServerUrl, PaymentServerUrl>?
  get paymentServerUrl;
  TargetEnvironmentCopyWith<$R, TargetEnvironment, TargetEnvironment>?
  get targetEnvironment;
  $R call({
    String? providerCallbackHost,
    PaymentServerUrl? paymentServerUrl,
    TargetEnvironment? targetEnvironment,
  });
  ApiUserResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApiUserResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApiUserResult, $Out>
    implements ApiUserResultCopyWith<$R, ApiUserResult, $Out> {
  _ApiUserResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApiUserResult> $mapper =
      ApiUserResultMapper.ensureInitialized();
  @override
  PaymentServerUrlCopyWith<$R, PaymentServerUrl, PaymentServerUrl>?
  get paymentServerUrl => $value.paymentServerUrl?.copyWith.$chain(
    (v) => call(paymentServerUrl: v),
  );
  @override
  TargetEnvironmentCopyWith<$R, TargetEnvironment, TargetEnvironment>?
  get targetEnvironment => $value.targetEnvironment?.copyWith.$chain(
    (v) => call(targetEnvironment: v),
  );
  @override
  $R call({
    Object? providerCallbackHost = $none,
    Object? paymentServerUrl = $none,
    Object? targetEnvironment = $none,
  }) => $apply(
    FieldCopyWithData({
      if (providerCallbackHost != $none)
        #providerCallbackHost: providerCallbackHost,
      if (paymentServerUrl != $none) #paymentServerUrl: paymentServerUrl,
      if (targetEnvironment != $none) #targetEnvironment: targetEnvironment,
    }),
  );
  @override
  ApiUserResult $make(CopyWithData data) => ApiUserResult(
    providerCallbackHost: data.get(
      #providerCallbackHost,
      or: $value.providerCallbackHost,
    ),
    paymentServerUrl: data.get(#paymentServerUrl, or: $value.paymentServerUrl),
    targetEnvironment: data.get(
      #targetEnvironment,
      or: $value.targetEnvironment,
    ),
  );

  @override
  ApiUserResultCopyWith<$R2, ApiUserResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApiUserResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

