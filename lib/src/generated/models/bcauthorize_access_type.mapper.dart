// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bcauthorize_access_type.dart';

class BcauthorizeAccessTypeMapper extends EnumMapper<BcauthorizeAccessType> {
  BcauthorizeAccessTypeMapper._();

  static BcauthorizeAccessTypeMapper? _instance;
  static BcauthorizeAccessTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BcauthorizeAccessTypeMapper._());
    }
    return _instance!;
  }

  static BcauthorizeAccessType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BcauthorizeAccessType decode(dynamic value) {
    switch (value) {
      case 'online':
        return BcauthorizeAccessType.online;
      case 'offline':
        return BcauthorizeAccessType.offline;
      case 'unknown':
        return BcauthorizeAccessType.unknown;
      default:
        return BcauthorizeAccessType.values[2];
    }
  }

  @override
  dynamic encode(BcauthorizeAccessType self) {
    switch (self) {
      case BcauthorizeAccessType.online:
        return 'online';
      case BcauthorizeAccessType.offline:
        return 'offline';
      case BcauthorizeAccessType.unknown:
        return 'unknown';
    }
  }
}

extension BcauthorizeAccessTypeMapperExtension on BcauthorizeAccessType {
  dynamic toValue() {
    BcauthorizeAccessTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BcauthorizeAccessType>(this);
  }
}

