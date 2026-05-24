// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_to_pay.dart';

class RequestToPayMapper extends ClassMapperBase<RequestToPay> {
  RequestToPayMapper._();

  static RequestToPayMapper? _instance;
  static RequestToPayMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestToPayMapper._());
      PartyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RequestToPay';

  static String? _$amount(RequestToPay v) => v.amount;
  static const Field<RequestToPay, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(RequestToPay v) => v.currency;
  static const Field<RequestToPay, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$externalId(RequestToPay v) => v.externalId;
  static const Field<RequestToPay, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static Party? _$payer(RequestToPay v) => v.payer;
  static const Field<RequestToPay, Party> _f$payer = Field(
    'payer',
    _$payer,
    opt: true,
  );
  static String? _$payerMessage(RequestToPay v) => v.payerMessage;
  static const Field<RequestToPay, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static String? _$payeeNote(RequestToPay v) => v.payeeNote;
  static const Field<RequestToPay, String> _f$payeeNote = Field(
    'payeeNote',
    _$payeeNote,
    opt: true,
  );

  @override
  final MappableFields<RequestToPay> fields = const {
    #amount: _f$amount,
    #currency: _f$currency,
    #externalId: _f$externalId,
    #payer: _f$payer,
    #payerMessage: _f$payerMessage,
    #payeeNote: _f$payeeNote,
  };

  static RequestToPay _instantiate(DecodingData data) {
    return RequestToPay(
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      externalId: data.dec(_f$externalId),
      payer: data.dec(_f$payer),
      payerMessage: data.dec(_f$payerMessage),
      payeeNote: data.dec(_f$payeeNote),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RequestToPay fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestToPay>(map);
  }

  static RequestToPay fromJson(String json) {
    return ensureInitialized().decodeJson<RequestToPay>(json);
  }
}

mixin RequestToPayMappable {
  String toJson() {
    return RequestToPayMapper.ensureInitialized().encodeJson<RequestToPay>(
      this as RequestToPay,
    );
  }

  Map<String, dynamic> toMap() {
    return RequestToPayMapper.ensureInitialized().encodeMap<RequestToPay>(
      this as RequestToPay,
    );
  }

  RequestToPayCopyWith<RequestToPay, RequestToPay, RequestToPay> get copyWith =>
      _RequestToPayCopyWithImpl<RequestToPay, RequestToPay>(
        this as RequestToPay,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RequestToPayMapper.ensureInitialized().stringifyValue(
      this as RequestToPay,
    );
  }

  @override
  bool operator ==(Object other) {
    return RequestToPayMapper.ensureInitialized().equalsValue(
      this as RequestToPay,
      other,
    );
  }

  @override
  int get hashCode {
    return RequestToPayMapper.ensureInitialized().hashValue(
      this as RequestToPay,
    );
  }
}

extension RequestToPayValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RequestToPay, $Out> {
  RequestToPayCopyWith<$R, RequestToPay, $Out> get $asRequestToPay =>
      $base.as((v, t, t2) => _RequestToPayCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RequestToPayCopyWith<$R, $In extends RequestToPay, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PartyCopyWith<$R, Party, Party>? get payer;
  $R call({
    String? amount,
    String? currency,
    String? externalId,
    Party? payer,
    String? payerMessage,
    String? payeeNote,
  });
  RequestToPayCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RequestToPayCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RequestToPay, $Out>
    implements RequestToPayCopyWith<$R, RequestToPay, $Out> {
  _RequestToPayCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RequestToPay> $mapper =
      RequestToPayMapper.ensureInitialized();
  @override
  PartyCopyWith<$R, Party, Party>? get payer =>
      $value.payer?.copyWith.$chain((v) => call(payer: v));
  @override
  $R call({
    Object? amount = $none,
    Object? currency = $none,
    Object? externalId = $none,
    Object? payer = $none,
    Object? payerMessage = $none,
    Object? payeeNote = $none,
  }) => $apply(
    FieldCopyWithData({
      if (amount != $none) #amount: amount,
      if (currency != $none) #currency: currency,
      if (externalId != $none) #externalId: externalId,
      if (payer != $none) #payer: payer,
      if (payerMessage != $none) #payerMessage: payerMessage,
      if (payeeNote != $none) #payeeNote: payeeNote,
    }),
  );
  @override
  RequestToPay $make(CopyWithData data) => RequestToPay(
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    externalId: data.get(#externalId, or: $value.externalId),
    payer: data.get(#payer, or: $value.payer),
    payerMessage: data.get(#payerMessage, or: $value.payerMessage),
    payeeNote: data.get(#payeeNote, or: $value.payeeNote),
  );

  @override
  RequestToPayCopyWith<$R2, RequestToPay, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RequestToPayCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

