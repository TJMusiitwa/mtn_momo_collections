// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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

  /// Space separated list of scopes.
  final String? scope;

  /// The identity of the account holder.
  @MappableField(key: 'login_hint')
  final String? loginHint;

  /// Value either online, or offline.
  @MappableField(key: 'access_type')
  final BcauthorizeAccessType? accessType;

  /// The validity time of the consent in secondsThis parameter can only be used together with access type offline.
  @MappableField(key: 'consent_valid_in')
  final int? consentValidIn;

  /// This token is required when the client is using Ping or Push mode.
  @MappableField(key: 'client_notification_token')
  final String? clientNotificationToken;

  /// Base64 encoded Instrcution of the financial transaction.
  @MappableField(key: 'scope_instruction')
  final String? scopeInstruction;

  static Bcauthorize fromJson(Map<String, dynamic> json) =>
      BcauthorizeMapper.ensureInitialized().decodeMap<Bcauthorize>(json);
}
