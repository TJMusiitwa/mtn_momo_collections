// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/account_holder_id_type.dart';
import '../models/balance.dart';
import '../models/basic_user_info_json_response.dart';
import '../models/bcauthorize_response.dart';
import '../models/consentkyc_response.dart';
import '../models/oauth2_token_response.dart';
import '../models/refund.dart';
import '../models/refund_result.dart';
import '../models/token_post200_application_json_response.dart';
import '../models/transfer.dart';
import '../models/transfer_result.dart';

part 'disbursements_client.g.dart';

@RestApi()
abstract class DisbursementsClient {
  factory DisbursementsClient(Dio dio, {String? baseUrl}) =
      _DisbursementsClient;

  /// GetAccountBalance.
  ///
  /// Get the balance of own account.
  @GET('/v1_0/account/balance')
  Future<Balance> getAccountBalance();

  /// ValidateAccountHolderStatus.
  ///
  /// Operation is used  to check if an account holder is registered and active in the system.
  ///
  /// [accountHolderId] - The AccountHolder number. Validated according to the AccountHolderID type. <br> MSISDN - Mobile Number validated according to ITU-T E.164. Validated with IsMSISDN<br> EMAIL - Validated to be a valid e-mail format. Validated with IsEmail.
  ///
  /// [accountHolderIdType] - Specifies the type of the AccountHolderID. Allowed values [msisdn, email].
  @GET('/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active')
  Future<void> validateAccountHolderStatus({
    @Path('accountHolderId') required String accountHolderId,
    @Path('accountHolderIdType') required String accountHolderIdType,
  });

  /// GetTransferStatus.
  ///
  /// This operation is used to get the status of a transfer. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the Transfer.
  @GET('/v1_0/transfer/{referenceId}')
  Future<TransferResult> getTransferStatus({
    @Path('referenceId') required String referenceId,
  });

  /// GetBasicUserinfo.
  ///
  /// This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
  ///
  /// [accountHolderIdType] - Type of account holder identity passed in accountHolderId path param.Possible values:MSISDN Email AliasID (account ID).
  ///
  /// [accountHolderId] - string.
  @GET(
    '/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/basicuserinfo',
  )
  Future<BasicUserInfoJsonResponse> getBasicUserinfo({
    @Path('accountHolderId') required String accountHolderId,
    @Path('accountHolderIdType')
    required AccountHolderIdType accountHolderIdType,
  });

  /// bc-authorize.
  ///
  /// This operation is used to claim a consent by the account holder for the requested scopes.
  ///
  /// [xCallbackUrl] - URL to the server where the callback should be sent.
  @FormUrlEncoded()
  @POST('/v1_0/bc-authorize')
  Future<BcauthorizeResponse> bcAuthorize({
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() dynamic body,
  });

  /// GetAccountBalanceInSpecificCurrency.
  ///
  /// Get the balance of own account. Currency parameter passed in GET.
  ///
  /// [currency] - Should be in ISO4217 Currency.
  @GET('/v1_0/account/balance/{currency}')
  Future<Balance> getAccountBalanceInSpecificCurrency({
    @Path('currency') required String currency,
  });

  /// Deposit-V1.
  ///
  /// deposit operation is used to deposit an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /deposit/\{referenceId\}.
  ///
  /// [xCallbackUrl] - (POST Method)URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created ‘request-to-pay’ transaction. This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  @POST('/v1_0/deposit')
  Future<void> depositV1({
    @Header('X-Reference-Id') required String xReferenceId,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() Transfer? body,
  });

  /// Deposit-V2.
  ///
  /// deposit operation is used to deposit an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /deposit/\{referenceId\}.
  ///
  /// [xCallbackUrl] - (PUT Method)URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created ‘request-to-pay’ transaction. This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  @POST('/v2_0/deposit')
  Future<void> depositV2({
    @Header('X-Reference-Id') required String xReferenceId,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() Transfer? body,
  });

  /// GetDepositStatus.
  ///
  /// This operation is used to get the status of a deposit. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the Deposit.
  @GET('/v1_0/deposit/{referenceId}')
  Future<TransferResult> getDepositStatus({
    @Path('referenceId') required String referenceId,
  });

  /// Refund-V1.
  ///
  /// refund operation is used to refund an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /refund/\{referenceId\}.
  ///
  /// [xCallbackUrl] - (POST Method)URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID.  This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  @POST('/v1_0/refund')
  Future<void> refundV1({
    @Header('X-Reference-Id') required String xReferenceId,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() Refund? body,
  });

  /// Refund-V2.
  ///
  /// refund operation is used to refund an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /refund/\{referenceId\}.
  ///
  /// [xCallbackUrl] - (PUT Method)URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID.  This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  @POST('/v2_0/refund')
  Future<void> refundV2({
    @Header('X-Reference-Id') required String xReferenceId,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() Refund? body,
  });

  /// GetRefundStatus.
  ///
  /// This operation is used to get the status of a refund. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the Refund.
  @GET('/v1_0/refund/{referenceId}')
  Future<RefundResult> getRefundStatus({
    @Path('referenceId') required String referenceId,
  });

  /// CreateOauth2Token.
  ///
  /// This operation is used to claim a consent by the account holder for the requested scopes.
  @FormUrlEncoded()
  @POST('/oauth2/token/')
  Future<Oauth2TokenResponse> createOauth2Token({@Body() dynamic body});

  /// GetUserInfoWithConsent.
  ///
  /// This operation is used to claim a consent by the account holder for the requested scopes.
  @GET('/oauth2/v1_0/userinfo')
  Future<ConsentkycResponse> getUserInfoWithConsent();

  /// CreateAccessToken.
  ///
  /// This operation is used to create an access token which can then be used to authorize and authenticate towards the other end-points of the API.
  @POST('/token/')
  Future<TokenPost200ApplicationJsonResponse> createAccessToken();

  /// Transfer.
  ///
  /// Transfer operation is used to transfer an amount from the own account to a payee account.<br> Status of the transaction can validated by using the GET /transfer/\{referenceId\}.
  ///
  /// [xCallbackUrl] - URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created request to pay transaction. This ID is used, for example validating the status of the request. ‘Universal Unique ID’ for the transaction generated using UUID version 4.
  @POST('/v1_0/transfer')
  Future<void> transfer({
    @Header('X-Reference-Id') required String xReferenceId,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() Transfer? body,
  });
}
