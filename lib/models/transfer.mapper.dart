// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transfer.dart';

class TransferMapper extends ClassMapperBase<Transfer> {
  TransferMapper._();

  static TransferMapper? _instance;
  static TransferMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransferMapper._());
      PartyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Transfer';

  static String? _$amount(Transfer v) => v.amount;
  static const Field<Transfer, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(Transfer v) => v.currency;
  static const Field<Transfer, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$externalId(Transfer v) => v.externalId;
  static const Field<Transfer, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static Party? _$payee(Transfer v) => v.payee;
  static const Field<Transfer, Party> _f$payee = Field(
    'payee',
    _$payee,
    opt: true,
  );
  static String? _$payerMessage(Transfer v) => v.payerMessage;
  static const Field<Transfer, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static String? _$payeeNote(Transfer v) => v.payeeNote;
  static const Field<Transfer, String> _f$payeeNote = Field(
    'payeeNote',
    _$payeeNote,
    opt: true,
  );

  @override
  final MappableFields<Transfer> fields = const {
    #amount: _f$amount,
    #currency: _f$currency,
    #externalId: _f$externalId,
    #payee: _f$payee,
    #payerMessage: _f$payerMessage,
    #payeeNote: _f$payeeNote,
  };

  static Transfer _instantiate(DecodingData data) {
    return Transfer(
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      externalId: data.dec(_f$externalId),
      payee: data.dec(_f$payee),
      payerMessage: data.dec(_f$payerMessage),
      payeeNote: data.dec(_f$payeeNote),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Transfer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Transfer>(map);
  }

  static Transfer fromJson(String json) {
    return ensureInitialized().decodeJson<Transfer>(json);
  }
}

mixin TransferMappable {
  String toJson() {
    return TransferMapper.ensureInitialized().encodeJson<Transfer>(
      this as Transfer,
    );
  }

  Map<String, dynamic> toMap() {
    return TransferMapper.ensureInitialized().encodeMap<Transfer>(
      this as Transfer,
    );
  }

  TransferCopyWith<Transfer, Transfer, Transfer> get copyWith =>
      _TransferCopyWithImpl<Transfer, Transfer>(
        this as Transfer,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TransferMapper.ensureInitialized().stringifyValue(this as Transfer);
  }

  @override
  bool operator ==(Object other) {
    return TransferMapper.ensureInitialized().equalsValue(
      this as Transfer,
      other,
    );
  }

  @override
  int get hashCode {
    return TransferMapper.ensureInitialized().hashValue(this as Transfer);
  }
}

extension TransferValueCopy<$R, $Out> on ObjectCopyWith<$R, Transfer, $Out> {
  TransferCopyWith<$R, Transfer, $Out> get $asTransfer =>
      $base.as((v, t, t2) => _TransferCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransferCopyWith<$R, $In extends Transfer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PartyCopyWith<$R, Party, Party>? get payee;
  $R call({
    String? amount,
    String? currency,
    String? externalId,
    Party? payee,
    String? payerMessage,
    String? payeeNote,
  });
  TransferCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TransferCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Transfer, $Out>
    implements TransferCopyWith<$R, Transfer, $Out> {
  _TransferCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Transfer> $mapper =
      TransferMapper.ensureInitialized();
  @override
  PartyCopyWith<$R, Party, Party>? get payee =>
      $value.payee?.copyWith.$chain((v) => call(payee: v));
  @override
  $R call({
    Object? amount = $none,
    Object? currency = $none,
    Object? externalId = $none,
    Object? payee = $none,
    Object? payerMessage = $none,
    Object? payeeNote = $none,
  }) => $apply(
    FieldCopyWithData({
      if (amount != $none) #amount: amount,
      if (currency != $none) #currency: currency,
      if (externalId != $none) #externalId: externalId,
      if (payee != $none) #payee: payee,
      if (payerMessage != $none) #payerMessage: payerMessage,
      if (payeeNote != $none) #payeeNote: payeeNote,
    }),
  );
  @override
  Transfer $make(CopyWithData data) => Transfer(
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    externalId: data.get(#externalId, or: $value.externalId),
    payee: data.get(#payee, or: $value.payee),
    payerMessage: data.get(#payerMessage, or: $value.payerMessage),
    payeeNote: data.get(#payeeNote, or: $value.payeeNote),
  );

  @override
  TransferCopyWith<$R2, Transfer, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TransferCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

