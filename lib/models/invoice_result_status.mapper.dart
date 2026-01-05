// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'invoice_result_status.dart';

class InvoiceResultStatusMapper extends EnumMapper<InvoiceResultStatus> {
  InvoiceResultStatusMapper._();

  static InvoiceResultStatusMapper? _instance;
  static InvoiceResultStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InvoiceResultStatusMapper._());
    }
    return _instance!;
  }

  static InvoiceResultStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  InvoiceResultStatus decode(dynamic value) {
    switch (value) {
      case 'CREATED':
        return InvoiceResultStatus.created;
      case 'PENDING':
        return InvoiceResultStatus.pending;
      case 'SUCCESSFUL':
        return InvoiceResultStatus.successful;
      case 'FAILED':
        return InvoiceResultStatus.failed;
      case 'unknown':
        return InvoiceResultStatus.unknown;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(InvoiceResultStatus self) {
    switch (self) {
      case InvoiceResultStatus.created:
        return 'CREATED';
      case InvoiceResultStatus.pending:
        return 'PENDING';
      case InvoiceResultStatus.successful:
        return 'SUCCESSFUL';
      case InvoiceResultStatus.failed:
        return 'FAILED';
      case InvoiceResultStatus.unknown:
        return 'unknown';
    }
  }
}

extension InvoiceResultStatusMapperExtension on InvoiceResultStatus {
  dynamic toValue() {
    InvoiceResultStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<InvoiceResultStatus>(this);
  }
}

