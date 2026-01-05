// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_to_pay_result_status.dart';

class RequestToPayResultStatusMapper
    extends EnumMapper<RequestToPayResultStatus> {
  RequestToPayResultStatusMapper._();

  static RequestToPayResultStatusMapper? _instance;
  static RequestToPayResultStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = RequestToPayResultStatusMapper._(),
      );
    }
    return _instance!;
  }

  static RequestToPayResultStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RequestToPayResultStatus decode(dynamic value) {
    switch (value) {
      case 'PENDING':
        return RequestToPayResultStatus.pending;
      case 'SUCCESSFUL':
        return RequestToPayResultStatus.successful;
      case 'FAILED':
        return RequestToPayResultStatus.failed;
      case 'unknown':
        return RequestToPayResultStatus.unknown;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RequestToPayResultStatus self) {
    switch (self) {
      case RequestToPayResultStatus.pending:
        return 'PENDING';
      case RequestToPayResultStatus.successful:
        return 'SUCCESSFUL';
      case RequestToPayResultStatus.failed:
        return 'FAILED';
      case RequestToPayResultStatus.unknown:
        return 'unknown';
    }
  }
}

extension RequestToPayResultStatusMapperExtension on RequestToPayResultStatus {
  dynamic toValue() {
    RequestToPayResultStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RequestToPayResultStatus>(this);
  }
}

