import 'package:dart_mappable/dart_mappable.dart';
import 'package:mtn_momo_collections/src/generated/models/error_reason.dart';
import 'package:mtn_momo_collections/src/generated/models/error_reason_code.dart';

class ErrorReasonCustomMapper extends SimpleMapper<ErrorReason> {
  const ErrorReasonCustomMapper();

  @override
  ErrorReason decode(dynamic value) {
    if (value is String) {
      final codeValue = ErrorReasonCode.values.firstWhere((e) {
        final enumStr = e.name.toUpperCase();
        return enumStr == value.toUpperCase() ||
            (e == ErrorReasonCode.resourceNotFound &&
                value.toUpperCase() == 'RESOURCE_NOT_FOUND') ||
            (e == ErrorReasonCode.resourceAlreadyExist &&
                value.toUpperCase() == 'RESOURCE_ALREADY_EXIST');
      }, orElse: () => ErrorReasonCode.unknown);

      return ErrorReason(code: codeValue, message: value);
    } else if (value is Map) {
      final mapData = Map<String, dynamic>.from(value);
      final rawCode = mapData['code']?.toString();
      final message = mapData['message']?.toString();

      final codeValue = rawCode != null
          ? ErrorReasonCode.values.firstWhere(
              (e) =>
                  e.name.toUpperCase() == rawCode.toUpperCase() ||
                  (e == ErrorReasonCode.resourceNotFound &&
                      rawCode.toUpperCase() == 'RESOURCE_NOT_FOUND') ||
                  (e == ErrorReasonCode.resourceAlreadyExist &&
                      rawCode.toUpperCase() == 'RESOURCE_ALREADY_EXIST'),
              orElse: () => ErrorReasonCode.unknown,
            )
          : null;

      return ErrorReason(code: codeValue, message: message);
    }
    throw MapperException.unexpectedType(value.runtimeType, 'String or Map');
  }

  @override
  dynamic encode(ErrorReason value) {
    return {'code': value.code?.name, 'message': value.message};
  }
}
