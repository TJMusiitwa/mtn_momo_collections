// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'account_holder_id_type.dart';

class AccountHolderIdTypeMapper extends EnumMapper<AccountHolderIdType> {
  AccountHolderIdTypeMapper._();

  static AccountHolderIdTypeMapper? _instance;
  static AccountHolderIdTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountHolderIdTypeMapper._());
    }
    return _instance!;
  }

  static AccountHolderIdType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AccountHolderIdType decode(dynamic value) {
    switch (value) {
      case 'MSISDN':
        return AccountHolderIdType.msisdn;
      case 'email':
        return AccountHolderIdType.email;
      case 'alias':
        return AccountHolderIdType.alias;
      case 'id':
        return AccountHolderIdType.id;
      case 'unknown':
        return AccountHolderIdType.unknown;
      default:
        return AccountHolderIdType.values[4];
    }
  }

  @override
  dynamic encode(AccountHolderIdType self) {
    switch (self) {
      case AccountHolderIdType.msisdn:
        return 'MSISDN';
      case AccountHolderIdType.email:
        return 'email';
      case AccountHolderIdType.alias:
        return 'alias';
      case AccountHolderIdType.id:
        return 'id';
      case AccountHolderIdType.unknown:
        return 'unknown';
    }
  }
}

extension AccountHolderIdTypeMapperExtension on AccountHolderIdType {
  dynamic toValue() {
    AccountHolderIdTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AccountHolderIdType>(this);
  }
}

