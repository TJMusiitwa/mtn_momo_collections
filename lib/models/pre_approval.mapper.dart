// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pre_approval.dart';

class PreApprovalMapper extends ClassMapperBase<PreApproval> {
  PreApprovalMapper._();

  static PreApprovalMapper? _instance;
  static PreApprovalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PreApprovalMapper._());
      PartyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PreApproval';

  static Party? _$payer(PreApproval v) => v.payer;
  static const Field<PreApproval, Party> _f$payer = Field(
    'payer',
    _$payer,
    opt: true,
  );
  static String? _$payerCurrency(PreApproval v) => v.payerCurrency;
  static const Field<PreApproval, String> _f$payerCurrency = Field(
    'payerCurrency',
    _$payerCurrency,
    opt: true,
  );
  static String? _$payerMessage(PreApproval v) => v.payerMessage;
  static const Field<PreApproval, String> _f$payerMessage = Field(
    'payerMessage',
    _$payerMessage,
    opt: true,
  );
  static int? _$validityTime(PreApproval v) => v.validityTime;
  static const Field<PreApproval, int> _f$validityTime = Field(
    'validityTime',
    _$validityTime,
    opt: true,
  );

  @override
  final MappableFields<PreApproval> fields = const {
    #payer: _f$payer,
    #payerCurrency: _f$payerCurrency,
    #payerMessage: _f$payerMessage,
    #validityTime: _f$validityTime,
  };

  static PreApproval _instantiate(DecodingData data) {
    return PreApproval(
      payer: data.dec(_f$payer),
      payerCurrency: data.dec(_f$payerCurrency),
      payerMessage: data.dec(_f$payerMessage),
      validityTime: data.dec(_f$validityTime),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PreApproval fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PreApproval>(map);
  }

  static PreApproval fromJson(String json) {
    return ensureInitialized().decodeJson<PreApproval>(json);
  }
}

mixin PreApprovalMappable {
  String toJson() {
    return PreApprovalMapper.ensureInitialized().encodeJson<PreApproval>(
      this as PreApproval,
    );
  }

  Map<String, dynamic> toMap() {
    return PreApprovalMapper.ensureInitialized().encodeMap<PreApproval>(
      this as PreApproval,
    );
  }

  PreApprovalCopyWith<PreApproval, PreApproval, PreApproval> get copyWith =>
      _PreApprovalCopyWithImpl<PreApproval, PreApproval>(
        this as PreApproval,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PreApprovalMapper.ensureInitialized().stringifyValue(
      this as PreApproval,
    );
  }

  @override
  bool operator ==(Object other) {
    return PreApprovalMapper.ensureInitialized().equalsValue(
      this as PreApproval,
      other,
    );
  }

  @override
  int get hashCode {
    return PreApprovalMapper.ensureInitialized().hashValue(this as PreApproval);
  }
}

extension PreApprovalValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PreApproval, $Out> {
  PreApprovalCopyWith<$R, PreApproval, $Out> get $asPreApproval =>
      $base.as((v, t, t2) => _PreApprovalCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PreApprovalCopyWith<$R, $In extends PreApproval, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PartyCopyWith<$R, Party, Party>? get payer;
  $R call({
    Party? payer,
    String? payerCurrency,
    String? payerMessage,
    int? validityTime,
  });
  PreApprovalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PreApprovalCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PreApproval, $Out>
    implements PreApprovalCopyWith<$R, PreApproval, $Out> {
  _PreApprovalCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PreApproval> $mapper =
      PreApprovalMapper.ensureInitialized();
  @override
  PartyCopyWith<$R, Party, Party>? get payer =>
      $value.payer?.copyWith.$chain((v) => call(payer: v));
  @override
  $R call({
    Object? payer = $none,
    Object? payerCurrency = $none,
    Object? payerMessage = $none,
    Object? validityTime = $none,
  }) => $apply(
    FieldCopyWithData({
      if (payer != $none) #payer: payer,
      if (payerCurrency != $none) #payerCurrency: payerCurrency,
      if (payerMessage != $none) #payerMessage: payerMessage,
      if (validityTime != $none) #validityTime: validityTime,
    }),
  );
  @override
  PreApproval $make(CopyWithData data) => PreApproval(
    payer: data.get(#payer, or: $value.payer),
    payerCurrency: data.get(#payerCurrency, or: $value.payerCurrency),
    payerMessage: data.get(#payerMessage, or: $value.payerMessage),
    validityTime: data.get(#validityTime, or: $value.validityTime),
  );

  @override
  PreApprovalCopyWith<$R2, PreApproval, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PreApprovalCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

