// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


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
  final String? sub;
  final String? name;
  @MappableField(key: 'given_name')
  final String? givenName;
  @MappableField(key: 'family_name')
  final String? familyName;
  @MappableField(key: 'middle_name')
  final String? middleName;
  final String? email;
  @MappableField(key: 'email_verified')
  final bool? emailVerified;
  final String? gender;
  final String? locale;
  @MappableField(key: 'phone_number')
  final String? phoneNumber;
  @MappableField(key: 'phone_number_verified')
  final bool? phoneNumberVerified;
  @MappableField(key: 'Address')
  final String? address;
  @MappableField(key: 'updated_at')
  final num? updatedAt;
  final String? status;
  final String? birthdate;
  @MappableField(key: 'credit_score')
  final String? creditScore;
  final bool? active;
  @MappableField(key: 'country_of_birth')
  final String? countryOfBirth;
  @MappableField(key: 'region_of_birth')
  final String? regionOfBirth;
  @MappableField(key: 'city_of_birth')
  final String? cityOfBirth;
  final String? occupation;
  @MappableField(key: 'employer_name')
  final String? employerName;
  @MappableField(key: 'identification_type')
  final String? identificationType;
  @MappableField(key: 'identification_value')
  final String? identificationValue;


  static ConsentkycResponse fromJson(Map<String, dynamic> json) => ConsentkycResponseMapper.ensureInitialized().decodeMap<ConsentkycResponse>(json);
}
