// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'consentkyc_response.mapper.dart';

@MappableClass()
class ConsentkycResponse with ConsentkycResponseMappable {
  const ConsentkycResponse({
    this.sub,
    this.name,
    this.givenName,
    this.familyName,
    this.middleName,
    this.email,
    this.emailVerified,
    this.gender,
    this.locale,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.address,
    this.updatedAt,
    this.status,
    this.birthdate,
    this.creditScore,
    this.active,
    this.countryOfBirth,
    this.regionOfBirth,
    this.cityOfBirth,
    this.occupation,
    this.employerName,
    this.identificationType,
    this.identificationValue,
  });
  /// Subject - Identifier for the End-User at the Issuer.
  final String? sub;
  /// End-User's full name in displayable form including all name parts.
  final String? name;
  /// Given name(s) or first name(s) of the End-User.
  @MappableField(key: 'given_name')
  final String? givenName;
  /// Surname(s) or last name(s) of the End-User.
  @MappableField(key: 'family_name')
  final String? familyName;
  /// Middle name(s) of the End-User.
  @MappableField(key: 'middle_name')
  final String? middleName;
  /// End-User's preferred e-mail address. Its value MUST conform to the  RFC 5322 [RFC5322] Address specification syntax.
  final String? email;
  /// The response value is True if the End-User's e-mail Address has been verified;otherwise false.
  @MappableField(key: 'email_verified')
  final bool? emailVerified;
  /// End-User's gender.
  final String? gender;
  /// Preffered language.
  final String? locale;
  /// End-User's preferred telephone number
  @MappableField(key: 'phone_number')
  final String? phoneNumber;
  /// The response value is True if the End-User's phone number has been verified; otherwise false.
  @MappableField(key: 'phone_number_verified')
  final bool? phoneNumberVerified;
  /// User Address
  @MappableField(key: 'Address')
  final String? address;
  /// The time the End-User's information was last updated.
  @MappableField(key: 'updated_at')
  final num? updatedAt;
  /// Account holder status.
  final String? status;
  /// The birth date of the account holder.
  final String? birthdate;
  /// The credit score of the account holder.
  @MappableField(key: 'credit_score')
  final String? creditScore;
  /// The status of the account holder.
  final bool? active;
  /// Account holder country of birth.
  @MappableField(key: 'country_of_birth')
  final String? countryOfBirth;
  /// The birth region of the account holder.
  @MappableField(key: 'region_of_birth')
  final String? regionOfBirth;
  /// The city of birth for the account holder.
  @MappableField(key: 'city_of_birth')
  final String? cityOfBirth;
  /// Occupation of the account holder.
  final String? occupation;
  /// The name of the employer.
  @MappableField(key: 'employer_name')
  final String? employerName;
  /// Type of identification.The first non-expired identification is always chosen.
  @MappableField(key: 'identification_type')
  final String? identificationType;
  /// The value of the identification.
  @MappableField(key: 'identification_value')
  final String? identificationValue;


  static ConsentkycResponse fromJson(Map<String, dynamic> json) => ConsentkycResponseMapper.ensureInitialized().decodeMap<ConsentkycResponse>(json);

}

