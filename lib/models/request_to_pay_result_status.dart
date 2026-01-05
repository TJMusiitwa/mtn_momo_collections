// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dart_mappable/dart_mappable.dart';

part 'request_to_pay_result_status.mapper.dart';

@MappableEnum(defaultValue: 'unknown')
enum RequestToPayResultStatus {
  @MappableValue('PENDING') 
  pending,

  @MappableValue('SUCCESSFUL') 
  successful,

  @MappableValue('FAILED') 
  failed,

  @MappableValue('unknown') 
  unknown;

}
