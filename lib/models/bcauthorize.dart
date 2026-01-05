// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'bcauthorize_access_type.dart';

part 'bcauthorize.mapper.dart';

@MappableClass()
class Bcauthorize with BcauthorizeMappable {

  const Bcauthorize({
    this.scope,
    this.loginHint,
    this.accessType,
    this.consentValidIn,
    this.clientNotificationToken,
    this.scopeInstruction,
  });
  final String? scope;
  @MappableField(key: 'login_hint')
  final String? loginHint;
  @MappableField(key: 'access_type')
  final BcauthorizeAccessType? accessType;
  @MappableField(key: 'consent_valid_in')
  final int? consentValidIn;
  @MappableField(key: 'client_notification_token')
  final String? clientNotificationToken;
  @MappableField(key: 'scope_instruction')
  final String? scopeInstruction;


  static Bcauthorize fromJson(Map<String, dynamic> json) => BcauthorizeMapper.ensureInitialized().decodeMap<Bcauthorize>(json);
}
