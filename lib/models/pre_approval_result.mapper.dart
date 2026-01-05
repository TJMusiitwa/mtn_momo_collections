// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pre_approval_result.dart';

class PreApprovalResultMapper extends ClassMapperBase<PreApprovalResult> {
  PreApprovalResultMapper._();

  static PreApprovalResultMapper? _instance;
  static PreApprovalResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PreApprovalResultMapper._());
      PartyMapper.ensureInitialized();
      PreApprovalResultStatusMapper.ensureInitialized();
      ErrorReasonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PreApprovalResult';

  static Party? _$payer(PreApprovalResult v) => v.payer;
  static const Field<PreApprovalResult, Party> _f$payer = Field(
    'payer',
    _$payer,
    opt: true,
  );
  static String? _$payerCurrency(PreApprovalResult v) => v.payerCurrency;
  static const Field<PreApprovalResult, String> _f$payerCurrency = Field(
    'payerCurrency',
    _$payerCurrency,
    opt: true,
  );
  static String? _$payerMessage(PreApprovalResult v) => v.payerMessage;
  static const Field<PreApprovalResult, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static PreApprovalResultStatus? _$status(PreApprovalResult v) => v.status;
  static const Field<PreApprovalResult, PreApprovalResultStatus> _f$status =
      Field('status', _$status, opt: true);
  static int? _$expirationDateTime(PreApprovalResult v) => v.expirationDateTime;
  static const Field<PreApprovalResult, int> _f$expirationDateTime = Field(
    'expirationDateTime',
    _$expirationDateTime,
    opt: true,
  );
  static ErrorReason? _$reason(PreApprovalResult v) => v.reason;
  static const Field<PreApprovalResult, ErrorReason> _f$reason = Field(
    'reason',
    _$reason,
    opt: true,
  );

  @override
  final MappableFields<PreApprovalResult> fields = const {
    #payer: _f$payer,
    #payerCurrency: _f$payerCurrency,
    #payerMessage: _f$payerMessage,
    #status: _f$status,
    #expirationDateTime: _f$expirationDateTime,
    #reason: _f$reason,
  };

  static PreApprovalResult _instantiate(DecodingData data) {
    return PreApprovalResult(
      payer: data.dec(_f$payer),
      payerCurrency: data.dec(_f$payerCurrency),
      payerMessage: data.dec(_f$payerMessage),
      status: data.dec(_f$status),
      expirationDateTime: data.dec(_f$expirationDateTime),
      reason: data.dec(_f$reason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PreApprovalResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PreApprovalResult>(map);
  }

  static PreApprovalResult fromJson(String json) {
    return ensureInitialized().decodeJson<PreApprovalResult>(json);
  }
}

mixin PreApprovalResultMappable {
  String toJson() {
    return PreApprovalResultMapper.ensureInitialized()
        .encodeJson<PreApprovalResult>(this as PreApprovalResult);
  }

  Map<String, dynamic> toMap() {
    return PreApprovalResultMapper.ensureInitialized()
        .encodeMap<PreApprovalResult>(this as PreApprovalResult);
  }

  PreApprovalResultCopyWith<
    PreApprovalResult,
    PreApprovalResult,
    PreApprovalResult
  >
  get copyWith =>
      _PreApprovalResultCopyWithImpl<PreApprovalResult, PreApprovalResult>(
        this as PreApprovalResult,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PreApprovalResultMapper.ensureInitialized().stringifyValue(
      this as PreApprovalResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return PreApprovalResultMapper.ensureInitialized().equalsValue(
      this as PreApprovalResult,
      other,
    );
  }

  @override
  int get hashCode {
    return PreApprovalResultMapper.ensureInitialized().hashValue(
      this as PreApprovalResult,
    );
  }
}

extension PreApprovalResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PreApprovalResult, $Out> {
  PreApprovalResultCopyWith<$R, PreApprovalResult, $Out>
  get $asPreApprovalResult => $base.as(
    (v, t, t2) => _PreApprovalResultCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PreApprovalResultCopyWith<
  $R,
  $In extends PreApprovalResult,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  PartyCopyWith<$R, Party, Party>? get payer;
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get reason;
  $R call({
    Party? payer,
    String? payerCurrency,
    String? payerMessage,
    PreApprovalResultStatus? status,
    int? expirationDateTime,
    ErrorReason? reason,
  });
  PreApprovalResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PreApprovalResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PreApprovalResult, $Out>
    implements PreApprovalResultCopyWith<$R, PreApprovalResult, $Out> {
  _PreApprovalResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PreApprovalResult> $mapper =
      PreApprovalResultMapper.ensureInitialized();
  @override
  PartyCopyWith<$R, Party, Party>? get payer =>
      $value.payer?.copyWith.$chain((v) => call(payer: v));
  @override
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get reason =>
      $value.reason?.copyWith.$chain((v) => call(reason: v));
  @override
  $R call({
    Object? payer = $none,
    Object? payerCurrency = $none,
    Object? payerMessage = $none,
    Object? status = $none,
    Object? expirationDateTime = $none,
    Object? reason = $none,
  }) => $apply(
    FieldCopyWithData({
      if (payer != $none) #payer: payer,
      if (payerCurrency != $none) #payerCurrency: payerCurrency,
      if (payerMessage != $none) #payerMessage: payerMessage,
      if (status != $none) #status: status,
      if (expirationDateTime != $none) #expirationDateTime: expirationDateTime,
      if (reason != $none) #reason: reason,
    }),
  );
  @override
  PreApprovalResult $make(CopyWithData data) => PreApprovalResult(
    payer: data.get(#payer, or: $value.payer),
    payerCurrency: data.get(#payerCurrency, or: $value.payerCurrency),
    payerMessage: data.get(#payerMessage, or: $value.payerMessage),
    status: data.get(#status, or: $value.status),
    expirationDateTime: data.get(
      #expirationDateTime,
      or: $value.expirationDateTime,
    ),
    reason: data.get(#reason, or: $value.reason),
  );

  @override
  PreApprovalResultCopyWith<$R2, PreApprovalResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PreApprovalResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

