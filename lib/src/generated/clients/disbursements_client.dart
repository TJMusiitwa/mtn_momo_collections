// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/access_type.dart';
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
  factory DisbursementsClient(Dio dio, {String? baseUrl}) = _DisbursementsClient;

  /// GetAccountBalance.
  ///
  /// Get the balance of own account.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/account/balance')
  Future<Balance> getAccountBalance({
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
  });

  /// ValidateAccountHolderStatus.
  ///
  /// Operation is used  to check if an account holder is registered and active in the system.
  ///
  /// [accountHolderId] - The AccountHolder number. Validated according to the AccountHolderID type. <br> MSISDN - Mobile Number validated according to ITU-T E.164. Validated with IsMSISDN<br> EMAIL - Validated to be a valid e-mail format. Validated with IsEmail.
  ///
  /// [accountHolderIdType] - Specifies the type of the AccountHolderID. Allowed values [msisdn, email].
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active')
  Future<void> validateAccountHolderStatus({
    @Path('accountHolderId') required String accountHolderId,
    @Path('accountHolderIdType') required String accountHolderIdType,
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
  });

  /// GetTransferStatus.
  ///
  /// This operation is used to get the status of a transfer. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the Transfer.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/transfer/{referenceId}')
  Future<TransferResult> getTransferStatus({
    @Path('referenceId') required String referenceId,
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
  });

  /// GetBasicUserinfo.
  ///
  /// This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
  ///
  /// [accountHolderIdType] - Type of account holder identity passed in accountHolderId path param.Possible values:MSISDN Email AliasID (account ID).
  ///
  /// [accountHolderId] - string.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/basicuserinfo')
  Future<BasicUserInfoJsonResponse> getBasicUserinfo({
    @Path('accountHolderId') required String accountHolderId,
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
    @Path('accountHolderIdType') required AccountHolderIdType accountHolderIdType,
  });

  /// bc-authorize.
  ///
  /// This operation is used to claim a consent by the account holder for the requested scopes.
  ///
  /// [authorization] - Basic authentication header containing API user ID and API key. Should be sent in as B64 encoded.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  ///
  /// [xCallbackUrl] - URL to the server where the callback should be sent.
  @FormUrlEncoded()
  @POST('/v1_0/bc-authorize')
  Future<BcauthorizeResponse> bcAuthorize({
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Part(name: 'scope') String? scope,
    @Part(name: 'login_hint') String? loginHint,
    @Part(name: 'access_type') AccessType? accessType,
    @Part(name: 'consent_valid_in') int? consentValidIn,
    @Part(name: 'client_notification_token') String? clientNotificationToken,
    @Part(name: 'scope_instruction') String? scopeInstruction,
  });

  /// GetAccountBalanceInSpecificCurrency.
  ///
  /// Get the balance of own account. Currency parameter passed in GET.
  ///
  /// [currency] - Should be in ISO4217 Currency.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/account/balance/{currency}')
  Future<Balance> getAccountBalanceInSpecificCurrency({
    @Path('currency') required String currency,
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
  });

  /// Deposit-V1.
  ///
  /// deposit operation is used to deposit an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /deposit/\{referenceId\}.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - (POST Method)URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created ‘request-to-pay’ transaction. This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v1_0/deposit')
  Future<void> depositV1({
    @Header('Authorization') String? authorization,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Header('X-Reference-Id') String? xReferenceId,
    @Header('X-Target-Environment') String? xTargetEnvironment,
    @Body() Transfer? transfer,
  });

  /// Deposit-V2.
  ///
  /// deposit operation is used to deposit an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /deposit/\{referenceId\}.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - (PUT Method)URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created ‘request-to-pay’ transaction. This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v2_0/deposit')
  Future<void> depositV2({
    @Header('Authorization') String? authorization,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Header('X-Reference-Id') String? xReferenceId,
    @Header('X-Target-Environment') String? xTargetEnvironment,
    @Body() Transfer? transfer,
  });

  /// GetDepositStatus.
  ///
  /// This operation is used to get the status of a deposit. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the Deposit.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/deposit/{referenceId}')
  Future<TransferResult> getDepositStatus({
    @Path('referenceId') required String referenceId,
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
  });

  /// Refund-V1.
  ///
  /// refund operation is used to refund an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /refund/\{referenceId\}.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - (POST Method)URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID.  This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v1_0/refund')
  Future<void> refundV1({
    @Header('Authorization') String? authorization,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Header('X-Reference-Id') String? xReferenceId,
    @Header('X-Target-Environment') String? xTargetEnvironment,
    @Body() Refund? refund,
  });

  /// Refund-V2.
  ///
  /// refund operation is used to refund an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /refund/\{referenceId\}.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - (PUT Method)URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID.  This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v2_0/refund')
  Future<void> refundV2({
    @Header('Authorization') String? authorization,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Header('X-Reference-Id') String? xReferenceId,
    @Header('X-Target-Environment') String? xTargetEnvironment,
    @Body() Refund? refund,
  });

  /// GetRefundStatus.
  ///
  /// This operation is used to get the status of a refund. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the Refund.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/refund/{referenceId}')
  Future<RefundResult> getRefundStatus({
    @Path('referenceId') required String referenceId,
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
  });

  /// CreateOauth2Token.
  ///
  /// This operation is used to claim a consent by the account holder for the requested scopes.
  ///
  /// [authorization] - Basic authentication header containing API user ID and API key. Should be sent in as B64 encoded.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @FormUrlEncoded()
  @POST('/oauth2/token/')
  Future<Oauth2TokenResponse> createOauth2Token({
    @Header('Authorization') required String authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
    @Part(name: 'grant_type') String? grantType,
    @Part(name: 'auth_req_id') String? authReqId,
    @Part(name: 'refresh_token') String? refreshToken,
  });

  /// GetUserInfoWithConsent.
  ///
  /// This operation is used to claim a consent by the account holder for the requested scopes.
  ///
  /// [authorization] - Bearer Token. Replace with a valid oauth2 token received from oauth2 token endpoint in Wallet Platform.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/oauth2/v1_0/userinfo')
  Future<ConsentkycResponse> getUserInfoWithConsent({
    @Header('Authorization') String? authorization,
    @Header('X-Target-Environment') String? xTargetEnvironment,
  });

  /// CreateAccessToken.
  ///
  /// This operation is used to create an access token which can then be used to authorize and authenticate towards the other end-points of the API.
  ///
  /// [authorization] - Basic authentication header containing API user ID and API key. Should be sent in as B64 encoded.
  @POST('/token/')
  Future<TokenPost200ApplicationJsonResponse> createAccessToken({
    @Header('Authorization') required String authorization,
  });

  /// Transfer.
  ///
  /// Transfer operation is used to transfer an amount from the own account to a payee account.<br> Status of the transaction can validated by using the GET /transfer/\{referenceId\}.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created request to pay transaction. This ID is used, for example validating the status of the request. ‘Universal Unique ID’ for the transaction generated using UUID version 4.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v1_0/transfer')
  Future<void> transfer({
    @Header('Authorization') String? authorization,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Header('X-Reference-Id') String? xReferenceId,
    @Header('X-Target-Environment') String? xTargetEnvironment,
    @Body() Transfer? transfer,
  });
}
