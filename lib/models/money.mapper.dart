// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'money.dart';

class MoneyMapper extends ClassMapperBase<Money> {
  MoneyMapper._();

  static MoneyMapper? _instance;
  static MoneyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MoneyMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Money';

  static String? _$amount(Money v) => v.amount;
  static const Field<Money, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(Money v) => v.currency;
  static const Field<Money, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );

  @override
  final MappableFields<Money> fields = const {
    #amount: _f$amount,
    #currency: _f$currency,
  };

  static Money _instantiate(DecodingData data) {
    return Money(amount: data.dec(_f$amount), currency: data.dec(_f$currency));
  }

  @override
  final Function instantiate = _instantiate;

  static Money fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Money>(map);
  }

  static Money fromJson(String json) {
    return ensureInitialized().decodeJson<Money>(json);
  }
}

mixin MoneyMappable {
  String toJson() {
    return MoneyMapper.ensureInitialized().encodeJson<Money>(this as Money);
  }

  Map<String, dynamic> toMap() {
    return MoneyMapper.ensureInitialized().encodeMap<Money>(this as Money);
  }

  MoneyCopyWith<Money, Money, Money> get copyWith =>
      _MoneyCopyWithImpl<Money, Money>(this as Money, $identity, $identity);
  @override
  String toString() {
    return MoneyMapper.ensureInitialized().stringifyValue(this as Money);
  }

  @override
  bool operator ==(Object other) {
    return MoneyMapper.ensureInitialized().equalsValue(this as Money, other);
  }

  @override
  int get hashCode {
    return MoneyMapper.ensureInitialized().hashValue(this as Money);
  }
}

extension MoneyValueCopy<$R, $Out> on ObjectCopyWith<$R, Money, $Out> {
  MoneyCopyWith<$R, Money, $Out> get $asMoney =>
      $base.as((v, t, t2) => _MoneyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MoneyCopyWith<$R, $In extends Money, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? amount, String? currency});
  MoneyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MoneyCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Money, $Out>
    implements MoneyCopyWith<$R, Money, $Out> {
  _MoneyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Money> $mapper = MoneyMapper.ensureInitialized();
  @override
  $R call({Object? amount = $none, Object? currency = $none}) => $apply(
    FieldCopyWithData({
      if (amount != $none) #amount: amount,
      if (currency != $none) #currency: currency,
    }),
  );
  @override
  Money $make(CopyWithData data) => Money(
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
  );

  @override
  MoneyCopyWith<$R2, Money, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MoneyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

