// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pre_approval_details.dart';

class PreApprovalDetailsMapper extends ClassMapperBase<PreApprovalDetails> {
  PreApprovalDetailsMapper._();

  static PreApprovalDetailsMapper? _instance;
  static PreApprovalDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PreApprovalDetailsMapper._());
      PreApprovalDetailsStatusMapper.ensureInitialized();
      PreApprovalDetailsFrequencyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PreApprovalDetails';

  static String _$preApprovalId(PreApprovalDetails v) => v.preApprovalId;
  static const Field<PreApprovalDetails, String> _f$preApprovalId = Field(
    'preApprovalId',
    _$preApprovalId,
  );
  static String _$toFri(PreApprovalDetails v) => v.toFri;
  static const Field<PreApprovalDetails, String> _f$toFri = Field(
    'toFri',
    _$toFri,
  );
  static String _$fromFri(PreApprovalDetails v) => v.fromFri;
  static const Field<PreApprovalDetails, String> _f$fromFri = Field(
    'fromFri',
    _$fromFri,
  );
  static String _$fromCurrency(PreApprovalDetails v) => v.fromCurrency;
  static const Field<PreApprovalDetails, String> _f$fromCurrency = Field(
    'fromCurrency',
    _$fromCurrency,
  );
  static String _$createdTime(PreApprovalDetails v) => v.createdTime;
  static const Field<PreApprovalDetails, String> _f$createdTime = Field(
    'createdTime',
    _$createdTime,
  );
  static PreApprovalDetailsStatus _$status(PreApprovalDetails v) => v.status;
  static const Field<PreApprovalDetails, PreApprovalDetailsStatus> _f$status =
      Field('status', _$status);
  static String _$message(PreApprovalDetails v) => v.message;
  static const Field<PreApprovalDetails, String> _f$message = Field(
    'message',
    _$message,
  );
  static String? _$approvedTime(PreApprovalDetails v) => v.approvedTime;
  static const Field<PreApprovalDetails, String> _f$approvedTime = Field(
    'approvedTime',
    _$approvedTime,
    opt: true,
  );
  static String? _$expiryTime(PreApprovalDetails v) => v.expiryTime;
  static const Field<PreApprovalDetails, String> _f$expiryTime = Field(
    'expiryTime',
    _$expiryTime,
    opt: true,
  );
  static PreApprovalDetailsFrequency? _$frequency(PreApprovalDetails v) =>
      v.frequency;
  static const Field<PreApprovalDetails, PreApprovalDetailsFrequency>
  _f$frequency = Field('frequency', _$frequency, opt: true);
  static String? _$startDate(PreApprovalDetails v) => v.startDate;
  static const Field<PreApprovalDetails, String> _f$startDate = Field(
    'startDate',
    _$startDate,
    opt: true,
  );
  static String? _$lastUsedDate(PreApprovalDetails v) => v.lastUsedDate;
  static const Field<PreApprovalDetails, String> _f$lastUsedDate = Field(
    'lastUsedDate',
    _$lastUsedDate,
    opt: true,
  );
  static String? _$offer(PreApprovalDetails v) => v.offer;
  static const Field<PreApprovalDetails, String> _f$offer = Field(
    'offer',
    _$offer,
    opt: true,
  );
  static String? _$externalId(PreApprovalDetails v) => v.externalId;
  static const Field<PreApprovalDetails, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static String? _$maxDebitAmount(PreApprovalDetails v) => v.maxDebitAmount;
  static const Field<PreApprovalDetails, String> _f$maxDebitAmount = Field(
    'maxDebitAmount',
    _$maxDebitAmount,
    opt: true,
  );

  @override
  final MappableFields<PreApprovalDetails> fields = const {
    #preApprovalId: _f$preApprovalId,
    #toFri: _f$toFri,
    #fromFri: _f$fromFri,
    #fromCurrency: _f$fromCurrency,
    #createdTime: _f$createdTime,
    #status: _f$status,
    #message: _f$message,
    #approvedTime: _f$approvedTime,
    #expiryTime: _f$expiryTime,
    #frequency: _f$frequency,
    #startDate: _f$startDate,
    #lastUsedDate: _f$lastUsedDate,
    #offer: _f$offer,
    #externalId: _f$externalId,
    #maxDebitAmount: _f$maxDebitAmount,
  };

  static PreApprovalDetails _instantiate(DecodingData data) {
    return PreApprovalDetails(
      preApprovalId: data.dec(_f$preApprovalId),
      toFri: data.dec(_f$toFri),
      fromFri: data.dec(_f$fromFri),
      fromCurrency: data.dec(_f$fromCurrency),
      createdTime: data.dec(_f$createdTime),
      status: data.dec(_f$status),
      message: data.dec(_f$message),
      approvedTime: data.dec(_f$approvedTime),
      expiryTime: data.dec(_f$expiryTime),
      frequency: data.dec(_f$frequency),
      startDate: data.dec(_f$startDate),
      lastUsedDate: data.dec(_f$lastUsedDate),
      offer: data.dec(_f$offer),
      externalId: data.dec(_f$externalId),
      maxDebitAmount: data.dec(_f$maxDebitAmount),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PreApprovalDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PreApprovalDetails>(map);
  }

  static PreApprovalDetails fromJson(String json) {
    return ensureInitialized().decodeJson<PreApprovalDetails>(json);
  }
}

mixin PreApprovalDetailsMappable {
  String toJson() {
    return PreApprovalDetailsMapper.ensureInitialized()
        .encodeJson<PreApprovalDetails>(this as PreApprovalDetails);
  }

  Map<String, dynamic> toMap() {
    return PreApprovalDetailsMapper.ensureInitialized()
        .encodeMap<PreApprovalDetails>(this as PreApprovalDetails);
  }

  PreApprovalDetailsCopyWith<
    PreApprovalDetails,
    PreApprovalDetails,
    PreApprovalDetails
  >
  get copyWith =>
      _PreApprovalDetailsCopyWithImpl<PreApprovalDetails, PreApprovalDetails>(
        this as PreApprovalDetails,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PreApprovalDetailsMapper.ensureInitialized().stringifyValue(
      this as PreApprovalDetails,
    );
  }

  @override
  bool operator ==(Object other) {
    return PreApprovalDetailsMapper.ensureInitialized().equalsValue(
      this as PreApprovalDetails,
      other,
    );
  }

  @override
  int get hashCode {
    return PreApprovalDetailsMapper.ensureInitialized().hashValue(
      this as PreApprovalDetails,
    );
  }
}

extension PreApprovalDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PreApprovalDetails, $Out> {
  PreApprovalDetailsCopyWith<$R, PreApprovalDetails, $Out>
  get $asPreApprovalDetails => $base.as(
    (v, t, t2) => _PreApprovalDetailsCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PreApprovalDetailsCopyWith<
  $R,
  $In extends PreApprovalDetails,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? preApprovalId,
    String? toFri,
    String? fromFri,
    String? fromCurrency,
    String? createdTime,
    PreApprovalDetailsStatus? status,
    String? message,
    String? approvedTime,
    String? expiryTime,
    PreApprovalDetailsFrequency? frequency,
    String? startDate,
    String? lastUsedDate,
    String? offer,
    String? externalId,
    String? maxDebitAmount,
  });
  PreApprovalDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PreApprovalDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PreApprovalDetails, $Out>
    implements PreApprovalDetailsCopyWith<$R, PreApprovalDetails, $Out> {
  _PreApprovalDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PreApprovalDetails> $mapper =
      PreApprovalDetailsMapper.ensureInitialized();
  @override
  $R call({
    String? preApprovalId,
    String? toFri,
    String? fromFri,
    String? fromCurrency,
    String? createdTime,
    PreApprovalDetailsStatus? status,
    String? message,
    Object? approvedTime = $none,
    Object? expiryTime = $none,
    Object? frequency = $none,
    Object? startDate = $none,
    Object? lastUsedDate = $none,
    Object? offer = $none,
    Object? externalId = $none,
    Object? maxDebitAmount = $none,
  }) => $apply(
    FieldCopyWithData({
      if (preApprovalId != null) #preApprovalId: preApprovalId,
      if (toFri != null) #toFri: toFri,
      if (fromFri != null) #fromFri: fromFri,
      if (fromCurrency != null) #fromCurrency: fromCurrency,
      if (createdTime != null) #createdTime: createdTime,
      if (status != null) #status: status,
      if (message != null) #message: message,
      if (approvedTime != $none) #approvedTime: approvedTime,
      if (expiryTime != $none) #expiryTime: expiryTime,
      if (frequency != $none) #frequency: frequency,
      if (startDate != $none) #startDate: startDate,
      if (lastUsedDate != $none) #lastUsedDate: lastUsedDate,
      if (offer != $none) #offer: offer,
      if (externalId != $none) #externalId: externalId,
      if (maxDebitAmount != $none) #maxDebitAmount: maxDebitAmount,
    }),
  );
  @override
  PreApprovalDetails $make(CopyWithData data) => PreApprovalDetails(
    preApprovalId: data.get(#preApprovalId, or: $value.preApprovalId),
    toFri: data.get(#toFri, or: $value.toFri),
    fromFri: data.get(#fromFri, or: $value.fromFri),
    fromCurrency: data.get(#fromCurrency, or: $value.fromCurrency),
    createdTime: data.get(#createdTime, or: $value.createdTime),
    status: data.get(#status, or: $value.status),
    message: data.get(#message, or: $value.message),
    approvedTime: data.get(#approvedTime, or: $value.approvedTime),
    expiryTime: data.get(#expiryTime, or: $value.expiryTime),
    frequency: data.get(#frequency, or: $value.frequency),
    startDate: data.get(#startDate, or: $value.startDate),
    lastUsedDate: data.get(#lastUsedDate, or: $value.lastUsedDate),
    offer: data.get(#offer, or: $value.offer),
    externalId: data.get(#externalId, or: $value.externalId),
    maxDebitAmount: data.get(#maxDebitAmount, or: $value.maxDebitAmount),
  );

  @override
  PreApprovalDetailsCopyWith<$R2, PreApprovalDetails, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PreApprovalDetailsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

