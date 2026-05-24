// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'access_type.dart';

class AccessTypeMapper extends EnumMapper<AccessType> {
  AccessTypeMapper._();

  static AccessTypeMapper? _instance;
  static AccessTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccessTypeMapper._());
    }
    return _instance!;
  }

  static AccessType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AccessType decode(dynamic value) {
    switch (value) {
      case 'online':
        return AccessType.online;
      case 'offline':
        return AccessType.offline;
      case 'unknown':
        return AccessType.unknown;
      default:
        return AccessType.values[2];
    }
  }

  @override
  dynamic encode(AccessType self) {
    switch (self) {
      case AccessType.online:
        return 'online';
      case AccessType.offline:
        return 'offline';
      case AccessType.unknown:
        return 'unknown';
    }
  }
}

extension AccessTypeMapperExtension on AccessType {
  dynamic toValue() {
    AccessTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AccessType>(this);
  }
}

