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
      CashTransferResultPayerIdentificationTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CashTransferResult';

  static String? _$financialTransactionId(CashTransferResult v) =>
      v.financialTransactionId;
  static const Field<CashTransferResult, String> _f$financialTransactionId =
      Field('financialTransactionId', _$financialTransactionId, opt: true);
  static String? _$status(CashTransferResult v) => v.status;
  static const Field<CashTransferResult, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$reason(CashTransferResult v) => v.reason;
  static const Field<CashTransferResult, String> _f$reason = Field(
    'reason',
    _$reason,
    opt: true,
  );
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
  static Party? _$payee(CashTransferResult v) => v.payee;
  static const Field<CashTransferResult, Party> _f$payee = Field(
    'payee',
    _$payee,
    opt: true,
  );
  static String? _$externalId(CashTransferResult v) => v.externalId;
  static const Field<CashTransferResult, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static String? _$orginatingCountry(CashTransferResult v) =>
      v.orginatingCountry;
  static const Field<CashTransferResult, String> _f$orginatingCountry = Field(
    'orginatingCountry',
    _$orginatingCountry,
    opt: true,
  );
  static String? _$originalAmount(CashTransferResult v) => v.originalAmount;
  static const Field<CashTransferResult, String> _f$originalAmount = Field(
    'originalAmount',
    _$originalAmount,
    opt: true,
  );
  static String? _$originalCurrency(CashTransferResult v) => v.originalCurrency;
  static const Field<CashTransferResult, String> _f$originalCurrency = Field(
    'originalCurrency',
    _$originalCurrency,
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
  static CashTransferResultPayerIdentificationType? _$payerIdentificationType(
    CashTransferResult v,
  ) => v.payerIdentificationType;
  static const Field<
    CashTransferResult,
    CashTransferResultPayerIdentificationType
  >
  _f$payerIdentificationType = Field(
    'payerIdentificationType',
    _$payerIdentificationType,
    opt: true,
  );
  static String? _$payerIdentificationNumber(CashTransferResult v) =>
      v.payerIdentificationNumber;
  static const Field<CashTransferResult, String> _f$payerIdentificationNumber =
      Field(
        'payerIdentificationNumber',
        _$payerIdentificationNumber,
        opt: true,
      );
  static String? _$payerIdentity(CashTransferResult v) => v.payerIdentity;
  static const Field<CashTransferResult, String> _f$payerIdentity = Field(
    'payerIdentity',
    _$payerIdentity,
    opt: true,
  );
  static String? _$payerFirstName(CashTransferResult v) => v.payerFirstName;
  static const Field<CashTransferResult, String> _f$payerFirstName = Field(
    'payerFirstName',
    _$payerFirstName,
    opt: true,
  );
  static String? _$payerSurName(CashTransferResult v) => v.payerSurName;
  static const Field<CashTransferResult, String> _f$payerSurName = Field(
    'payerSurName',
    _$payerSurName,
    opt: true,
  );
  static String? _$payerLanguageCode(CashTransferResult v) =>
      v.payerLanguageCode;
  static const Field<CashTransferResult, String> _f$payerLanguageCode = Field(
    'payerLanguageCode',
    _$payerLanguageCode,
    opt: true,
  );
  static String? _$payerEmail(CashTransferResult v) => v.payerEmail;
  static const Field<CashTransferResult, String> _f$payerEmail = Field(
    'payerEmail',
    _$payerEmail,
    opt: true,
  );
  static String? _$payerMsisdn(CashTransferResult v) => v.payerMsisdn;
  static const Field<CashTransferResult, String> _f$payerMsisdn = Field(
    'payerMsisdn',
    _$payerMsisdn,
    opt: true,
  );
  static String? _$payerGender(CashTransferResult v) => v.payerGender;
  static const Field<CashTransferResult, String> _f$payerGender = Field(
    'payerGender',
    _$payerGender,
    opt: true,
  );

  @override
  final MappableFields<CashTransferResult> fields = const {
    #financialTransactionId: _f$financialTransactionId,
    #status: _f$status,
    #reason: _f$reason,
    #amount: _f$amount,
    #currency: _f$currency,
    #payee: _f$payee,
    #externalId: _f$externalId,
    #orginatingCountry: _f$orginatingCountry,
    #originalAmount: _f$originalAmount,
    #originalCurrency: _f$originalCurrency,
    #payerMessage: _f$payerMessage,
    #payeeNote: _f$payeeNote,
    #payerIdentificationType: _f$payerIdentificationType,
    #payerIdentificationNumber: _f$payerIdentificationNumber,
    #payerIdentity: _f$payerIdentity,
    #payerFirstName: _f$payerFirstName,
    #payerSurName: _f$payerSurName,
    #payerLanguageCode: _f$payerLanguageCode,
    #payerEmail: _f$payerEmail,
    #payerMsisdn: _f$payerMsisdn,
    #payerGender: _f$payerGender,
  };

  static CashTransferResult _instantiate(DecodingData data) {
    return CashTransferResult(
      financialTransactionId: data.dec(_f$financialTransactionId),
      status: data.dec(_f$status),
      reason: data.dec(_f$reason),
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      payee: data.dec(_f$payee),
      externalId: data.dec(_f$externalId),
      orginatingCountry: data.dec(_f$orginatingCountry),
      originalAmount: data.dec(_f$originalAmount),
      originalCurrency: data.dec(_f$originalCurrency),
      payerMessage: data.dec(_f$payerMessage),
      payeeNote: data.dec(_f$payeeNote),
      payerIdentificationType: data.dec(_f$payerIdentificationType),
      payerIdentificationNumber: data.dec(_f$payerIdentificationNumber),
      payerIdentity: data.dec(_f$payerIdentity),
      payerFirstName: data.dec(_f$payerFirstName),
      payerSurName: data.dec(_f$payerSurName),
      payerLanguageCode: data.dec(_f$payerLanguageCode),
      payerEmail: data.dec(_f$payerEmail),
      payerMsisdn: data.dec(_f$payerMsisdn),
      payerGender: data.dec(_f$payerGender),
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
  $R call({
    String? financialTransactionId,
    String? status,
    String? reason,
    String? amount,
    String? currency,
    Party? payee,
    String? externalId,
    String? orginatingCountry,
    String? originalAmount,
    String? originalCurrency,
    String? payerMessage,
    String? payeeNote,
    CashTransferResultPayerIdentificationType? payerIdentificationType,
    String? payerIdentificationNumber,
    String? payerIdentity,
    String? payerFirstName,
    String? payerSurName,
    String? payerLanguageCode,
    String? payerEmail,
    String? payerMsisdn,
    String? payerGender,
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
  $R call({
    Object? financialTransactionId = $none,
    Object? status = $none,
    Object? reason = $none,
    Object? amount = $none,
    Object? currency = $none,
    Object? payee = $none,
    Object? externalId = $none,
    Object? orginatingCountry = $none,
    Object? originalAmount = $none,
    Object? originalCurrency = $none,
    Object? payerMessage = $none,
    Object? payeeNote = $none,
    Object? payerIdentificationType = $none,
    Object? payerIdentificationNumber = $none,
    Object? payerIdentity = $none,
    Object? payerFirstName = $none,
    Object? payerSurName = $none,
    Object? payerLanguageCode = $none,
    Object? payerEmail = $none,
    Object? payerMsisdn = $none,
    Object? payerGender = $none,
  }) => $apply(
    FieldCopyWithData({
      if (financialTransactionId != $none)
        #financialTransactionId: financialTransactionId,
      if (status != $none) #status: status,
      if (reason != $none) #reason: reason,
      if (amount != $none) #amount: amount,
      if (currency != $none) #currency: currency,
      if (payee != $none) #payee: payee,
      if (externalId != $none) #externalId: externalId,
      if (orginatingCountry != $none) #orginatingCountry: orginatingCountry,
      if (originalAmount != $none) #originalAmount: originalAmount,
      if (originalCurrency != $none) #originalCurrency: originalCurrency,
      if (payerMessage != $none) #payerMessage: payerMessage,
      if (payeeNote != $none) #payeeNote: payeeNote,
      if (payerIdentificationType != $none)
        #payerIdentificationType: payerIdentificationType,
      if (payerIdentificationNumber != $none)
        #payerIdentificationNumber: payerIdentificationNumber,
      if (payerIdentity != $none) #payerIdentity: payerIdentity,
      if (payerFirstName != $none) #payerFirstName: payerFirstName,
      if (payerSurName != $none) #payerSurName: payerSurName,
      if (payerLanguageCode != $none) #payerLanguageCode: payerLanguageCode,
      if (payerEmail != $none) #payerEmail: payerEmail,
      if (payerMsisdn != $none) #payerMsisdn: payerMsisdn,
      if (payerGender != $none) #payerGender: payerGender,
    }),
  );
  @override
  CashTransferResult $make(CopyWithData data) => CashTransferResult(
    financialTransactionId: data.get(
      #financialTransactionId,
      or: $value.financialTransactionId,
    ),
    status: data.get(#status, or: $value.status),
    reason: data.get(#reason, or: $value.reason),
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    payee: data.get(#payee, or: $value.payee),
    externalId: data.get(#externalId, or: $value.externalId),
    orginatingCountry: data.get(
      #orginatingCountry,
      or: $value.orginatingCountry,
    ),
    originalAmount: data.get(#originalAmount, or: $value.originalAmount),
    originalCurrency: data.get(#originalCurrency, or: $value.originalCurrency),
    payerMessage: data.get(#payerMessage, or: $value.payerMessage),
    payeeNote: data.get(#payeeNote, or: $value.payeeNote),
    payerIdentificationType: data.get(
      #payerIdentificationType,
      or: $value.payerIdentificationType,
    ),
    payerIdentificationNumber: data.get(
      #payerIdentificationNumber,
      or: $value.payerIdentificationNumber,
    ),
    payerIdentity: data.get(#payerIdentity, or: $value.payerIdentity),
    payerFirstName: data.get(#payerFirstName, or: $value.payerFirstName),
    payerSurName: data.get(#payerSurName, or: $value.payerSurName),
    payerLanguageCode: data.get(
      #payerLanguageCode,
      or: $value.payerLanguageCode,
    ),
    payerEmail: data.get(#payerEmail, or: $value.payerEmail),
    payerMsisdn: data.get(#payerMsisdn, or: $value.payerMsisdn),
    payerGender: data.get(#payerGender, or: $value.payerGender),
  );

  @override
  CashTransferResultCopyWith<$R2, CashTransferResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CashTransferResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

