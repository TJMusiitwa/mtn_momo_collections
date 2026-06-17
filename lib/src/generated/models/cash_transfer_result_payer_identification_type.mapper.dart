// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cash_transfer_result_payer_identification_type.dart';

class CashTransferResultPayerIdentificationTypeMapper
    extends EnumMapper<CashTransferResultPayerIdentificationType> {
  CashTransferResultPayerIdentificationTypeMapper._();

  static CashTransferResultPayerIdentificationTypeMapper? _instance;
  static CashTransferResultPayerIdentificationTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = CashTransferResultPayerIdentificationTypeMapper._(),
      );
    }
    return _instance!;
  }

  static CashTransferResultPayerIdentificationType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CashTransferResultPayerIdentificationType decode(dynamic value) {
    switch (value) {
      case 'PASS':
        return CashTransferResultPayerIdentificationType.pass;
      case 'CPFA':
        return CashTransferResultPayerIdentificationType.cpfa;
      case 'SRSSA':
        return CashTransferResultPayerIdentificationType.srssa;
      case 'NRIN':
        return CashTransferResultPayerIdentificationType.nrin;
      case 'OTHR':
        return CashTransferResultPayerIdentificationType.othr;
      case 'DRLC':
        return CashTransferResultPayerIdentificationType.drlc;
      case 'SOCS':
        return CashTransferResultPayerIdentificationType.socs;
      case 'AREG':
        return CashTransferResultPayerIdentificationType.areg;
      case 'IDCD':
        return CashTransferResultPayerIdentificationType.idcd;
      case 'EMID':
        return CashTransferResultPayerIdentificationType.emid;
      case 'unknown':
        return CashTransferResultPayerIdentificationType.unknown;
      default:
        return CashTransferResultPayerIdentificationType.values[10];
    }
  }

  @override
  dynamic encode(CashTransferResultPayerIdentificationType self) {
    switch (self) {
      case CashTransferResultPayerIdentificationType.pass:
        return 'PASS';
      case CashTransferResultPayerIdentificationType.cpfa:
        return 'CPFA';
      case CashTransferResultPayerIdentificationType.srssa:
        return 'SRSSA';
      case CashTransferResultPayerIdentificationType.nrin:
        return 'NRIN';
      case CashTransferResultPayerIdentificationType.othr:
        return 'OTHR';
      case CashTransferResultPayerIdentificationType.drlc:
        return 'DRLC';
      case CashTransferResultPayerIdentificationType.socs:
        return 'SOCS';
      case CashTransferResultPayerIdentificationType.areg:
        return 'AREG';
      case CashTransferResultPayerIdentificationType.idcd:
        return 'IDCD';
      case CashTransferResultPayerIdentificationType.emid:
        return 'EMID';
      case CashTransferResultPayerIdentificationType.unknown:
        return 'unknown';
    }
  }
}

extension CashTransferResultPayerIdentificationTypeMapperExtension
    on CashTransferResultPayerIdentificationType {
  dynamic toValue() {
    CashTransferResultPayerIdentificationTypeMapper.ensureInitialized();
    return MapperContainer.globals
        .toValue<CashTransferResultPayerIdentificationType>(this);
  }
}

