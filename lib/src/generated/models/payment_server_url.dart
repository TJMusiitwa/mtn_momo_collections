// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'payment_server_url.mapper.dart';

@MappableClass()
class PaymentServerUrl with PaymentServerUrlMappable {
  const PaymentServerUrl({
    this.apiKey,
  });
  /// The payment server URL
  final String? apiKey;


  static PaymentServerUrl fromJson(Map<String, dynamic> json) => PaymentServerUrlMapper.ensureInitialized().decodeMap<PaymentServerUrl>(json);

}

