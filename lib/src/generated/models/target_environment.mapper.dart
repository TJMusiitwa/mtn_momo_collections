// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'target_environment.dart';

class TargetEnvironmentMapper extends ClassMapperBase<TargetEnvironment> {
  TargetEnvironmentMapper._();

  static TargetEnvironmentMapper? _instance;
  static TargetEnvironmentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetEnvironmentMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TargetEnvironment';

  static String? _$apiKey(TargetEnvironment v) => v.apiKey;
  static const Field<TargetEnvironment, String> _f$apiKey = Field(
    'apiKey',
    _$apiKey,
    opt: true,
  );

  @override
  final MappableFields<TargetEnvironment> fields = const {#apiKey: _f$apiKey};

  static TargetEnvironment _instantiate(DecodingData data) {
    return TargetEnvironment(apiKey: data.dec(_f$apiKey));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetEnvironment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetEnvironment>(map);
  }

  static TargetEnvironment fromJson(String json) {
    return ensureInitialized().decodeJson<TargetEnvironment>(json);
  }
}

mixin TargetEnvironmentMappable {
  String toJson() {
    return TargetEnvironmentMapper.ensureInitialized()
        .encodeJson<TargetEnvironment>(this as TargetEnvironment);
  }

  Map<String, dynamic> toMap() {
    return TargetEnvironmentMapper.ensureInitialized()
        .encodeMap<TargetEnvironment>(this as TargetEnvironment);
  }

  TargetEnvironmentCopyWith<
    TargetEnvironment,
    TargetEnvironment,
    TargetEnvironment
  >
  get copyWith =>
      _TargetEnvironmentCopyWithImpl<TargetEnvironment, TargetEnvironment>(
        this as TargetEnvironment,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TargetEnvironmentMapper.ensureInitialized().stringifyValue(
      this as TargetEnvironment,
    );
  }

  @override
  bool operator ==(Object other) {
    return TargetEnvironmentMapper.ensureInitialized().equalsValue(
      this as TargetEnvironment,
      other,
    );
  }

  @override
  int get hashCode {
    return TargetEnvironmentMapper.ensureInitialized().hashValue(
      this as TargetEnvironment,
    );
  }
}

extension TargetEnvironmentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetEnvironment, $Out> {
  TargetEnvironmentCopyWith<$R, TargetEnvironment, $Out>
  get $asTargetEnvironment => $base.as(
    (v, t, t2) => _TargetEnvironmentCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TargetEnvironmentCopyWith<
  $R,
  $In extends TargetEnvironment,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? apiKey});
  TargetEnvironmentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TargetEnvironmentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetEnvironment, $Out>
    implements TargetEnvironmentCopyWith<$R, TargetEnvironment, $Out> {
  _TargetEnvironmentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetEnvironment> $mapper =
      TargetEnvironmentMapper.ensureInitialized();
  @override
  $R call({Object? apiKey = $none}) =>
      $apply(FieldCopyWithData({if (apiKey != $none) #apiKey: apiKey}));
  @override
  TargetEnvironment $make(CopyWithData data) =>
      TargetEnvironment(apiKey: data.get(#apiKey, or: $value.apiKey));

  @override
  TargetEnvironmentCopyWith<$R2, TargetEnvironment, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TargetEnvironmentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

