// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'authorize_body.dart';

class AuthorizeBodyMapper extends ClassMapperBase<AuthorizeBody> {
  AuthorizeBodyMapper._();

  static AuthorizeBodyMapper? _instance;
  static AuthorizeBodyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthorizeBodyMapper._());
      AccessTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthorizeBody';

  static String _$loginHint(AuthorizeBody v) => v.loginHint;
  static const Field<AuthorizeBody, String> _f$loginHint = Field(
    'loginHint',
    _$loginHint,
    key: r'login_hint',
  );
  static String _$scope(AuthorizeBody v) => v.scope;
  static const Field<AuthorizeBody, String> _f$scope = Field('scope', _$scope);
  static AccessType _$accessType(AuthorizeBody v) => v.accessType;
  static const Field<AuthorizeBody, AccessType> _f$accessType = Field(
    'accessType',
    _$accessType,
    key: r'access_type',
  );

  @override
  final MappableFields<AuthorizeBody> fields = const {
    #loginHint: _f$loginHint,
    #scope: _f$scope,
    #accessType: _f$accessType,
  };

  static AuthorizeBody _instantiate(DecodingData data) {
    return AuthorizeBody(
      loginHint: data.dec(_f$loginHint),
      scope: data.dec(_f$scope),
      accessType: data.dec(_f$accessType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthorizeBody fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthorizeBody>(map);
  }

  static AuthorizeBody fromJson(String json) {
    return ensureInitialized().decodeJson<AuthorizeBody>(json);
  }
}

mixin AuthorizeBodyMappable {
  String toJson() {
    return AuthorizeBodyMapper.ensureInitialized().encodeJson<AuthorizeBody>(
      this as AuthorizeBody,
    );
  }

  Map<String, dynamic> toMap() {
    return AuthorizeBodyMapper.ensureInitialized().encodeMap<AuthorizeBody>(
      this as AuthorizeBody,
    );
  }

  AuthorizeBodyCopyWith<AuthorizeBody, AuthorizeBody, AuthorizeBody>
  get copyWith => _AuthorizeBodyCopyWithImpl<AuthorizeBody, AuthorizeBody>(
    this as AuthorizeBody,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return AuthorizeBodyMapper.ensureInitialized().stringifyValue(
      this as AuthorizeBody,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthorizeBodyMapper.ensureInitialized().equalsValue(
      this as AuthorizeBody,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthorizeBodyMapper.ensureInitialized().hashValue(
      this as AuthorizeBody,
    );
  }
}

extension AuthorizeBodyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthorizeBody, $Out> {
  AuthorizeBodyCopyWith<$R, AuthorizeBody, $Out> get $asAuthorizeBody =>
      $base.as((v, t, t2) => _AuthorizeBodyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthorizeBodyCopyWith<$R, $In extends AuthorizeBody, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? loginHint, String? scope, AccessType? accessType});
  AuthorizeBodyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthorizeBodyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthorizeBody, $Out>
    implements AuthorizeBodyCopyWith<$R, AuthorizeBody, $Out> {
  _AuthorizeBodyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthorizeBody> $mapper =
      AuthorizeBodyMapper.ensureInitialized();
  @override
  $R call({String? loginHint, String? scope, AccessType? accessType}) => $apply(
    FieldCopyWithData({
      if (loginHint != null) #loginHint: loginHint,
      if (scope != null) #scope: scope,
      if (accessType != null) #accessType: accessType,
    }),
  );
  @override
  AuthorizeBody $make(CopyWithData data) => AuthorizeBody(
    loginHint: data.get(#loginHint, or: $value.loginHint),
    scope: data.get(#scope, or: $value.scope),
    accessType: data.get(#accessType, or: $value.accessType),
  );

  @override
  AuthorizeBodyCopyWith<$R2, AuthorizeBody, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthorizeBodyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

