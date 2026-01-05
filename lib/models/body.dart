// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'access_type.dart';

part 'body.mapper.dart';

@MappableClass()
class Body with BodyMappable {

  const Body({
    required this.loginHint,
    required this.scope,
    required this.accessType,
  });
  @MappableField(key: 'login_hint')
  final String loginHint;
  final String scope;
  @MappableField(key: 'access_type')
  final AccessType accessType;


  static Body fromJson(Map<String, dynamic> json) => BodyMapper.ensureInitialized().decodeMap<Body>(json);
}
