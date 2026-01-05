// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'error_reason_code.dart';

part 'error_reason.mapper.dart';

@MappableClass()
class ErrorReason with ErrorReasonMappable {

  const ErrorReason({
    this.code,
    this.message,
  });
  final ErrorReasonCode? code;
  final String? message;


  static ErrorReason fromJson(Map<String, dynamic> json) => ErrorReasonMapper.ensureInitialized().decodeMap<ErrorReason>(json);
}
