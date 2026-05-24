// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
  /// An external transaction id to tie to the payment.
  final String? externalTransactionId;
  final Money? money;
  /// A customer reference for a provider. Example: +46070911111
  final String? customerReference;
  /// A service provider name. Example: Electricity Inc.
  final String? serviceProviderUserName;
  /// A coupon the user would like to redeem and use the reward as part of this payment.
  final String? couponId;
  /// Optional id of a product, used if paying for a product.
  final String? productId;
  /// Optional id of a product offering, used when paying for a particular offering of a product.
  final String? productOfferingId;
  /// A descriptive note for receiver transaction history.
  final String? receiverMessage;
  /// A descriptive note for sender transaction history.
  final String? senderNote;
  /// maxNumberOfRetries
  final int? maxNumberOfRetries;
  /// Specifies if sender charges, this is, fee and tax paid by the sender, should be included in the specified transaction amount. This means that the charges will be deducted from the transaction amount before the remaining amount is transferred to the receiver.True indicates that charges shall be included in the specified transaction amount. The default value is false, meaning that sender charges are charged on top of the transaction amount.
  final bool? includeSenderCharges;


  static CreatePayments fromJson(Map<String, dynamic> json) => CreatePaymentsMapper.ensureInitialized().decodeMap<CreatePayments>(json);

}

