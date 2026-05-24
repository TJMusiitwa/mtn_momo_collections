// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'account_holder_id_type2.dart';

class AccountHolderIdType2Mapper extends EnumMapper<AccountHolderIdType2> {
  AccountHolderIdType2Mapper._();

  static AccountHolderIdType2Mapper? _instance;
  static AccountHolderIdType2Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountHolderIdType2Mapper._());
    }
    return _instance!;
  }

  static AccountHolderIdType2 fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AccountHolderIdType2 decode(dynamic value) {
    switch (value) {
      case 'msisdn':
        return AccountHolderIdType2.msisdn;
      case 'email':
        return AccountHolderIdType2.email;
      case 'id':
        return AccountHolderIdType2.id;
      case 'alias':
        return AccountHolderIdType2.alias;
      case 'unknown':
        return AccountHolderIdType2.unknown;
      default:
        return AccountHolderIdType2.values[4];
    }
  }

  @override
  dynamic encode(AccountHolderIdType2 self) {
    switch (self) {
      case AccountHolderIdType2.msisdn:
        return 'msisdn';
      case AccountHolderIdType2.email:
        return 'email';
      case AccountHolderIdType2.id:
        return 'id';
      case AccountHolderIdType2.alias:
        return 'alias';
      case AccountHolderIdType2.unknown:
        return 'unknown';
    }
  }
}

extension AccountHolderIdType2MapperExtension on AccountHolderIdType2 {
  dynamic toValue() {
    AccountHolderIdType2Mapper.ensureInitialized();
    return MapperContainer.globals.toValue<AccountHolderIdType2>(this);
  }
}

