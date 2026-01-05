// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'payment_result.dart';

class PaymentResultMapper extends ClassMapperBase<PaymentResult> {
  PaymentResultMapper._();

  static PaymentResultMapper? _instance;
  static PaymentResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaymentResultMapper._());
      PaymentResultStatusMapper.ensureInitialized();
      ErrorReasonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PaymentResult';

  static String? _$referenceId(PaymentResult v) => v.referenceId;
  static const Field<PaymentResult, String> _f$referenceId = Field(
    'referenceId',
    _$referenceId,
    opt: true,
  );
  static PaymentResultStatus? _$status(PaymentResult v) => v.status;
  static const Field<PaymentResult, PaymentResultStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$financialTransactionId(PaymentResult v) =>
      v.financialTransactionId;
  static const Field<PaymentResult, String> _f$financialTransactionId = Field(
    'financialTransactionId',
    _$financialTransactionId,
    opt: true,
  );
  static ErrorReason? _$reason(PaymentResult v) => v.reason;
  static const Field<PaymentResult, ErrorReason> _f$reason = Field(
    'reason',
    _$reason,
    opt: true,
  );

  @override
  final MappableFields<PaymentResult> fields = const {
    #referenceId: _f$referenceId,
    #status: _f$status,
    #financialTransactionId: _f$financialTransactionId,
    #reason: _f$reason,
  };

  static PaymentResult _instantiate(DecodingData data) {
    return PaymentResult(
      referenceId: data.dec(_f$referenceId),
      status: data.dec(_f$status),
      financialTransactionId: data.dec(_f$financialTransactionId),
      reason: data.dec(_f$reason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PaymentResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaymentResult>(map);
  }

  static PaymentResult fromJson(String json) {
    return ensureInitialized().decodeJson<PaymentResult>(json);
  }
}

mixin PaymentResultMappable {
  String toJson() {
    return PaymentResultMapper.ensureInitialized().encodeJson<PaymentResult>(
      this as PaymentResult,
    );
  }

  Map<String, dynamic> toMap() {
    return PaymentResultMapper.ensureInitialized().encodeMap<PaymentResult>(
      this as PaymentResult,
    );
  }

  PaymentResultCopyWith<PaymentResult, PaymentResult, PaymentResult>
  get copyWith => _PaymentResultCopyWithImpl<PaymentResult, PaymentResult>(
    this as PaymentResult,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return PaymentResultMapper.ensureInitialized().stringifyValue(
      this as PaymentResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return PaymentResultMapper.ensureInitialized().equalsValue(
      this as PaymentResult,
      other,
    );
  }

  @override
  int get hashCode {
    return PaymentResultMapper.ensureInitialized().hashValue(
      this as PaymentResult,
    );
  }
}

extension PaymentResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaymentResult, $Out> {
  PaymentResultCopyWith<$R, PaymentResult, $Out> get $asPaymentResult =>
      $base.as((v, t, t2) => _PaymentResultCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaymentResultCopyWith<$R, $In extends PaymentResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get reason;
  $R call({
    String? referenceId,
    PaymentResultStatus? status,
    String? financialTransactionId,
    ErrorReason? reason,
  });
  PaymentResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PaymentResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaymentResult, $Out>
    implements PaymentResultCopyWith<$R, PaymentResult, $Out> {
  _PaymentResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaymentResult> $mapper =
      PaymentResultMapper.ensureInitialized();
  @override
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get reason =>
      $value.reason?.copyWith.$chain((v) => call(reason: v));
  @override
  $R call({
    Object? referenceId = $none,
    Object? status = $none,
    Object? financialTransactionId = $none,
    Object? reason = $none,
  }) => $apply(
    FieldCopyWithData({
      if (referenceId != $none) #referenceId: referenceId,
      if (status != $none) #status: status,
      if (financialTransactionId != $none)
        #financialTransactionId: financialTransactionId,
      if (reason != $none) #reason: reason,
    }),
  );
  @override
  PaymentResult $make(CopyWithData data) => PaymentResult(
    referenceId: data.get(#referenceId, or: $value.referenceId),
    status: data.get(#status, or: $value.status),
    financialTransactionId: data.get(
      #financialTransactionId,
      or: $value.financialTransactionId,
    ),
    reason: data.get(#reason, or: $value.reason),
  );

  @override
  PaymentResultCopyWith<$R2, PaymentResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PaymentResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

