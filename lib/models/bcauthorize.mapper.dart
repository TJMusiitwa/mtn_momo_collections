// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bcauthorize.dart';

class BcauthorizeMapper extends ClassMapperBase<Bcauthorize> {
  BcauthorizeMapper._();

  static BcauthorizeMapper? _instance;
  static BcauthorizeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcauthorizeMapper._());
      BcauthorizeAccessTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Bcauthorize';

  static String? _$scope(Bcauthorize v) => v.scope;
  static const Field<Bcauthorize, String> _f$scope = Field(
    'scope',
    _$scope,
    opt: true,
  );
  static String? _$loginHint(Bcauthorize v) => v.loginHint;
  static const Field<Bcauthorize, String> _f$loginHint = Field(
    'loginHint',
    _$loginHint,
    key: r'login_hint',
    opt: true,
  );
  static BcauthorizeAccessType? _$accessType(Bcauthorize v) => v.accessType;
  static const Field<Bcauthorize, BcauthorizeAccessType> _f$accessType = Field(
    'accessType',
    _$accessType,
    key: r'access_type',
    opt: true,
  );
  static int? _$consentValidIn(Bcauthorize v) => v.consentValidIn;
  static const Field<Bcauthorize, int> _f$consentValidIn = Field(
    'consentValidIn',
    _$consentValidIn,
    key: r'consent_valid_in',
    opt: true,
  );
  static String? _$clientNotificationToken(Bcauthorize v) =>
      v.clientNotificationToken;
  static const Field<Bcauthorize, String> _f$clientNotificationToken = Field(
    'clientNotificationToken',
    _$clientNotificationToken,
    key: r'client_notification_token',
    opt: true,
  );
  static String? _$scopeInstruction(Bcauthorize v) => v.scopeInstruction;
  static const Field<Bcauthorize, String> _f$scopeInstruction = Field(
    'scopeInstruction',
    _$scopeInstruction,
    key: r'scope_instruction',
    opt: true,
  );

  @override
  final MappableFields<Bcauthorize> fields = const {
    #scope: _f$scope,
    #loginHint: _f$loginHint,
    #accessType: _f$accessType,
    #consentValidIn: _f$consentValidIn,
    #clientNotificationToken: _f$clientNotificationToken,
    #scopeInstruction: _f$scopeInstruction,
  };

  static Bcauthorize _instantiate(DecodingData data) {
    return Bcauthorize(
      scope: data.dec(_f$scope),
      loginHint: data.dec(_f$loginHint),
      accessType: data.dec(_f$accessType),
      consentValidIn: data.dec(_f$consentValidIn),
      clientNotificationToken: data.dec(_f$clientNotificationToken),
      scopeInstruction: data.dec(_f$scopeInstruction),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Bcauthorize fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Bcauthorize>(map);
  }

  static Bcauthorize fromJson(String json) {
    return ensureInitialized().decodeJson<Bcauthorize>(json);
  }
}

mixin BcauthorizeMappable {
  String toJson() {
    return BcauthorizeMapper.ensureInitialized().encodeJson<Bcauthorize>(
      this as Bcauthorize,
    );
  }

  Map<String, dynamic> toMap() {
    return BcauthorizeMapper.ensureInitialized().encodeMap<Bcauthorize>(
      this as Bcauthorize,
    );
  }

  BcauthorizeCopyWith<Bcauthorize, Bcauthorize, Bcauthorize> get copyWith =>
      _BcauthorizeCopyWithImpl<Bcauthorize, Bcauthorize>(
        this as Bcauthorize,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BcauthorizeMapper.ensureInitialized().stringifyValue(
      this as Bcauthorize,
    );
  }

  @override
  bool operator ==(Object other) {
    return BcauthorizeMapper.ensureInitialized().equalsValue(
      this as Bcauthorize,
      other,
    );
  }

  @override
  int get hashCode {
    return BcauthorizeMapper.ensureInitialized().hashValue(this as Bcauthorize);
  }
}

extension BcauthorizeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Bcauthorize, $Out> {
  BcauthorizeCopyWith<$R, Bcauthorize, $Out> get $asBcauthorize =>
      $base.as((v, t, t2) => _BcauthorizeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BcauthorizeCopyWith<$R, $In extends Bcauthorize, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? scope,
    String? loginHint,
    BcauthorizeAccessType? accessType,
    int? consentValidIn,
    String? clientNotificationToken,
    String? scopeInstruction,
  });
  BcauthorizeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BcauthorizeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Bcauthorize, $Out>
    implements BcauthorizeCopyWith<$R, Bcauthorize, $Out> {
  _BcauthorizeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Bcauthorize> $mapper =
      BcauthorizeMapper.ensureInitialized();
  @override
  $R call({
    Object? scope = $none,
    Object? loginHint = $none,
    Object? accessType = $none,
    Object? consentValidIn = $none,
    Object? clientNotificationToken = $none,
    Object? scopeInstruction = $none,
  }) => $apply(
    FieldCopyWithData({
      if (scope != $none) #scope: scope,
      if (loginHint != $none) #loginHint: loginHint,
      if (accessType != $none) #accessType: accessType,
      if (consentValidIn != $none) #consentValidIn: consentValidIn,
      if (clientNotificationToken != $none)
        #clientNotificationToken: clientNotificationToken,
      if (scopeInstruction != $none) #scopeInstruction: scopeInstruction,
    }),
  );
  @override
  Bcauthorize $make(CopyWithData data) => Bcauthorize(
    scope: data.get(#scope, or: $value.scope),
    loginHint: data.get(#loginHint, or: $value.loginHint),
    accessType: data.get(#accessType, or: $value.accessType),
    consentValidIn: data.get(#consentValidIn, or: $value.consentValidIn),
    clientNotificationToken: data.get(
      #clientNotificationToken,
      or: $value.clientNotificationToken,
    ),
    scopeInstruction: data.get(#scopeInstruction, or: $value.scopeInstruction),
  );

  @override
  BcauthorizeCopyWith<$R2, Bcauthorize, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BcauthorizeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

