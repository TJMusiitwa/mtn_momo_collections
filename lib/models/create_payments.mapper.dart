// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_payments.dart';

class CreatePaymentsMapper extends ClassMapperBase<CreatePayments> {
  CreatePaymentsMapper._();

  static CreatePaymentsMapper? _instance;
  static CreatePaymentsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreatePaymentsMapper._());
      MoneyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CreatePayments';

  static String? _$externalTransactionId(CreatePayments v) =>
      v.externalTransactionId;
  static const Field<CreatePayments, String> _f$externalTransactionId = Field(
    'externalTransactionId',
    _$externalTransactionId,
    opt: true,
  );
  static Money? _$money(CreatePayments v) => v.money;
  static const Field<CreatePayments, Money> _f$money = Field(
    'money',
    _$money,
    opt: true,
  );
  static String? _$customerReference(CreatePayments v) => v.customerReference;
  static const Field<CreatePayments, String> _f$customerReference = Field(
    'customerReference',
    _$customerReference,
    opt: true,
  );
  static String? _$serviceProviderUserName(CreatePayments v) =>
      v.serviceProviderUserName;
  static const Field<CreatePayments, String> _f$serviceProviderUserName = Field(
    'serviceProviderUserName',
    _$serviceProviderUserName,
    opt: true,
  );
  static String? _$couponId(CreatePayments v) => v.couponId;
  static const Field<CreatePayments, String> _f$couponId = Field(
    'couponId',
    _$couponId,
    opt: true,
  );
  static String? _$productId(CreatePayments v) => v.productId;
  static const Field<CreatePayments, String> _f$productId = Field(
    'productId',
    _$productId,
    opt: true,
  );
  static String? _$productOfferingId(CreatePayments v) => v.productOfferingId;
  static const Field<CreatePayments, String> _f$productOfferingId = Field(
    'productOfferingId',
    _$productOfferingId,
    opt: true,
  );
  static String? _$receiverMessage(CreatePayments v) => v.receiverMessage;
  static const Field<CreatePayments, String> _f$receiverMessage = Field(
    'receiverMessage',
    _$receiverMessage,
    opt: true,
  );
  static String? _$senderNote(CreatePayments v) => v.senderNote;
  static const Field<CreatePayments, String> _f$senderNote = Field(
    'senderNote',
    _$senderNote,
    opt: true,
  );
  static int? _$maxNumberOfRetries(CreatePayments v) => v.maxNumberOfRetries;
  static const Field<CreatePayments, int> _f$maxNumberOfRetries = Field(
    'maxNumberOfRetries',
    _$maxNumberOfRetries,
    opt: true,
  );
  static bool? _$includeSenderCharges(CreatePayments v) =>
      v.includeSenderCharges;
  static const Field<CreatePayments, bool> _f$includeSenderCharges = Field(
    'includeSenderCharges',
    _$includeSenderCharges,
    opt: true,
  );

  @override
  final MappableFields<CreatePayments> fields = const {
    #externalTransactionId: _f$externalTransactionId,
    #money: _f$money,
    #customerReference: _f$customerReference,
    #serviceProviderUserName: _f$serviceProviderUserName,
    #couponId: _f$couponId,
    #productId: _f$productId,
    #productOfferingId: _f$productOfferingId,
    #receiverMessage: _f$receiverMessage,
    #senderNote: _f$senderNote,
    #maxNumberOfRetries: _f$maxNumberOfRetries,
    #includeSenderCharges: _f$includeSenderCharges,
  };

  static CreatePayments _instantiate(DecodingData data) {
    return CreatePayments(
      externalTransactionId: data.dec(_f$externalTransactionId),
      money: data.dec(_f$money),
      customerReference: data.dec(_f$customerReference),
      serviceProviderUserName: data.dec(_f$serviceProviderUserName),
      couponId: data.dec(_f$couponId),
      productId: data.dec(_f$productId),
      productOfferingId: data.dec(_f$productOfferingId),
      receiverMessage: data.dec(_f$receiverMessage),
      senderNote: data.dec(_f$senderNote),
      maxNumberOfRetries: data.dec(_f$maxNumberOfRetries),
      includeSenderCharges: data.dec(_f$includeSenderCharges),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CreatePayments fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreatePayments>(map);
  }

  static CreatePayments fromJson(String json) {
    return ensureInitialized().decodeJson<CreatePayments>(json);
  }
}

mixin CreatePaymentsMappable {
  String toJson() {
    return CreatePaymentsMapper.ensureInitialized().encodeJson<CreatePayments>(
      this as CreatePayments,
    );
  }

  Map<String, dynamic> toMap() {
    return CreatePaymentsMapper.ensureInitialized().encodeMap<CreatePayments>(
      this as CreatePayments,
    );
  }

  CreatePaymentsCopyWith<CreatePayments, CreatePayments, CreatePayments>
  get copyWith => _CreatePaymentsCopyWithImpl<CreatePayments, CreatePayments>(
    this as CreatePayments,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CreatePaymentsMapper.ensureInitialized().stringifyValue(
      this as CreatePayments,
    );
  }

  @override
  bool operator ==(Object other) {
    return CreatePaymentsMapper.ensureInitialized().equalsValue(
      this as CreatePayments,
      other,
    );
  }

  @override
  int get hashCode {
    return CreatePaymentsMapper.ensureInitialized().hashValue(
      this as CreatePayments,
    );
  }
}

extension CreatePaymentsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreatePayments, $Out> {
  CreatePaymentsCopyWith<$R, CreatePayments, $Out> get $asCreatePayments =>
      $base.as((v, t, t2) => _CreatePaymentsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CreatePaymentsCopyWith<$R, $In extends CreatePayments, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MoneyCopyWith<$R, Money, Money>? get money;
  $R call({
    String? externalTransactionId,
    Money? money,
    String? customerReference,
    String? serviceProviderUserName,
    String? couponId,
    String? productId,
    String? productOfferingId,
    String? receiverMessage,
    String? senderNote,
    int? maxNumberOfRetries,
    bool? includeSenderCharges,
  });
  CreatePaymentsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CreatePaymentsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreatePayments, $Out>
    implements CreatePaymentsCopyWith<$R, CreatePayments, $Out> {
  _CreatePaymentsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreatePayments> $mapper =
      CreatePaymentsMapper.ensureInitialized();
  @override
  MoneyCopyWith<$R, Money, Money>? get money =>
      $value.money?.copyWith.$chain((v) => call(money: v));
  @override
  $R call({
    Object? externalTransactionId = $none,
    Object? money = $none,
    Object? customerReference = $none,
    Object? serviceProviderUserName = $none,
    Object? couponId = $none,
    Object? productId = $none,
    Object? productOfferingId = $none,
    Object? receiverMessage = $none,
    Object? senderNote = $none,
    Object? maxNumberOfRetries = $none,
    Object? includeSenderCharges = $none,
  }) => $apply(
    FieldCopyWithData({
      if (externalTransactionId != $none)
        #externalTransactionId: externalTransactionId,
      if (money != $none) #money: money,
      if (customerReference != $none) #customerReference: customerReference,
      if (serviceProviderUserName != $none)
        #serviceProviderUserName: serviceProviderUserName,
      if (couponId != $none) #couponId: couponId,
      if (productId != $none) #productId: productId,
      if (productOfferingId != $none) #productOfferingId: productOfferingId,
      if (receiverMessage != $none) #receiverMessage: receiverMessage,
      if (senderNote != $none) #senderNote: senderNote,
      if (maxNumberOfRetries != $none) #maxNumberOfRetries: maxNumberOfRetries,
      if (includeSenderCharges != $none)
        #includeSenderCharges: includeSenderCharges,
    }),
  );
  @override
  CreatePayments $make(CopyWithData data) => CreatePayments(
    externalTransactionId: data.get(
      #externalTransactionId,
      or: $value.externalTransactionId,
    ),
    money: data.get(#money, or: $value.money),
    customerReference: data.get(
      #customerReference,
      or: $value.customerReference,
    ),
    serviceProviderUserName: data.get(
      #serviceProviderUserName,
      or: $value.serviceProviderUserName,
    ),
    couponId: data.get(#couponId, or: $value.couponId),
    productId: data.get(#productId, or: $value.productId),
    productOfferingId: data.get(
      #productOfferingId,
      or: $value.productOfferingId,
    ),
    receiverMessage: data.get(#receiverMessage, or: $value.receiverMessage),
    senderNote: data.get(#senderNote, or: $value.senderNote),
    maxNumberOfRetries: data.get(
      #maxNumberOfRetries,
      or: $value.maxNumberOfRetries,
    ),
    includeSenderCharges: data.get(
      #includeSenderCharges,
      or: $value.includeSenderCharges,
    ),
  );

  @override
  CreatePaymentsCopyWith<$R2, CreatePayments, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CreatePaymentsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

