// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'invoice_result.dart';

class InvoiceResultMapper extends ClassMapperBase<InvoiceResult> {
  InvoiceResultMapper._();

  static InvoiceResultMapper? _instance;
  static InvoiceResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InvoiceResultMapper._());
      InvoiceResultStatusMapper.ensureInitialized();
      ErrorReasonMapper.ensureInitialized();
      PartyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InvoiceResult';

  static String? _$referenceId(InvoiceResult v) => v.referenceId;
  static const Field<InvoiceResult, String> _f$referenceId = Field(
    'referenceId',
    _$referenceId,
    opt: true,
  );
  static String? _$externalId(InvoiceResult v) => v.externalId;
  static const Field<InvoiceResult, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static String? _$amount(InvoiceResult v) => v.amount;
  static const Field<InvoiceResult, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(InvoiceResult v) => v.currency;
  static const Field<InvoiceResult, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static InvoiceResultStatus? _$status(InvoiceResult v) => v.status;
  static const Field<InvoiceResult, InvoiceResultStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$paymentReference(InvoiceResult v) => v.paymentReference;
  static const Field<InvoiceResult, String> _f$paymentReference = Field(
    'paymentReference',
    _$paymentReference,
    opt: true,
  );
  static String? _$invoiceId(InvoiceResult v) => v.invoiceId;
  static const Field<InvoiceResult, String> _f$invoiceId = Field(
    'invoiceId',
    _$invoiceId,
    opt: true,
  );
  static String? _$expiryDateTime(InvoiceResult v) => v.expiryDateTime;
  static const Field<InvoiceResult, String> _f$expiryDateTime = Field(
    'expiryDateTime',
    _$expiryDateTime,
    opt: true,
  );
  static String? _$payeeFirstName(InvoiceResult v) => v.payeeFirstName;
  static const Field<InvoiceResult, String> _f$payeeFirstName = Field(
    'payeeFirstName',
    _$payeeFirstName,
    opt: true,
  );
  static String? _$payeeLastName(InvoiceResult v) => v.payeeLastName;
  static const Field<InvoiceResult, String> _f$payeeLastName = Field(
    'payeeLastName',
    _$payeeLastName,
    opt: true,
  );
  static ErrorReason? _$errorReason(InvoiceResult v) => v.errorReason;
  static const Field<InvoiceResult, ErrorReason> _f$errorReason = Field(
    'errorReason',
    _$errorReason,
    opt: true,
  );
  static Party? _$intendedPayer(InvoiceResult v) => v.intendedPayer;
  static const Field<InvoiceResult, Party> _f$intendedPayer = Field(
    'intendedPayer',
    _$intendedPayer,
    opt: true,
  );
  static String? _$description(InvoiceResult v) => v.description;
  static const Field<InvoiceResult, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );

  @override
  final MappableFields<InvoiceResult> fields = const {
    #referenceId: _f$referenceId,
    #externalId: _f$externalId,
    #amount: _f$amount,
    #currency: _f$currency,
    #status: _f$status,
    #paymentReference: _f$paymentReference,
    #invoiceId: _f$invoiceId,
    #expiryDateTime: _f$expiryDateTime,
    #payeeFirstName: _f$payeeFirstName,
    #payeeLastName: _f$payeeLastName,
    #errorReason: _f$errorReason,
    #intendedPayer: _f$intendedPayer,
    #description: _f$description,
  };

  static InvoiceResult _instantiate(DecodingData data) {
    return InvoiceResult(
      referenceId: data.dec(_f$referenceId),
      externalId: data.dec(_f$externalId),
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      status: data.dec(_f$status),
      paymentReference: data.dec(_f$paymentReference),
      invoiceId: data.dec(_f$invoiceId),
      expiryDateTime: data.dec(_f$expiryDateTime),
      payeeFirstName: data.dec(_f$payeeFirstName),
      payeeLastName: data.dec(_f$payeeLastName),
      errorReason: data.dec(_f$errorReason),
      intendedPayer: data.dec(_f$intendedPayer),
      description: data.dec(_f$description),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static InvoiceResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InvoiceResult>(map);
  }

  static InvoiceResult fromJson(String json) {
    return ensureInitialized().decodeJson<InvoiceResult>(json);
  }
}

mixin InvoiceResultMappable {
  String toJson() {
    return InvoiceResultMapper.ensureInitialized().encodeJson<InvoiceResult>(
      this as InvoiceResult,
    );
  }

  Map<String, dynamic> toMap() {
    return InvoiceResultMapper.ensureInitialized().encodeMap<InvoiceResult>(
      this as InvoiceResult,
    );
  }

  InvoiceResultCopyWith<InvoiceResult, InvoiceResult, InvoiceResult>
  get copyWith => _InvoiceResultCopyWithImpl<InvoiceResult, InvoiceResult>(
    this as InvoiceResult,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return InvoiceResultMapper.ensureInitialized().stringifyValue(
      this as InvoiceResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return InvoiceResultMapper.ensureInitialized().equalsValue(
      this as InvoiceResult,
      other,
    );
  }

  @override
  int get hashCode {
    return InvoiceResultMapper.ensureInitialized().hashValue(
      this as InvoiceResult,
    );
  }
}

extension InvoiceResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InvoiceResult, $Out> {
  InvoiceResultCopyWith<$R, InvoiceResult, $Out> get $asInvoiceResult =>
      $base.as((v, t, t2) => _InvoiceResultCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class InvoiceResultCopyWith<$R, $In extends InvoiceResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get errorReason;
  PartyCopyWith<$R, Party, Party>? get intendedPayer;
  $R call({
    String? referenceId,
    String? externalId,
    String? amount,
    String? currency,
    InvoiceResultStatus? status,
    String? paymentReference,
    String? invoiceId,
    String? expiryDateTime,
    String? payeeFirstName,
    String? payeeLastName,
    ErrorReason? errorReason,
    Party? intendedPayer,
    String? description,
  });
  InvoiceResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _InvoiceResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InvoiceResult, $Out>
    implements InvoiceResultCopyWith<$R, InvoiceResult, $Out> {
  _InvoiceResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InvoiceResult> $mapper =
      InvoiceResultMapper.ensureInitialized();
  @override
  ErrorReasonCopyWith<$R, ErrorReason, ErrorReason>? get errorReason =>
      $value.errorReason?.copyWith.$chain((v) => call(errorReason: v));
  @override
  PartyCopyWith<$R, Party, Party>? get intendedPayer =>
      $value.intendedPayer?.copyWith.$chain((v) => call(intendedPayer: v));
  @override
  $R call({
    Object? referenceId = $none,
    Object? externalId = $none,
    Object? amount = $none,
    Object? currency = $none,
    Object? status = $none,
    Object? paymentReference = $none,
    Object? invoiceId = $none,
    Object? expiryDateTime = $none,
    Object? payeeFirstName = $none,
    Object? payeeLastName = $none,
    Object? errorReason = $none,
    Object? intendedPayer = $none,
    Object? description = $none,
  }) => $apply(
    FieldCopyWithData({
      if (referenceId != $none) #referenceId: referenceId,
      if (externalId != $none) #externalId: externalId,
      if (amount != $none) #amount: amount,
      if (currency != $none) #currency: currency,
      if (status != $none) #status: status,
      if (paymentReference != $none) #paymentReference: paymentReference,
      if (invoiceId != $none) #invoiceId: invoiceId,
      if (expiryDateTime != $none) #expiryDateTime: expiryDateTime,
      if (payeeFirstName != $none) #payeeFirstName: payeeFirstName,
      if (payeeLastName != $none) #payeeLastName: payeeLastName,
      if (errorReason != $none) #errorReason: errorReason,
      if (intendedPayer != $none) #intendedPayer: intendedPayer,
      if (description != $none) #description: description,
    }),
  );
  @override
  InvoiceResult $make(CopyWithData data) => InvoiceResult(
    referenceId: data.get(#referenceId, or: $value.referenceId),
    externalId: data.get(#externalId, or: $value.externalId),
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    status: data.get(#status, or: $value.status),
    paymentReference: data.get(#paymentReference, or: $value.paymentReference),
    invoiceId: data.get(#invoiceId, or: $value.invoiceId),
    expiryDateTime: data.get(#expiryDateTime, or: $value.expiryDateTime),
    payeeFirstName: data.get(#payeeFirstName, or: $value.payeeFirstName),
    payeeLastName: data.get(#payeeLastName, or: $value.payeeLastName),
    errorReason: data.get(#errorReason, or: $value.errorReason),
    intendedPayer: data.get(#intendedPayer, or: $value.intendedPayer),
    description: data.get(#description, or: $value.description),
  );

  @override
  InvoiceResultCopyWith<$R2, InvoiceResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _InvoiceResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

