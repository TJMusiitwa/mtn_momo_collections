import 'package:dart_mappable/dart_mappable.dart';
import 'package:mtn_momo_sdk/src/generated/models/error_reason.dart';
import 'package:mtn_momo_sdk/src/generated/models/error_reason_code.dart';

final class ErrorReasonCustomMapper extends SimpleMapper<ErrorReason> {
  const ErrorReasonCustomMapper();

  @override
  ErrorReason decode(dynamic value) => switch (value) {
    final String str => _decodeString(str),
    final Map map => _decodeMap(map),
    _ => throw MapperException.unexpectedType(
      value.runtimeType,
      'String or Map',
    ),
  };

  ErrorReason _decodeString(String str) {
    final codeValue = ErrorReasonCode.values.firstWhere((e) {
      final enumStr = e.name.toUpperCase();
      final upperStr = str.toUpperCase();
      return enumStr == upperStr ||
          (e == ErrorReasonCode.resourceNotFound &&
              upperStr == 'RESOURCE_NOT_FOUND') ||
          (e == ErrorReasonCode.resourceAlreadyExist &&
              upperStr == 'RESOURCE_ALREADY_EXIST');
    }, orElse: () => ErrorReasonCode.unknown);

    return ErrorReason(code: codeValue, message: str);
  }

  ErrorReason _decodeMap(Map map) {
    final rawCode = map['code']?.toString();
    final message = map['message']?.toString();

    final codeValue = rawCode != null
        ? ErrorReasonCode.values.firstWhere((e) {
            final upperRaw = rawCode.toUpperCase();
            return e.name.toUpperCase() == upperRaw ||
                (e == ErrorReasonCode.resourceNotFound &&
                    upperRaw == 'RESOURCE_NOT_FOUND') ||
                (e == ErrorReasonCode.resourceAlreadyExist &&
                    upperRaw == 'RESOURCE_ALREADY_EXIST');
          }, orElse: () => ErrorReasonCode.unknown)
        : null;

    return ErrorReason(code: codeValue, message: message);
  }

  @override
  dynamic encode(ErrorReason value) {
    return {'code': value.code?.name, 'message': value.message};
  }
}
