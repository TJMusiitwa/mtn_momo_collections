// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cash_transfer.dart';

class CashTransferMapper extends ClassMapperBase<CashTransfer> {
  CashTransferMapper._();

  static CashTransferMapper? _instance;
  static CashTransferMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CashTransferMapper._());
      PartyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CashTransfer';

  static String? _$amount(CashTransfer v) => v.amount;
  static const Field<CashTransfer, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(CashTransfer v) => v.currency;
  static const Field<CashTransfer, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static Party? _$payee(CashTransfer v) => v.payee;
  static const Field<CashTransfer, Party> _f$payee = Field(
    'payee',
    _$payee,
    opt: true,
  );
  static String? _$externalId(CashTransfer v) => v.externalId;
  static const Field<CashTransfer, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static String? _$orginatingCountry(CashTransfer v) => v.orginatingCountry;
  static const Field<CashTransfer, String> _f$orginatingCountry = Field(
    'orginatingCountry',
    _$orginatingCountry,
    opt: true,
  );
  static String? _$originalAmount(CashTransfer v) => v.originalAmount;
  static const Field<CashTransfer, String> _f$originalAmount = Field(
    'originalAmount',
    _$originalAmount,
    opt: true,
  );
  static String? _$originalCurrency(CashTransfer v) => v.originalCurrency;
  static const Field<CashTransfer, String> _f$originalCurrency = Field(
    'originalCurrency',
    _$originalCurrency,
    opt: true,
  );
  static String? _$payerMessage(CashTransfer v) => v.payerMessage;
  static const Field<CashTransfer, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static String? _$payeeNote(CashTransfer v) => v.payeeNote;
  static const Field<CashTransfer, String> _f$payeeNote = Field(
    'payeeNote',
    _$payeeNote,
    opt: true,
  );
  static String? _$payerIdentificationType(CashTransfer v) =>
      v.payerIdentificationType;
  static const Field<CashTransfer, String> _f$payerIdentificationType = Field(
    'payerIdentificationType',
    _$payerIdentificationType,
    opt: true,
  );
  static String? _$payerIdentificationNumber(CashTransfer v) =>
      v.payerIdentificationNumber;
  static const Field<CashTransfer, String> _f$payerIdentificationNumber = Field(
    'payerIdentificationNumber',
    _$payerIdentificationNumber,
    opt: true,
  );
  static String? _$payerIdentity(CashTransfer v) => v.payerIdentity;
  static const Field<CashTransfer, String> _f$payerIdentity = Field(
    'payerIdentity',
    _$payerIdentity,
    opt: true,
  );
  static String? _$payerFirstName(CashTransfer v) => v.payerFirstName;
  static const Field<CashTransfer, String> _f$payerFirstName = Field(
    'payerFirstName',
    _$payerFirstName,
    opt: true,
  );
  static String? _$payerSurName(CashTransfer v) => v.payerSurName;
  static const Field<CashTransfer, String> _f$payerSurName = Field(
    'payerSurName',
    _$payerSurName,
    opt: true,
  );
  static String? _$payerLanguageCode(CashTransfer v) => v.payerLanguageCode;
  static const Field<CashTransfer, String> _f$payerLanguageCode = Field(
    'payerLanguageCode',
    _$payerLanguageCode,
    opt: true,
  );
  static String? _$payerEmail(CashTransfer v) => v.payerEmail;
  static const Field<CashTransfer, String> _f$payerEmail = Field(
    'payerEmail',
    _$payerEmail,
    opt: true,
  );
  static String? _$payerMsisdn(CashTransfer v) => v.payerMsisdn;
  static const Field<CashTransfer, String> _f$payerMsisdn = Field(
    'payerMsisdn',
    _$payerMsisdn,
    opt: true,
  );
  static String? _$payerGender(CashTransfer v) => v.payerGender;
  static const Field<CashTransfer, String> _f$payerGender = Field(
    'payerGender',
    _$payerGender,
    opt: true,
  );

  @override
  final MappableFields<CashTransfer> fields = const {
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

  static CashTransfer _instantiate(DecodingData data) {
    return CashTransfer(
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

  static CashTransfer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CashTransfer>(map);
  }

  static CashTransfer fromJson(String json) {
    return ensureInitialized().decodeJson<CashTransfer>(json);
  }
}

mixin CashTransferMappable {
  String toJson() {
    return CashTransferMapper.ensureInitialized().encodeJson<CashTransfer>(
      this as CashTransfer,
    );
  }

  Map<String, dynamic> toMap() {
    return CashTransferMapper.ensureInitialized().encodeMap<CashTransfer>(
      this as CashTransfer,
    );
  }

  CashTransferCopyWith<CashTransfer, CashTransfer, CashTransfer> get copyWith =>
      _CashTransferCopyWithImpl<CashTransfer, CashTransfer>(
        this as CashTransfer,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CashTransferMapper.ensureInitialized().stringifyValue(
      this as CashTransfer,
    );
  }

  @override
  bool operator ==(Object other) {
    return CashTransferMapper.ensureInitialized().equalsValue(
      this as CashTransfer,
      other,
    );
  }

  @override
  int get hashCode {
    return CashTransferMapper.ensureInitialized().hashValue(
      this as CashTransfer,
    );
  }
}

extension CashTransferValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CashTransfer, $Out> {
  CashTransferCopyWith<$R, CashTransfer, $Out> get $asCashTransfer =>
      $base.as((v, t, t2) => _CashTransferCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CashTransferCopyWith<$R, $In extends CashTransfer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PartyCopyWith<$R, Party, Party>? get payee;
  $R call({
    String? amount,
    String? currency,
    Party? payee,
    String? externalId,
    String? orginatingCountry,
    String? originalAmount,
    String? originalCurrency,
    String? payerMessage,
    String? payeeNote,
    String? payerIdentificationType,
    String? payerIdentificationNumber,
    String? payerIdentity,
    String? payerFirstName,
    String? payerSurName,
    String? payerLanguageCode,
    String? payerEmail,
    String? payerMsisdn,
    String? payerGender,
  });
  CashTransferCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CashTransferCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CashTransfer, $Out>
    implements CashTransferCopyWith<$R, CashTransfer, $Out> {
  _CashTransferCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CashTransfer> $mapper =
      CashTransferMapper.ensureInitialized();
  @override
  PartyCopyWith<$R, Party, Party>? get payee =>
      $value.payee?.copyWith.$chain((v) => call(payee: v));
  @override
  $R call({
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
  CashTransfer $make(CopyWithData data) => CashTransfer(
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
  CashTransferCopyWith<$R2, CashTransfer, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CashTransferCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

