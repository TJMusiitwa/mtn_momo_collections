// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

part 'address.mapper.dart';

@MappableClass()
class Address with AddressMappable {

  const Address({
    this.formatted,
    this.streetAddress,
    this.locality,
    this.region,
    this.postalCode,
    this.country,
  });
  final String? formatted;
  @MappableField(key: 'street_address')
  final String? streetAddress;
  final String? locality;
  final String? region;
  @MappableField(key: 'postal_code')
  final String? postalCode;
  final String? country;


  static Address fromJson(Map<String, dynamic> json) => AddressMapper.ensureInitialized().decodeMap<Address>(json);
}
