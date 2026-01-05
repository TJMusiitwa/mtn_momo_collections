// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'payment_server_url.dart';

class PaymentServerUrlMapper extends ClassMapperBase<PaymentServerUrl> {
  PaymentServerUrlMapper._();

  static PaymentServerUrlMapper? _instance;
  static PaymentServerUrlMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaymentServerUrlMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PaymentServerUrl';

  static String? _$apiKey(PaymentServerUrl v) => v.apiKey;
  static const Field<PaymentServerUrl, String> _f$apiKey = Field(
    'apiKey',
    _$apiKey,
    opt: true,
  );

  @override
  final MappableFields<PaymentServerUrl> fields = const {#apiKey: _f$apiKey};

  static PaymentServerUrl _instantiate(DecodingData data) {
    return PaymentServerUrl(apiKey: data.dec(_f$apiKey));
  }

  @override
  final Function instantiate = _instantiate;

  static PaymentServerUrl fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaymentServerUrl>(map);
  }

  static PaymentServerUrl fromJson(String json) {
    return ensureInitialized().decodeJson<PaymentServerUrl>(json);
  }
}

mixin PaymentServerUrlMappable {
  String toJson() {
    return PaymentServerUrlMapper.ensureInitialized()
        .encodeJson<PaymentServerUrl>(this as PaymentServerUrl);
  }

  Map<String, dynamic> toMap() {
    return PaymentServerUrlMapper.ensureInitialized()
        .encodeMap<PaymentServerUrl>(this as PaymentServerUrl);
  }

  PaymentServerUrlCopyWith<PaymentServerUrl, PaymentServerUrl, PaymentServerUrl>
  get copyWith =>
      _PaymentServerUrlCopyWithImpl<PaymentServerUrl, PaymentServerUrl>(
        this as PaymentServerUrl,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PaymentServerUrlMapper.ensureInitialized().stringifyValue(
      this as PaymentServerUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    return PaymentServerUrlMapper.ensureInitialized().equalsValue(
      this as PaymentServerUrl,
      other,
    );
  }

  @override
  int get hashCode {
    return PaymentServerUrlMapper.ensureInitialized().hashValue(
      this as PaymentServerUrl,
    );
  }
}

extension PaymentServerUrlValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaymentServerUrl, $Out> {
  PaymentServerUrlCopyWith<$R, PaymentServerUrl, $Out>
  get $asPaymentServerUrl =>
      $base.as((v, t, t2) => _PaymentServerUrlCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaymentServerUrlCopyWith<$R, $In extends PaymentServerUrl, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? apiKey});
  PaymentServerUrlCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PaymentServerUrlCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaymentServerUrl, $Out>
    implements PaymentServerUrlCopyWith<$R, PaymentServerUrl, $Out> {
  _PaymentServerUrlCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaymentServerUrl> $mapper =
      PaymentServerUrlMapper.ensureInitialized();
  @override
  $R call({Object? apiKey = $none}) =>
      $apply(FieldCopyWithData({if (apiKey != $none) #apiKey: apiKey}));
  @override
  PaymentServerUrl $make(CopyWithData data) =>
      PaymentServerUrl(apiKey: data.get(#apiKey, or: $value.apiKey));

  @override
  PaymentServerUrlCopyWith<$R2, PaymentServerUrl, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PaymentServerUrlCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

