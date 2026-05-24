// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_to_pay_result.dart';

class RequestToPayResultMapper extends ClassMapperBase<RequestToPayResult> {
  RequestToPayResultMapper._();

  static RequestToPayResultMapper? _instance;
  static RequestToPayResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestToPayResultMapper._());
      PartyMapper.ensureInitialized();
      RequestToPayResultStatusMapper.ensureInitialized();
      ErrorReasonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RequestToPayResult';

  static String? _$amount(RequestToPayResult v) => v.amount;
  static const Field<RequestToPayResult, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(RequestToPayResult v) => v.currency;
  static const Field<RequestToPayResult, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$financialTransactionId(RequestToPayResult v) =>
      v.financialTransactionId;
  static const Field<RequestToPayResult, String> _f$financialTransactionId =
      Field('financialTransactionId', _$financialTransactionId, opt: true);
  static String? _$externalId(RequestToPayResult v) => v.externalId;
  static const Field<RequestToPayResult, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static Party? _$payer(RequestToPayResult v) => v.payer;
  static const Field<RequestToPayResult, Party> _f$payer = Field(
    'payer',
    _$payer,
    opt: true,
  );
  static String? _$payerMessage(RequestToPayResult v) => v.payerMessage;
  static const Field<RequestToPayResult, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static String? _$payeeNote(RequestToPayResult v) => v.payeeNote;
  static const Field<RequestToPayResult, String> _f$payeeNote = Field(
    'payeeNote',
    _$payeeNote,
    opt: true,
  );
  static RequestToPayResultStatus? _$status(RequestToPayResult v) => v.status;
  static const Field<RequestToPayResult, RequestToPayResultStatus> _f$status =
      Field('status', _$status, opt: true);
  static ErrorReason? _$reason(RequestToPayResult v) => v.reason;
  static const Field<RequestToPayResult, ErrorReason> _f$reason = Field(
    'reason',
    _$reason,
    opt: true,
  );

  @override
  final MappableFields<RequestToPayResult> fields = const {
    #amount: _f$amount,
    #currency: _f$currency,
    #financialTransactionId: _f$financialTransactionId,
    #externalId: _f$externalId,
    #payer: _f$payer,
    #payerMessage: _f$payerMessage,
    #payeeNote: _f$payeeNote,
    #status: _f$status,
    #reason: _f$reason,
  };

  static RequestToPayResult _instantiate(DecodingData data) {
    return RequestToPayResult(
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      financialTransactionId: data.dec(_f$financialTransactionId),
      externalId: data.dec(_f$externalId),
      payer: data.dec(_f$payer),
      payerMessage: data.dec(_f$payerMessage),
      payeeNote: data.dec(_f$payeeNote),
      status: data.dec(_f$status),
      reason: data.dec(_f$reason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RequestToPayResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestToPayResult>(map);
  }

  static RequestToPayResult fromJson(String json) {
    return ensureInitialized().decodeJson<RequestToPayResult>(json);
  }
}

mixin RequestToPayResultMappable {
  String toJson() {
    return RequestToPayResultMapper.ensureInitialized()
        .encodeJson<RequestToPayResult>(this as RequestToPayResult);
  }

  Map<String, dynamic> toMap() {
    return RequestToPayResultMapper.ensureInitialized()
        .encodeMap<RequestToPayResult>(this as RequestToPayResult);
  }

  RequestToPayResultCopyWith<
    RequestToPayResult,
    RequestToPayResult,
    RequestToPayResult
  >
  get copyWith =>
      _RequestToPayResultCopyWithImpl<RequestToPayResult, RequestToPayResult>(
        this as RequestToPayResult,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RequestToPayResultMapper.ensureInitialized().stringifyValue(
      this as RequestToPayResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return RequestToPayResultMapper.ensureInitialized().equalsValue(
      this as RequestToPayResult,
      other,
    );
  }

  @override
  int get hashCode {
    return RequestToPayResultMapper.ensureInitialized().hashValue(
      this as RequestToPayResult,
    );
  }
}

extension RequestToPayResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RequestToPayResult, $Out> {
  RequestToPayResultCopyWith<$R, RequestToPayResult, $Out>
  get $asRequestToPayResult => $base.as(
    (v, t, t2) => _RequestToPayResultCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RequestToPayResultCopyWith<
  $R,
  $In extends RequestToPayResult,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  PartyCopyWith<$R, Party, Party>? get payer;
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get reason;
  $R call({
    String? amount,
    String? currency,
    String? financialTransactionId,
    String? externalId,
    Party? payer,
    String? payerMessage,
    String? payeeNote,
    RequestToPayResultStatus? status,
    ErrorReason? reason,
  });
  RequestToPayResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RequestToPayResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RequestToPayResult, $Out>
    implements RequestToPayResultCopyWith<$R, RequestToPayResult, $Out> {
  _RequestToPayResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RequestToPayResult> $mapper =
      RequestToPayResultMapper.ensureInitialized();
  @override
  PartyCopyWith<$R, Party, Party>? get payer =>
      $value.payer?.copyWith.$chain((v) => call(payer: v));
  @override
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get reason =>
      $value.reason?.copyWith.$chain((v) => call(reason: v));
  @override
  $R call({
    Object? amount = $none,
    Object? currency = $none,
    Object? financialTransactionId = $none,
    Object? externalId = $none,
    Object? payer = $none,
    Object? payerMessage = $none,
    Object? payeeNote = $none,
    Object? status = $none,
    Object? reason = $none,
  }) => $apply(
    FieldCopyWithData({
      if (amount != $none) #amount: amount,
      if (currency != $none) #currency: currency,
      if (financialTransactionId != $none)
        #financialTransactionId: financialTransactionId,
      if (externalId != $none) #externalId: externalId,
      if (payer != $none) #payer: payer,
      if (payerMessage != $none) #payerMessage: payerMessage,
      if (payeeNote != $none) #payeeNote: payeeNote,
      if (status != $none) #status: status,
      if (reason != $none) #reason: reason,
    }),
  );
  @override
  RequestToPayResult $make(CopyWithData data) => RequestToPayResult(
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    financialTransactionId: data.get(
      #financialTransactionId,
      or: $value.financialTransactionId,
    ),
    externalId: data.get(#externalId, or: $value.externalId),
    payer: data.get(#payer, or: $value.payer),
    payerMessage: data.get(#payerMessage, or: $value.payerMessage),
    payeeNote: data.get(#payeeNote, or: $value.payeeNote),
    status: data.get(#status, or: $value.status),
    reason: data.get(#reason, or: $value.reason),
  );

  @override
  RequestToPayResultCopyWith<$R2, RequestToPayResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RequestToPayResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

