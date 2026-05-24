// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'token_post200_application_json_response.dart';

class TokenPost200ApplicationJsonResponseMapper
    extends ClassMapperBase<TokenPost200ApplicationJsonResponse> {
  TokenPost200ApplicationJsonResponseMapper._();

  static TokenPost200ApplicationJsonResponseMapper? _instance;
  static TokenPost200ApplicationJsonResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TokenPost200ApplicationJsonResponseMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'TokenPost200ApplicationJsonResponse';

  static String? _$accessToken(TokenPost200ApplicationJsonResponse v) =>
      v.accessToken;
  static const Field<TokenPost200ApplicationJsonResponse, String>
  _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
    opt: true,
  );
  static String? _$tokenType(TokenPost200ApplicationJsonResponse v) =>
      v.tokenType;
  static const Field<TokenPost200ApplicationJsonResponse, String> _f$tokenType =
      Field('tokenType', _$tokenType, key: r'token_type', opt: true);
  static int? _$expiresIn(TokenPost200ApplicationJsonResponse v) => v.expiresIn;
  static const Field<TokenPost200ApplicationJsonResponse, int> _f$expiresIn =
      Field('expiresIn', _$expiresIn, key: r'expires_in', opt: true);

  @override
  final MappableFields<TokenPost200ApplicationJsonResponse> fields = const {
    #accessToken: _f$accessToken,
    #tokenType: _f$tokenType,
    #expiresIn: _f$expiresIn,
  };

  static TokenPost200ApplicationJsonResponse _instantiate(DecodingData data) {
    return TokenPost200ApplicationJsonResponse(
      accessToken: data.dec(_f$accessToken),
      tokenType: data.dec(_f$tokenType),
      expiresIn: data.dec(_f$expiresIn),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TokenPost200ApplicationJsonResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TokenPost200ApplicationJsonResponse>(
      map,
    );
  }

  static TokenPost200ApplicationJsonResponse fromJson(String json) {
    return ensureInitialized().decodeJson<TokenPost200ApplicationJsonResponse>(
      json,
    );
  }
}

mixin TokenPost200ApplicationJsonResponseMappable {
  String toJson() {
    return TokenPost200ApplicationJsonResponseMapper.ensureInitialized()
        .encodeJson<TokenPost200ApplicationJsonResponse>(
          this as TokenPost200ApplicationJsonResponse,
        );
  }

  Map<String, dynamic> toMap() {
    return TokenPost200ApplicationJsonResponseMapper.ensureInitialized()
        .encodeMap<TokenPost200ApplicationJsonResponse>(
          this as TokenPost200ApplicationJsonResponse,
        );
  }

  TokenPost200ApplicationJsonResponseCopyWith<
    TokenPost200ApplicationJsonResponse,
    TokenPost200ApplicationJsonResponse,
    TokenPost200ApplicationJsonResponse
  >
  get copyWith =>
      _TokenPost200ApplicationJsonResponseCopyWithImpl<
        TokenPost200ApplicationJsonResponse,
        TokenPost200ApplicationJsonResponse
      >(this as TokenPost200ApplicationJsonResponse, $identity, $identity);
  @override
  String toString() {
    return TokenPost200ApplicationJsonResponseMapper.ensureInitialized()
        .stringifyValue(this as TokenPost200ApplicationJsonResponse);
  }

  @override
  bool operator ==(Object other) {
    return TokenPost200ApplicationJsonResponseMapper.ensureInitialized()
        .equalsValue(this as TokenPost200ApplicationJsonResponse, other);
  }

  @override
  int get hashCode {
    return TokenPost200ApplicationJsonResponseMapper.ensureInitialized()
        .hashValue(this as TokenPost200ApplicationJsonResponse);
  }
}

extension TokenPost200ApplicationJsonResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TokenPost200ApplicationJsonResponse, $Out> {
  TokenPost200ApplicationJsonResponseCopyWith<
    $R,
    TokenPost200ApplicationJsonResponse,
    $Out
  >
  get $asTokenPost200ApplicationJsonResponse => $base.as(
    (v, t, t2) =>
        _TokenPost200ApplicationJsonResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TokenPost200ApplicationJsonResponseCopyWith<
  $R,
  $In extends TokenPost200ApplicationJsonResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken, String? tokenType, int? expiresIn});
  TokenPost200ApplicationJsonResponseCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TokenPost200ApplicationJsonResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TokenPost200ApplicationJsonResponse, $Out>
    implements
        TokenPost200ApplicationJsonResponseCopyWith<
          $R,
          TokenPost200ApplicationJsonResponse,
          $Out
        > {
  _TokenPost200ApplicationJsonResponseCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TokenPost200ApplicationJsonResponse> $mapper =
      TokenPost200ApplicationJsonResponseMapper.ensureInitialized();
  @override
  $R call({
    Object? accessToken = $none,
    Object? tokenType = $none,
    Object? expiresIn = $none,
  }) => $apply(
    FieldCopyWithData({
      if (accessToken != $none) #accessToken: accessToken,
      if (tokenType != $none) #tokenType: tokenType,
      if (expiresIn != $none) #expiresIn: expiresIn,
    }),
  );
  @override
  TokenPost200ApplicationJsonResponse $make(CopyWithData data) =>
      TokenPost200ApplicationJsonResponse(
        accessToken: data.get(#accessToken, or: $value.accessToken),
        tokenType: data.get(#tokenType, or: $value.tokenType),
        expiresIn: data.get(#expiresIn, or: $value.expiresIn),
      );

  @override
  TokenPost200ApplicationJsonResponseCopyWith<
    $R2,
    TokenPost200ApplicationJsonResponse,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TokenPost200ApplicationJsonResponseCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

