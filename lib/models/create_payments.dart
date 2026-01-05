// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import


import 'package:dart_mappable/dart_mappable.dart';

import 'money.dart';

part 'create_payments.mapper.dart';

@MappableClass()
class CreatePayments with CreatePaymentsMappable {

  const CreatePayments({
    this.externalTransactionId,
    this.money,
    this.customerReference,
    this.serviceProviderUserName,
    this.couponId,
    this.productId,
    this.productOfferingId,
    this.receiverMessage,
    this.senderNote,
    this.maxNumberOfRetries,
    this.includeSenderCharges,
  });
  final String? externalTransactionId;
  final Money? money;
  final String? customerReference;
  final String? serviceProviderUserName;
  final String? couponId;
  final String? productId;
  final String? productOfferingId;
  final String? receiverMessage;
  final String? senderNote;
  final int? maxNumberOfRetries;
  final bool? includeSenderCharges;


  static CreatePayments fromJson(Map<String, dynamic> json) => CreatePaymentsMapper.ensureInitialized().decodeMap<CreatePayments>(json);
}
