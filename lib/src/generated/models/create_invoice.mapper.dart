// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_invoice.dart';

class CreateInvoiceMapper extends ClassMapperBase<CreateInvoice> {
  CreateInvoiceMapper._();

  static CreateInvoiceMapper? _instance;
  static CreateInvoiceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateInvoiceMapper._());
      PartyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CreateInvoice';

  static String? _$externalId(CreateInvoice v) => v.externalId;
  static const Field<CreateInvoice, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static String? _$amount(CreateInvoice v) => v.amount;
  static const Field<CreateInvoice, String> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
  );
  static String? _$currency(CreateInvoice v) => v.currency;
  static const Field<CreateInvoice, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$validityDuration(CreateInvoice v) => v.validityDuration;
  static const Field<CreateInvoice, String> _f$validityDuration = Field(
    'validityDuration',
    _$validityDuration,
    opt: true,
  );
  static Party? _$intendedPayer(CreateInvoice v) => v.intendedPayer;
  static const Field<CreateInvoice, Party> _f$intendedPayer = Field(
    'intendedPayer',
    _$intendedPayer,
    opt: true,
  );
  static Party? _$payee(CreateInvoice v) => v.payee;
  static const Field<CreateInvoice, Party> _f$payee = Field(
    'payee',
    _$payee,
    opt: true,
  );
  static String? _$description(CreateInvoice v) => v.description;
  static const Field<CreateInvoice, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );

  @override
  final MappableFields<CreateInvoice> fields = const {
    #externalId: _f$externalId,
    #amount: _f$amount,
    #currency: _f$currency,
    #validityDuration: _f$validityDuration,
    #intendedPayer: _f$intendedPayer,
    #payee: _f$payee,
    #description: _f$description,
  };

  static CreateInvoice _instantiate(DecodingData data) {
    return CreateInvoice(
      externalId: data.dec(_f$externalId),
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      validityDuration: data.dec(_f$validityDuration),
      intendedPayer: data.dec(_f$intendedPayer),
      payee: data.dec(_f$payee),
      description: data.dec(_f$description),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CreateInvoice fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateInvoice>(map);
  }

  static CreateInvoice fromJson(String json) {
    return ensureInitialized().decodeJson<CreateInvoice>(json);
  }
}

mixin CreateInvoiceMappable {
  String toJson() {
    return CreateInvoiceMapper.ensureInitialized().encodeJson<CreateInvoice>(
      this as CreateInvoice,
    );
  }

  Map<String, dynamic> toMap() {
    return CreateInvoiceMapper.ensureInitialized().encodeMap<CreateInvoice>(
      this as CreateInvoice,
    );
  }

  CreateInvoiceCopyWith<CreateInvoice, CreateInvoice, CreateInvoice>
  get copyWith => _CreateInvoiceCopyWithImpl<CreateInvoice, CreateInvoice>(
    this as CreateInvoice,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CreateInvoiceMapper.ensureInitialized().stringifyValue(
      this as CreateInvoice,
    );
  }

  @override
  bool operator ==(Object other) {
    return CreateInvoiceMapper.ensureInitialized().equalsValue(
      this as CreateInvoice,
      other,
    );
  }

  @override
  int get hashCode {
    return CreateInvoiceMapper.ensureInitialized().hashValue(
      this as CreateInvoice,
    );
  }
}

extension CreateInvoiceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateInvoice, $Out> {
  CreateInvoiceCopyWith<$R, CreateInvoice, $Out> get $asCreateInvoice =>
      $base.as((v, t, t2) => _CreateInvoiceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CreateInvoiceCopyWith<$R, $In extends CreateInvoice, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PartyCopyWith<$R, Party, Party>? get intendedPayer;
  PartyCopyWith<$R, Party, Party>? get payee;
  $R call({
    String? externalId,
    String? amount,
    String? currency,
    String? validityDuration,
    Party? intendedPayer,
    Party? payee,
    String? description,
  });
  CreateInvoiceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CreateInvoiceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateInvoice, $Out>
    implements CreateInvoiceCopyWith<$R, CreateInvoice, $Out> {
  _CreateInvoiceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateInvoice> $mapper =
      CreateInvoiceMapper.ensureInitialized();
  @override
  PartyCopyWith<$R, Party, Party>? get intendedPayer =>
      $value.intendedPayer?.copyWith.$chain((v) => call(intendedPayer: v));
  @override
  PartyCopyWith<$R, Party, Party>? get payee =>
      $value.payee?.copyWith.$chain((v) => call(payee: v));
  @override
  $R call({
    Object? externalId = $none,
    Object? amount = $none,
    Object? currency = $none,
    Object? validityDuration = $none,
    Object? intendedPayer = $none,
    Object? payee = $none,
    Object? description = $none,
  }) => $apply(
    FieldCopyWithData({
      if (externalId != $none) #externalId: externalId,
      if (amount != $none) #amount: amount,
      if (currency != $none) #currency: currency,
      if (validityDuration != $none) #validityDuration: validityDuration,
      if (intendedPayer != $none) #intendedPayer: intendedPayer,
      if (payee != $none) #payee: payee,
      if (description != $none) #description: description,
    }),
  );
  @override
  CreateInvoice $make(CopyWithData data) => CreateInvoice(
    externalId: data.get(#externalId, or: $value.externalId),
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    validityDuration: data.get(#validityDuration, or: $value.validityDuration),
    intendedPayer: data.get(#intendedPayer, or: $value.intendedPayer),
    payee: data.get(#payee, or: $value.payee),
    description: data.get(#description, or: $value.description),
  );

  @override
  CreateInvoiceCopyWith<$R2, CreateInvoice, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CreateInvoiceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

