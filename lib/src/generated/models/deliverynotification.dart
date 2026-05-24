// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dart_mappable/dart_mappable.dart';

part 'deliverynotification.mapper.dart';

@MappableClass()
class Deliverynotification with DeliverynotificationMappable {
  const Deliverynotification({
    this.notificationMessage,
  });
  final String? notificationMessage;


  static Deliverynotification fromJson(Map<String, dynamic> json) => DeliverynotificationMapper.ensureInitialized().decodeMap<Deliverynotification>(json);

}

