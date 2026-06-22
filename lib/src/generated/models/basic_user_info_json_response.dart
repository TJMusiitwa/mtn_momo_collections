// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'basic_user_info_json_response.mapper.dart';

@MappableClass()
class BasicUserInfoJsonResponse with BasicUserInfoJsonResponseMappable {
  const BasicUserInfoJsonResponse({
    this.givenName,
    this.familyName,
    this.birthdate,
    this.locale,
    this.status,
  });

  /// Given name(s) or first name(s) of the End-User. Note that in some cultures, people can have multiple given names; all can be present, with the names being separated by space characters.
  @MappableField(key: 'given_name')
  final String? givenName;

  /// Surname(s) or last name(s) of the End-User. Note that in some cultures, people can have multiple family names or no family name; all can be present, with the names being separated by space characters.
  @MappableField(key: 'family_name')
  final String? familyName;

  /// Account holder birth date.
  final String? birthdate;

  /// End-User's locale, represented as a  BCP47 [RFC5646] language tag. This is typically an  ISO 639-1 Alpha-2 [ISO639�|�1] language code in lowercase and an  ISO 3166-1 Alpha-2 [ISO3166�|�1] country code in uppercase, separated by a dash. For example,  en-US or  fr-CA. As a compatibility note, some implementations have used an underscore as the separator rather than a dash, for example,  en_US; Relying Parties may choose to accept this locale syntax as well.
  final String? locale;

  /// Accountholder status.
  final String? status;

  static BasicUserInfoJsonResponse fromJson(Map<String, dynamic> json) =>
      BasicUserInfoJsonResponseMapper.ensureInitialized()
          .decodeMap<BasicUserInfoJsonResponse>(json);
}
