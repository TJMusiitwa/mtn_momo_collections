// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'boolean_result.dart';

class BooleanResultMapper extends ClassMapperBase<BooleanResult> {
  BooleanResultMapper._();

  static BooleanResultMapper? _instance;
  static BooleanResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BooleanResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BooleanResult';

  static bool? _$result(BooleanResult v) => v.result;
  static const Field<BooleanResult, bool> _f$result = Field(
    'result',
    _$result,
    opt: true,
  );

  @override
  final MappableFields<BooleanResult> fields = const {#result: _f$result};

  static BooleanResult _instantiate(DecodingData data) {
    return BooleanResult(result: data.dec(_f$result));
  }

  @override
  final Function instantiate = _instantiate;

  static BooleanResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BooleanResult>(map);
  }

  static BooleanResult fromJson(String json) {
    return ensureInitialized().decodeJson<BooleanResult>(json);
  }
}

mixin BooleanResultMappable {
  String toJson() {
    return BooleanResultMapper.ensureInitialized().encodeJson<BooleanResult>(
      this as BooleanResult,
    );
  }

  Map<String, dynamic> toMap() {
    return BooleanResultMapper.ensureInitialized().encodeMap<BooleanResult>(
      this as BooleanResult,
    );
  }

  BooleanResultCopyWith<BooleanResult, BooleanResult, BooleanResult>
  get copyWith => _BooleanResultCopyWithImpl<BooleanResult, BooleanResult>(
    this as BooleanResult,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return BooleanResultMapper.ensureInitialized().stringifyValue(
      this as BooleanResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return BooleanResultMapper.ensureInitialized().equalsValue(
      this as BooleanResult,
      other,
    );
  }

  @override
  int get hashCode {
    return BooleanResultMapper.ensureInitialized().hashValue(
      this as BooleanResult,
    );
  }
}

extension BooleanResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BooleanResult, $Out> {
  BooleanResultCopyWith<$R, BooleanResult, $Out> get $asBooleanResult =>
      $base.as((v, t, t2) => _BooleanResultCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BooleanResultCopyWith<$R, $In extends BooleanResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? result});
  BooleanResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BooleanResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BooleanResult, $Out>
    implements BooleanResultCopyWith<$R, BooleanResult, $Out> {
  _BooleanResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BooleanResult> $mapper =
      BooleanResultMapper.ensureInitialized();
  @override
  $R call({Object? result = $none}) =>
      $apply(FieldCopyWithData({if (result != $none) #result: result}));
  @override
  BooleanResult $make(CopyWithData data) =>
      BooleanResult(result: data.get(#result, or: $value.result));

  @override
  BooleanResultCopyWith<$R2, BooleanResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BooleanResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

