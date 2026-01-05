// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'payment_server_url.dart';
import 'target_environment.dart';

part 'api_user_result.mapper.dart';

/// The API user information
@MappableClass()
class ApiUserResult with ApiUserResultMappable {

  const ApiUserResult({
    this.providerCallbackHost,
    this.paymentServerUrl,
    this.targetEnvironment,
  });
  final String? providerCallbackHost;
  final PaymentServerUrl? paymentServerUrl;
  final TargetEnvironment? targetEnvironment;


  static ApiUserResult fromJson(Map<String, dynamic> json) => ApiUserResultMapper.ensureInitialized().decodeMap<ApiUserResult>(json);
}
