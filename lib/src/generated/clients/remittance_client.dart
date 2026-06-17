// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/balance.dart';
import '../models/basic_user_info_json_response.dart';
import '../models/bcauthorize_response.dart';
import '../models/cash_transfer.dart';
import '../models/cash_transfer_result.dart';
import '../models/consentkyc_response.dart';
import '../models/oauth2_token_response.dart';
import '../models/token_post200_application_json_response.dart';
import '../models/transfer.dart';
import '../models/transfer_result.dart';

part 'remittance_client.g.dart';

@RestApi()
abstract class RemittanceClient {
  factory RemittanceClient(Dio dio, {String? baseUrl}) = _RemittanceClient;

  /// GetAccountBalance.
  ///
  /// Get the balance of own account.
  @GET('/v1_0/account/balance')
  Future<Balance> getAccountBalance();

  /// ValidateAccountHolderStatus.
  ///
  /// Operation is used  to check if an account holder is registered and active in the system.
  ///
  /// [accountHolderId] - The AccountHolder number that's Validated according to the AccountHolder ID type (case Sensitive)<br> msisdn - Mobile Number validated according to ITU-T E.164. Validated with IsMSISDN <br>email - Validated to be a valid e-mail format. Validated with IsEmail.
  ///
  /// [accountHolderIdType] - Specifies the type of the party id. Allowed values [msisdn, email, party_code].
  @GET('/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active')
  Future<void> validateAccountHolderStatus({
    @Path('accountHolderId') required String accountHolderId,
    @Path('accountHolderIdType') required String accountHolderIdType,
  });

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
  /// [accountHolderMsisdn] - Bearer Authentication Token generated using CreateAccessToken API Call.
  @GET('/v1_0/accountholder/msisdn/{accountHolderMSISDN}/basicuserinfo')
  Future<BasicUserInfoJsonResponse> getBasicUserinfo({
    @Path('accountHolderMSISDN') required String accountHolderMsisdn,
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

  /// CreateOauth2Token.
  ///
  /// This operation is used to claim a consent by the account holder for the requested scopes.
  @FormUrlEncoded()
  @POST('/oauth2/token/')
  Future<Oauth2TokenResponse> createOauth2Token({
    @Body() dynamic body,
  });

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

  /// CashTransfer.
  ///
  /// Cash transfer operation is used to transfer an amount from the owner’s account to a payee account. Status of the transaction can be validated by using GET /cashtransfer/{referenceId}.
  ///
  /// [xCallbackUrl] - URL to the server where the callback should be sent, Uses PORT method.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created ‘request-to-pay’ transaction. This ID is used for e.g. validating the status of the request. Universal Unique ID for the transaction generated using UUID version 4.
  @POST('/v2_0/cashtransfer')
  Future<void> cashTransfer({
    @Header('X-Reference-Id') required String xReferenceId,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() CashTransfer? body,
  });

  /// GetCashTransferStatus.
  ///
  /// This operation is used to get the status of a transfer. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the CashTransfer.
  @GET('/v2_0/cashtransfer/{referenceId}')
  Future<CashTransferResult> getCashTransferStatus({
    @Path('referenceId') required String referenceId,
  });

  /// GetBasicUserinfo (clone).
  ///
  /// This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
  ///
  /// [accountHolderMsisdn] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// Incorrect name has been replaced. Original name: `671b099705fd58bc55c9bbca`.
  @GET('/clone-671b0/v1_0/accountholder/msisdn/{accountHolderMSISDN}/basicuserinfo')
  Future<BasicUserInfoJsonResponse> getClone671b0V10AccountholderMsisdnAccountHolderMsisdnBasicuserinfo({
    @Path('accountHolderMSISDN') required String accountHolderMsisdn,
  });

  /// GetBasicUserinfo-v3.
  ///
  /// This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
  ///
  /// [accountHolderMsisdn] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// Incorrect name has been replaced. Original name: `671b4b855d145f9b8f15e836`.
  @GET('/v1_0/accountholder/msisdn/999{accountHolderMSISDN}999/basicuserinfo')
  Future<BasicUserInfoJsonResponse> getV10AccountholderMsisdn999AccountHolderMsisdn999Basicuserinfo({
    @Path('accountHolderMSISDN') required String accountHolderMsisdn,
  });
}
