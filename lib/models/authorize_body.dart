// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'access_type.dart';

part 'authorize_body.mapper.dart';

@MappableClass()
class AuthorizeBody with AuthorizeBodyMappable {

  const AuthorizeBody({
    required this.loginHint,
    required this.scope,
    required this.accessType,
  });
  @MappableField(key: 'login_hint')
  final String loginHint;
  final String scope;
  @MappableField(key: 'access_type')
  final AccessType accessType;


  static AuthorizeBody fromJson(Map<String, dynamic> json) => AuthorizeBodyMapper.ensureInitialized().decodeMap<AuthorizeBody>(json);
}
