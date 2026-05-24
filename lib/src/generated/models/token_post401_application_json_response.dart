// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'token_post401_application_json_response.mapper.dart';

@MappableClass()
class TokenPost401ApplicationJsonResponse
    with TokenPost401ApplicationJsonResponseMappable {
  const TokenPost401ApplicationJsonResponse({this.error});

  /// An error code.
  final String? error;

  static TokenPost401ApplicationJsonResponse fromJson(
    Map<String, dynamic> json,
  ) => TokenPost401ApplicationJsonResponseMapper.ensureInitialized()
      .decodeMap<TokenPost401ApplicationJsonResponse>(json);
}
