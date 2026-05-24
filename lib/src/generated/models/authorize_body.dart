// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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

  /// The identity of the account holder. Typically prefixed with 'ID:' followed by the MSISDN and type.
  @MappableField(key: 'login_hint')
  final String loginHint;

  /// A space separated list of scopes
  final String scope;

  /// Indicates the type of access required
  @MappableField(key: 'access_type')
  final AccessType accessType;

  static AuthorizeBody fromJson(Map<String, dynamic> json) =>
      AuthorizeBodyMapper.ensureInitialized().decodeMap<AuthorizeBody>(json);
}
