// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transfer_result.dart';

class TransferResultMapper extends ClassMapperBase<TransferResult> {
  TransferResultMapper._();

  static TransferResultMapper? _instance;
  static TransferResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransferResultMapper._());
      PartyMapper.ensureInitialized();
      TransferResultStatusMapper.ensureInitialized();
      ErrorReasonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TransferResult';

  static String? _$amount(TransferResult v) => v.amount;
  static const Field<TransferResult, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(TransferResult v) => v.currency;
  static const Field<TransferResult, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$financialTransactionId(TransferResult v) =>
      v.financialTransactionId;
  static const Field<TransferResult, String> _f$financialTransactionId = Field(
    'financialTransactionId',
    _$financialTransactionId,
    opt: true,
  );
  static String? _$externalId(TransferResult v) => v.externalId;
  static const Field<TransferResult, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static Party? _$payee(TransferResult v) => v.payee;
  static const Field<TransferResult, Party> _f$payee = Field(
    'payee',
    _$payee,
    opt: true,
  );
  static String? _$payerMessage(TransferResult v) => v.payerMessage;
  static const Field<TransferResult, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static String? _$payeeNote(TransferResult v) => v.payeeNote;
  static const Field<TransferResult, String> _f$payeeNote = Field(
    'payeeNote',
    _$payeeNote,
    opt: true,
  );
  static TransferResultStatus? _$status(TransferResult v) => v.status;
  static const Field<TransferResult, TransferResultStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static ErrorReason? _$reason(TransferResult v) => v.reason;
  static const Field<TransferResult, ErrorReason> _f$reason = Field(
    'reason',
    _$reason,
    opt: true,
  );

  @override
  final MappableFields<TransferResult> fields = const {
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

  static TransferResult _instantiate(DecodingData data) {
    return TransferResult(
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

  static TransferResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransferResult>(map);
  }

  static TransferResult fromJson(String json) {
    return ensureInitialized().decodeJson<TransferResult>(json);
  }
}

mixin TransferResultMappable {
  String toJson() {
    return TransferResultMapper.ensureInitialized().encodeJson<TransferResult>(
      this as TransferResult,
    );
  }

  Map<String, dynamic> toMap() {
    return TransferResultMapper.ensureInitialized().encodeMap<TransferResult>(
      this as TransferResult,
    );
  }

  TransferResultCopyWith<TransferResult, TransferResult, TransferResult>
  get copyWith => _TransferResultCopyWithImpl<TransferResult, TransferResult>(
    this as TransferResult,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return TransferResultMapper.ensureInitialized().stringifyValue(
      this as TransferResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return TransferResultMapper.ensureInitialized().equalsValue(
      this as TransferResult,
      other,
    );
  }

  @override
  int get hashCode {
    return TransferResultMapper.ensureInitialized().hashValue(
      this as TransferResult,
    );
  }
}

extension TransferResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransferResult, $Out> {
  TransferResultCopyWith<$R, TransferResult, $Out> get $asTransferResult =>
      $base.as((v, t, t2) => _TransferResultCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransferResultCopyWith<$R, $In extends TransferResult, $Out>
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
    TransferResultStatus? status,
    ErrorReason? reason,
  });
  TransferResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TransferResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransferResult, $Out>
    implements TransferResultCopyWith<$R, TransferResult, $Out> {
  _TransferResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransferResult> $mapper =
      TransferResultMapper.ensureInitialized();
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
  TransferResult $make(CopyWithData data) => TransferResult(
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
  TransferResultCopyWith<$R2, TransferResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TransferResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

