// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'error_reason.dart';

class ErrorReasonMapper extends ClassMapperBase<ErrorReason> {
  ErrorReasonMapper._();

  static ErrorReasonMapper? _instance;
  static ErrorReasonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorReasonMapper._());
      ErrorReasonCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ErrorReason';

  static ErrorReasonCode? _$code(ErrorReason v) => v.code;
  static const Field<ErrorReason, ErrorReasonCode> _f$code = Field(
    'code',
    _$code,
    opt: true,
  );
  static String? _$message(ErrorReason v) => v.message;
  static const Field<ErrorReason, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );

  @override
  final MappableFields<ErrorReason> fields = const {
    #code: _f$code,
    #message: _f$message,
  };

  static ErrorReason _instantiate(DecodingData data) {
    return ErrorReason(code: data.dec(_f$code), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ErrorReason fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ErrorReason>(map);
  }

  static ErrorReason fromJson(String json) {
    return ensureInitialized().decodeJson<ErrorReason>(json);
  }
}

mixin ErrorReasonMappable {
  String toJson() {
    return ErrorReasonMapper.ensureInitialized().encodeJson<ErrorReason>(
      this as ErrorReason,
    );
  }

  Map<String, dynamic> toMap() {
    return ErrorReasonMapper.ensureInitialized().encodeMap<ErrorReason>(
      this as ErrorReason,
    );
  }

  ErrorReasonCopyWith<ErrorReason, ErrorReason, ErrorReason> get copyWith =>
      _ErrorReasonCopyWithImpl<ErrorReason, ErrorReason>(
        this as ErrorReason,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ErrorReasonMapper.ensureInitialized().stringifyValue(
      this as ErrorReason,
    );
  }

  @override
  bool operator ==(Object other) {
    return ErrorReasonMapper.ensureInitialized().equalsValue(
      this as ErrorReason,
      other,
    );
  }

  @override
  int get hashCode {
    return ErrorReasonMapper.ensureInitialized().hashValue(this as ErrorReason);
  }
}

extension ErrorReasonValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ErrorReason, $Out> {
  ErrorReasonCopyWith<$R, ErrorReason, $Out> get $asErrorReason =>
      $base.as((v, t, t2) => _ErrorReasonCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ErrorReasonCopyWith<$R, $In extends ErrorReason, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({ErrorReasonCode? code, String? message});
  ErrorReasonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ErrorReasonCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ErrorReason, $Out>
    implements ErrorReasonCopyWith<$R, ErrorReason, $Out> {
  _ErrorReasonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ErrorReason> $mapper =
      ErrorReasonMapper.ensureInitialized();
  @override
  $R call({Object? code = $none, Object? message = $none}) => $apply(
    FieldCopyWithData({
      if (code != $none) #code: code,
      if (message != $none) #message: message,
    }),
  );
  @override
  ErrorReason $make(CopyWithData data) => ErrorReason(
    code: data.get(#code, or: $value.code),
    message: data.get(#message, or: $value.message),
  );

  @override
  ErrorReasonCopyWith<$R2, ErrorReason, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ErrorReasonCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

