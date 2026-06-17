// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cash_transfer_result.dart';

class CashTransferResultMapper extends ClassMapperBase<CashTransferResult> {
  CashTransferResultMapper._();

  static CashTransferResultMapper? _instance;
  static CashTransferResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CashTransferResultMapper._());
      PartyMapper.ensureInitialized();
      CashTransferResultStatusMapper.ensureInitialized();
      ErrorReasonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CashTransferResult';

  static String? _$amount(CashTransferResult v) => v.amount;
  static const Field<CashTransferResult, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(CashTransferResult v) => v.currency;
  static const Field<CashTransferResult, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$financialTransactionId(CashTransferResult v) =>
      v.financialTransactionId;
  static const Field<CashTransferResult, String> _f$financialTransactionId =
      Field('financialTransactionId', _$financialTransactionId, opt: true);
  static String? _$externalId(CashTransferResult v) => v.externalId;
  static const Field<CashTransferResult, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static Party? _$payee(CashTransferResult v) => v.payee;
  static const Field<CashTransferResult, Party> _f$payee = Field(
    'payee',
    _$payee,
    opt: true,
  );
  static String? _$payerMessage(CashTransferResult v) => v.payerMessage;
  static const Field<CashTransferResult, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static String? _$payeeNote(CashTransferResult v) => v.payeeNote;
  static const Field<CashTransferResult, String> _f$payeeNote = Field(
    'payeeNote',
    _$payeeNote,
    opt: true,
  );
  static CashTransferResultStatus? _$status(CashTransferResult v) => v.status;
  static const Field<CashTransferResult, CashTransferResultStatus> _f$status =
      Field('status', _$status, opt: true);
  static ErrorReason? _$reason(CashTransferResult v) => v.reason;
  static const Field<CashTransferResult, ErrorReason> _f$reason = Field(
    'reason',
    _$reason,
    opt: true,
  );

  @override
  final MappableFields<CashTransferResult> fields = const {
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

  static CashTransferResult _instantiate(DecodingData data) {
    return CashTransferResult(
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

  static CashTransferResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CashTransferResult>(map);
  }

  static CashTransferResult fromJson(String json) {
    return ensureInitialized().decodeJson<CashTransferResult>(json);
  }
}

mixin CashTransferResultMappable {
  String toJson() {
    return CashTransferResultMapper.ensureInitialized()
        .encodeJson<CashTransferResult>(this as CashTransferResult);
  }

  Map<String, dynamic> toMap() {
    return CashTransferResultMapper.ensureInitialized()
        .encodeMap<CashTransferResult>(this as CashTransferResult);
  }

  CashTransferResultCopyWith<
    CashTransferResult,
    CashTransferResult,
    CashTransferResult
  >
  get copyWith =>
      _CashTransferResultCopyWithImpl<CashTransferResult, CashTransferResult>(
        this as CashTransferResult,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CashTransferResultMapper.ensureInitialized().stringifyValue(
      this as CashTransferResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return CashTransferResultMapper.ensureInitialized().equalsValue(
      this as CashTransferResult,
      other,
    );
  }

  @override
  int get hashCode {
    return CashTransferResultMapper.ensureInitialized().hashValue(
      this as CashTransferResult,
    );
  }
}

extension CashTransferResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CashTransferResult, $Out> {
  CashTransferResultCopyWith<$R, CashTransferResult, $Out>
  get $asCashTransferResult => $base.as(
    (v, t, t2) => _CashTransferResultCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CashTransferResultCopyWith<
  $R,
  $In extends CashTransferResult,
  $Out
>
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
    CashTransferResultStatus? status,
    ErrorReason? reason,
  });
  CashTransferResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CashTransferResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CashTransferResult, $Out>
    implements CashTransferResultCopyWith<$R, CashTransferResult, $Out> {
  _CashTransferResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CashTransferResult> $mapper =
      CashTransferResultMapper.ensureInitialized();
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
  CashTransferResult $make(CopyWithData data) => CashTransferResult(
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
  CashTransferResultCopyWith<$R2, CashTransferResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CashTransferResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

