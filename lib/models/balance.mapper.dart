// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'balance.dart';

class BalanceMapper extends ClassMapperBase<Balance> {
  BalanceMapper._();

  static BalanceMapper? _instance;
  static BalanceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BalanceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Balance';

  static String? _$availableBalance(Balance v) => v.availableBalance;
  static const Field<Balance, String> _f$availableBalance = Field(
    'availableBalance',
    _$availableBalance,
    opt: true,
  );
  static String? _$currency(Balance v) => v.currency;
  static const Field<Balance, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );

  @override
  final MappableFields<Balance> fields = const {
    #availableBalance: _f$availableBalance,
    #currency: _f$currency,
  };

  static Balance _instantiate(DecodingData data) {
    return Balance(
      availableBalance: data.dec(_f$availableBalance),
      currency: data.dec(_f$currency),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Balance fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Balance>(map);
  }

  static Balance fromJson(String json) {
    return ensureInitialized().decodeJson<Balance>(json);
  }
}

mixin BalanceMappable {
  String toJson() {
    return BalanceMapper.ensureInitialized().encodeJson<Balance>(
      this as Balance,
    );
  }

  Map<String, dynamic> toMap() {
    return BalanceMapper.ensureInitialized().encodeMap<Balance>(
      this as Balance,
    );
  }

  BalanceCopyWith<Balance, Balance, Balance> get copyWith =>
      _BalanceCopyWithImpl<Balance, Balance>(
        this as Balance,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BalanceMapper.ensureInitialized().stringifyValue(this as Balance);
  }

  @override
  bool operator ==(Object other) {
    return BalanceMapper.ensureInitialized().equalsValue(
      this as Balance,
      other,
    );
  }

  @override
  int get hashCode {
    return BalanceMapper.ensureInitialized().hashValue(this as Balance);
  }
}

extension BalanceValueCopy<$R, $Out> on ObjectCopyWith<$R, Balance, $Out> {
  BalanceCopyWith<$R, Balance, $Out> get $asBalance =>
      $base.as((v, t, t2) => _BalanceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BalanceCopyWith<$R, $In extends Balance, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? availableBalance, String? currency});
  BalanceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BalanceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Balance, $Out>
    implements BalanceCopyWith<$R, Balance, $Out> {
  _BalanceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Balance> $mapper =
      BalanceMapper.ensureInitialized();
  @override
  $R call({Object? availableBalance = $none, Object? currency = $none}) =>
      $apply(
        FieldCopyWithData({
          if (availableBalance != $none) #availableBalance: availableBalance,
          if (currency != $none) #currency: currency,
        }),
      );
  @override
  Balance $make(CopyWithData data) => Balance(
    availableBalance: data.get(#availableBalance, or: $value.availableBalance),
    currency: data.get(#currency, or: $value.currency),
  );

  @override
  BalanceCopyWith<$R2, Balance, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BalanceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

