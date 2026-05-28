// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
  /// Full mailing address, formatted for display or use on a mailing label. This field may contain multiple lines, separated by newlines.
  final String? formatted;
  /// Full street Address component, which may include house number, street name, Post Office Box, and multi-line extended street Address information.
  @MappableField(key: 'street_address')
  final String? streetAddress;
  /// City or locality component.
  final String? locality;
  /// State, province, prefecture, or region component.
  final String? region;
  /// Zip code or postal code component.
  @MappableField(key: 'postal_code')
  final String? postalCode;
  /// Country name component.
  final String? country;


  static Address fromJson(Map<String, dynamic> json) => AddressMapper.ensureInitialized().decodeMap<Address>(json);

}

