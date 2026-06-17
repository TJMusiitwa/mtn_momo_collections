// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cash_transfer_payer_identification_type.dart';

class CashTransferPayerIdentificationTypeMapper
    extends EnumMapper<CashTransferPayerIdentificationType> {
  CashTransferPayerIdentificationTypeMapper._();

  static CashTransferPayerIdentificationTypeMapper? _instance;
  static CashTransferPayerIdentificationTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = CashTransferPayerIdentificationTypeMapper._(),
      );
    }
    return _instance!;
  }

  static CashTransferPayerIdentificationType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CashTransferPayerIdentificationType decode(dynamic value) {
    switch (value) {
      case 'PASS':
        return CashTransferPayerIdentificationType.pass;
      case 'CPFA':
        return CashTransferPayerIdentificationType.cpfa;
      case 'SRSSA':
        return CashTransferPayerIdentificationType.srssa;
      case 'NRIN':
        return CashTransferPayerIdentificationType.nrin;
      case 'OTHR':
        return CashTransferPayerIdentificationType.othr;
      case 'DRLC':
        return CashTransferPayerIdentificationType.drlc;
      case 'SOCS':
        return CashTransferPayerIdentificationType.socs;
      case 'AREG':
        return CashTransferPayerIdentificationType.areg;
      case 'IDCD':
        return CashTransferPayerIdentificationType.idcd;
      case 'EMID':
        return CashTransferPayerIdentificationType.emid;
      case 'unknown':
        return CashTransferPayerIdentificationType.unknown;
      default:
        return CashTransferPayerIdentificationType.values[10];
    }
  }

  @override
  dynamic encode(CashTransferPayerIdentificationType self) {
    switch (self) {
      case CashTransferPayerIdentificationType.pass:
        return 'PASS';
      case CashTransferPayerIdentificationType.cpfa:
        return 'CPFA';
      case CashTransferPayerIdentificationType.srssa:
        return 'SRSSA';
      case CashTransferPayerIdentificationType.nrin:
        return 'NRIN';
      case CashTransferPayerIdentificationType.othr:
        return 'OTHR';
      case CashTransferPayerIdentificationType.drlc:
        return 'DRLC';
      case CashTransferPayerIdentificationType.socs:
        return 'SOCS';
      case CashTransferPayerIdentificationType.areg:
        return 'AREG';
      case CashTransferPayerIdentificationType.idcd:
        return 'IDCD';
      case CashTransferPayerIdentificationType.emid:
        return 'EMID';
      case CashTransferPayerIdentificationType.unknown:
        return 'unknown';
    }
  }
}

extension CashTransferPayerIdentificationTypeMapperExtension
    on CashTransferPayerIdentificationType {
  dynamic toValue() {
    CashTransferPayerIdentificationTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CashTransferPayerIdentificationType>(
      this,
    );
  }
}

