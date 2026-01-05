// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'token_post401_application_json_response.dart';

class TokenPost401ApplicationJsonResponseMapper
    extends ClassMapperBase<TokenPost401ApplicationJsonResponse> {
  TokenPost401ApplicationJsonResponseMapper._();

  static TokenPost401ApplicationJsonResponseMapper? _instance;
  static TokenPost401ApplicationJsonResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TokenPost401ApplicationJsonResponseMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'TokenPost401ApplicationJsonResponse';

  static String? _$error(TokenPost401ApplicationJsonResponse v) => v.error;
  static const Field<TokenPost401ApplicationJsonResponse, String> _f$error =
      Field('error', _$error, opt: true);

  @override
  final MappableFields<TokenPost401ApplicationJsonResponse> fields = const {
    #error: _f$error,
  };

  static TokenPost401ApplicationJsonResponse _instantiate(DecodingData data) {
    return TokenPost401ApplicationJsonResponse(error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;

  static TokenPost401ApplicationJsonResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TokenPost401ApplicationJsonResponse>(
      map,
    );
  }

  static TokenPost401ApplicationJsonResponse fromJson(String json) {
    return ensureInitialized().decodeJson<TokenPost401ApplicationJsonResponse>(
      json,
    );
  }
}

mixin TokenPost401ApplicationJsonResponseMappable {
  String toJson() {
    return TokenPost401ApplicationJsonResponseMapper.ensureInitialized()
        .encodeJson<TokenPost401ApplicationJsonResponse>(
          this as TokenPost401ApplicationJsonResponse,
        );
  }

  Map<String, dynamic> toMap() {
    return TokenPost401ApplicationJsonResponseMapper.ensureInitialized()
        .encodeMap<TokenPost401ApplicationJsonResponse>(
          this as TokenPost401ApplicationJsonResponse,
        );
  }

  TokenPost401ApplicationJsonResponseCopyWith<
    TokenPost401ApplicationJsonResponse,
    TokenPost401ApplicationJsonResponse,
    TokenPost401ApplicationJsonResponse
  >
  get copyWith =>
      _TokenPost401ApplicationJsonResponseCopyWithImpl<
        TokenPost401ApplicationJsonResponse,
        TokenPost401ApplicationJsonResponse
      >(this as TokenPost401ApplicationJsonResponse, $identity, $identity);
  @override
  String toString() {
    return TokenPost401ApplicationJsonResponseMapper.ensureInitialized()
        .stringifyValue(this as TokenPost401ApplicationJsonResponse);
  }

  @override
  bool operator ==(Object other) {
    return TokenPost401ApplicationJsonResponseMapper.ensureInitialized()
        .equalsValue(this as TokenPost401ApplicationJsonResponse, other);
  }

  @override
  int get hashCode {
    return TokenPost401ApplicationJsonResponseMapper.ensureInitialized()
        .hashValue(this as TokenPost401ApplicationJsonResponse);
  }
}

extension TokenPost401ApplicationJsonResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TokenPost401ApplicationJsonResponse, $Out> {
  TokenPost401ApplicationJsonResponseCopyWith<
    $R,
    TokenPost401ApplicationJsonResponse,
    $Out
  >
  get $asTokenPost401ApplicationJsonResponse => $base.as(
    (v, t, t2) =>
        _TokenPost401ApplicationJsonResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TokenPost401ApplicationJsonResponseCopyWith<
  $R,
  $In extends TokenPost401ApplicationJsonResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? error});
  TokenPost401ApplicationJsonResponseCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TokenPost401ApplicationJsonResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TokenPost401ApplicationJsonResponse, $Out>
    implements
        TokenPost401ApplicationJsonResponseCopyWith<
          $R,
          TokenPost401ApplicationJsonResponse,
          $Out
        > {
  _TokenPost401ApplicationJsonResponseCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TokenPost401ApplicationJsonResponse> $mapper =
      TokenPost401ApplicationJsonResponseMapper.ensureInitialized();
  @override
  $R call({Object? error = $none}) =>
      $apply(FieldCopyWithData({if (error != $none) #error: error}));
  @override
  TokenPost401ApplicationJsonResponse $make(CopyWithData data) =>
      TokenPost401ApplicationJsonResponse(
        error: data.get(#error, or: $value.error),
      );

  @override
  TokenPost401ApplicationJsonResponseCopyWith<
    $R2,
    TokenPost401ApplicationJsonResponse,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TokenPost401ApplicationJsonResponseCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

