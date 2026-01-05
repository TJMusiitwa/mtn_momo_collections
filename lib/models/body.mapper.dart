// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'body.dart';

class BodyMapper extends ClassMapperBase<Body> {
  BodyMapper._();

  static BodyMapper? _instance;
  static BodyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BodyMapper._());
      AccessTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Body';

  static String _$loginHint(Body v) => v.loginHint;
  static const Field<Body, String> _f$loginHint = Field(
    'loginHint',
    _$loginHint,
    key: r'login_hint',
  );
  static String _$scope(Body v) => v.scope;
  static const Field<Body, String> _f$scope = Field('scope', _$scope);
  static AccessType _$accessType(Body v) => v.accessType;
  static const Field<Body, AccessType> _f$accessType = Field(
    'accessType',
    _$accessType,
    key: r'access_type',
  );

  @override
  final MappableFields<Body> fields = const {
    #loginHint: _f$loginHint,
    #scope: _f$scope,
    #accessType: _f$accessType,
  };

  static Body _instantiate(DecodingData data) {
    return Body(
      loginHint: data.dec(_f$loginHint),
      scope: data.dec(_f$scope),
      accessType: data.dec(_f$accessType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Body fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Body>(map);
  }

  static Body fromJson(String json) {
    return ensureInitialized().decodeJson<Body>(json);
  }
}

mixin BodyMappable {
  String toJson() {
    return BodyMapper.ensureInitialized().encodeJson<Body>(this as Body);
  }

  Map<String, dynamic> toMap() {
    return BodyMapper.ensureInitialized().encodeMap<Body>(this as Body);
  }

  BodyCopyWith<Body, Body, Body> get copyWith =>
      _BodyCopyWithImpl<Body, Body>(this as Body, $identity, $identity);
  @override
  String toString() {
    return BodyMapper.ensureInitialized().stringifyValue(this as Body);
  }

  @override
  bool operator ==(Object other) {
    return BodyMapper.ensureInitialized().equalsValue(this as Body, other);
  }

  @override
  int get hashCode {
    return BodyMapper.ensureInitialized().hashValue(this as Body);
  }
}

extension BodyValueCopy<$R, $Out> on ObjectCopyWith<$R, Body, $Out> {
  BodyCopyWith<$R, Body, $Out> get $asBody =>
      $base.as((v, t, t2) => _BodyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BodyCopyWith<$R, $In extends Body, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? loginHint, String? scope, AccessType? accessType});
  BodyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BodyCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Body, $Out>
    implements BodyCopyWith<$R, Body, $Out> {
  _BodyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Body> $mapper = BodyMapper.ensureInitialized();
  @override
  $R call({String? loginHint, String? scope, AccessType? accessType}) => $apply(
    FieldCopyWithData({
      if (loginHint != null) #loginHint: loginHint,
      if (scope != null) #scope: scope,
      if (accessType != null) #accessType: accessType,
    }),
  );
  @override
  Body $make(CopyWithData data) => Body(
    loginHint: data.get(#loginHint, or: $value.loginHint),
    scope: data.get(#scope, or: $value.scope),
    accessType: data.get(#accessType, or: $value.accessType),
  );

  @override
  BodyCopyWith<$R2, Body, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BodyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

