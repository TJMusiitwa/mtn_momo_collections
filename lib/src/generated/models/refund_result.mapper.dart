// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'refund_result.dart';

class RefundResultMapper extends ClassMapperBase<RefundResult> {
  RefundResultMapper._();

  static RefundResultMapper? _instance;
  static RefundResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RefundResultMapper._());
      PartyMapper.ensureInitialized();
      RefundResultStatusMapper.ensureInitialized();
      ErrorReasonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RefundResult';

  static String? _$amount(RefundResult v) => v.amount;
  static const Field<RefundResult, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(RefundResult v) => v.currency;
  static const Field<RefundResult, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$financialTransactionId(RefundResult v) =>
      v.financialTransactionId;
  static const Field<RefundResult, String> _f$financialTransactionId = Field(
    'financialTransactionId',
    _$financialTransactionId,
    opt: true,
  );
  static String? _$externalId(RefundResult v) => v.externalId;
  static const Field<RefundResult, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static Party? _$payee(RefundResult v) => v.payee;
  static const Field<RefundResult, Party> _f$payee = Field(
    'payee',
    _$payee,
    opt: true,
  );
  static String? _$payerMessage(RefundResult v) => v.payerMessage;
  static const Field<RefundResult, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static String? _$payeeNote(RefundResult v) => v.payeeNote;
  static const Field<RefundResult, String> _f$payeeNote = Field(
    'payeeNote',
    _$payeeNote,
    opt: true,
  );
  static RefundResultStatus? _$status(RefundResult v) => v.status;
  static const Field<RefundResult, RefundResultStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static ErrorReason? _$reason(RefundResult v) => v.reason;
  static const Field<RefundResult, ErrorReason> _f$reason = Field(
    'reason',
    _$reason,
    opt: true,
  );

  @override
  final MappableFields<RefundResult> fields = const {
    #amount: _f$amount,
    #currency: _f$currency,
    #financialTransactionId: _f$financialTransactionId,
    #externalId: _f$externalId,
    #payee: _f$payee,
    #payerMessage: _f$payerMessage,
    #payeeNote: _f$payeeNote,
    #status: _f$status,
    #reason: _f$reason,
  };

  static RefundResult _instantiate(DecodingData data) {
    return RefundResult(
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      financialTransactionId: data.dec(_f$financialTransactionId),
      externalId: data.dec(_f$externalId),
      payee: data.dec(_f$payee),
      payerMessage: data.dec(_f$payerMessage),
      payeeNote: data.dec(_f$payeeNote),
      status: data.dec(_f$status),
      reason: data.dec(_f$reason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RefundResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RefundResult>(map);
  }

  static RefundResult fromJson(String json) {
    return ensureInitialized().decodeJson<RefundResult>(json);
  }
}

mixin RefundResultMappable {
  String toJson() {
    return RefundResultMapper.ensureInitialized().encodeJson<RefundResult>(
      this as RefundResult,
    );
  }

  Map<String, dynamic> toMap() {
    return RefundResultMapper.ensureInitialized().encodeMap<RefundResult>(
      this as RefundResult,
    );
  }

  RefundResultCopyWith<RefundResult, RefundResult, RefundResult> get copyWith =>
      _RefundResultCopyWithImpl<RefundResult, RefundResult>(
        this as RefundResult,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RefundResultMapper.ensureInitialized().stringifyValue(
      this as RefundResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return RefundResultMapper.ensureInitialized().equalsValue(
      this as RefundResult,
      other,
    );
  }

  @override
  int get hashCode {
    return RefundResultMapper.ensureInitialized().hashValue(
      this as RefundResult,
    );
  }
}

extension RefundResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RefundResult, $Out> {
  RefundResultCopyWith<$R, RefundResult, $Out> get $asRefundResult =>
      $base.as((v, t, t2) => _RefundResultCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RefundResultCopyWith<$R, $In extends RefundResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PartyCopyWith<$R, Party, Party>? get payee;
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get reason;
  $R call({
    String? amount,
    String? currency,
    String? financialTransactionId,
    String? externalId,
    Party? payee,
    String? payerMessage,
    String? payeeNote,
    RefundResultStatus? status,
    ErrorReason? reason,
  });
  RefundResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RefundResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RefundResult, $Out>
    implements RefundResultCopyWith<$R, RefundResult, $Out> {
  _RefundResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RefundResult> $mapper =
      RefundResultMapper.ensureInitialized();
  @override
  PartyCopyWith<$R, Party, Party>? get payee =>
      $value.payee?.copyWith.$chain((v) => call(payee: v));
  @override
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get reason =>
      $value.reason?.copyWith.$chain((v) => call(reason: v));
  @override
  $R call({
    Object? amount = $none,
    Object? currency = $none,
    Object? financialTransactionId = $none,
    Object? externalId = $none,
    Object? payee = $none,
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
      if (payee != $none) #payee: payee,
      if (payerMessage != $none) #payerMessage: payerMessage,
      if (payeeNote != $none) #payeeNote: payeeNote,
      if (status != $none) #status: status,
      if (reason != $none) #reason: reason,
    }),
  );
  @override
  RefundResult $make(CopyWithData data) => RefundResult(
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    financialTransactionId: data.get(
      #financialTransactionId,
      or: $value.financialTransactionId,
    ),
    externalId: data.get(#externalId, or: $value.externalId),
    payee: data.get(#payee, or: $value.payee),
    payerMessage: data.get(#payerMessage, or: $value.payerMessage),
    payeeNote: data.get(#payeeNote, or: $value.payeeNote),
    status: data.get(#status, or: $value.status),
    reason: data.get(#reason, or: $value.reason),
  );

  @override
  RefundResultCopyWith<$R2, RefundResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RefundResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

