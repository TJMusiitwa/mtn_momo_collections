// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'refund.dart';

class RefundMapper extends ClassMapperBase<Refund> {
  RefundMapper._();

  static RefundMapper? _instance;
  static RefundMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RefundMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Refund';

  static String? _$amount(Refund v) => v.amount;
  static const Field<Refund, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(Refund v) => v.currency;
  static const Field<Refund, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$externalId(Refund v) => v.externalId;
  static const Field<Refund, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static String? _$payerMessage(Refund v) => v.payerMessage;
  static const Field<Refund, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static String? _$payeeNote(Refund v) => v.payeeNote;
  static const Field<Refund, String> _f$payeeNote = Field(
    'payeeNote',
    _$payeeNote,
    opt: true,
  );
  static String? _$referenceIdToRefund(Refund v) => v.referenceIdToRefund;
  static const Field<Refund, String> _f$referenceIdToRefund = Field(
    'referenceIdToRefund',
    _$referenceIdToRefund,
    opt: true,
  );

  @override
  final MappableFields<Refund> fields = const {
    #amount: _f$amount,
    #currency: _f$currency,
    #externalId: _f$externalId,
    #payerMessage: _f$payerMessage,
    #payeeNote: _f$payeeNote,
    #referenceIdToRefund: _f$referenceIdToRefund,
  };

  static Refund _instantiate(DecodingData data) {
    return Refund(
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      externalId: data.dec(_f$externalId),
      payerMessage: data.dec(_f$payerMessage),
      payeeNote: data.dec(_f$payeeNote),
      referenceIdToRefund: data.dec(_f$referenceIdToRefund),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Refund fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Refund>(map);
  }

  static Refund fromJson(String json) {
    return ensureInitialized().decodeJson<Refund>(json);
  }
}

mixin RefundMappable {
  String toJson() {
    return RefundMapper.ensureInitialized().encodeJson<Refund>(this as Refund);
  }

  Map<String, dynamic> toMap() {
    return RefundMapper.ensureInitialized().encodeMap<Refund>(this as Refund);
  }

  RefundCopyWith<Refund, Refund, Refund> get copyWith =>
      _RefundCopyWithImpl<Refund, Refund>(this as Refund, $identity, $identity);
  @override
  String toString() {
    return RefundMapper.ensureInitialized().stringifyValue(this as Refund);
  }

  @override
  bool operator ==(Object other) {
    return RefundMapper.ensureInitialized().equalsValue(this as Refund, other);
  }

  @override
  int get hashCode {
    return RefundMapper.ensureInitialized().hashValue(this as Refund);
  }
}

extension RefundValueCopy<$R, $Out> on ObjectCopyWith<$R, Refund, $Out> {
  RefundCopyWith<$R, Refund, $Out> get $asRefund =>
      $base.as((v, t, t2) => _RefundCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RefundCopyWith<$R, $In extends Refund, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? amount,
    String? currency,
    String? externalId,
    String? payerMessage,
    String? payeeNote,
    String? referenceIdToRefund,
  });
  RefundCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RefundCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Refund, $Out>
    implements RefundCopyWith<$R, Refund, $Out> {
  _RefundCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Refund> $mapper = RefundMapper.ensureInitialized();
  @override
  $R call({
    Object? amount = $none,
    Object? currency = $none,
    Object? externalId = $none,
    Object? payerMessage = $none,
    Object? payeeNote = $none,
    Object? referenceIdToRefund = $none,
  }) => $apply(
    FieldCopyWithData({
      if (amount != $none) #amount: amount,
      if (currency != $none) #currency: currency,
      if (externalId != $none) #externalId: externalId,
      if (payerMessage != $none) #payerMessage: payerMessage,
      if (payeeNote != $none) #payeeNote: payeeNote,
      if (referenceIdToRefund != $none)
        #referenceIdToRefund: referenceIdToRefund,
    }),
  );
  @override
  Refund $make(CopyWithData data) => Refund(
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    externalId: data.get(#externalId, or: $value.externalId),
    payerMessage: data.get(#payerMessage, or: $value.payerMessage),
    payeeNote: data.get(#payeeNote, or: $value.payeeNote),
    referenceIdToRefund: data.get(
      #referenceIdToRefund,
      or: $value.referenceIdToRefund,
    ),
  );

  @override
  RefundCopyWith<$R2, Refund, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RefundCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

