// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mtn_momo_collections/models/authorize_body.dart';
import 'package:retrofit/retrofit.dart';

import '../models/account_holder_id_type.dart';
import '../models/account_holder_id_type2.dart';
import '../models/balance.dart';
import '../models/basic_user_info_json_response.dart';
import '../models/bcauthorize_response.dart';
import '../models/consentkyc_response.dart';
import '../models/create_invoice.dart';
import '../models/create_payments.dart';
import '../models/deliverynotification.dart';
import '../models/invoice_result.dart';
import '../models/oauth2_token_response.dart';
import '../models/payment_result.dart';
import '../models/pre_approval.dart';
import '../models/pre_approval_details.dart';
import '../models/pre_approval_result.dart';
import '../models/request_to_pay.dart';
import '../models/request_to_pay_result.dart';
import '../models/token_post200_application_json_response.dart';

part 'collection_client.g.dart';

@RestApi()
abstract class CollectionClient {
  factory CollectionClient(Dio dio, {String? baseUrl}) = _CollectionClient;

  /// GetAccountBalance.
  ///
  /// Get the balance of own account.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/account/balance')
  Future<Balance> getAccountBalance();

  /// ValidateAccountHolderStatus.
  ///
  /// Operation is used  to check if an account holder is registered and active in the system.
  ///
  /// [accountHolderId] - The AccountHolder number. Validated according to the AccountHolder ID type (case Sensitive). <br> msisdn - Mobile Number validated according to ITU-T E.164. Validated with IsMSISDN<br> email - Validated to be a valid e-mail format. Validated with IsEmail.
  ///
  /// [accountHolderIdType] - Specifies the type of the AccountHolder ID. Allowed values [msisdn, email].  <br> accountHolderId should explicitly be in small letters.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active')
  Future<void> validateAccountHolderStatus({
    @Path('accountHolderId') required String accountHolderId,
    @Path('accountHolderIdType') required String accountHolderIdType,
  });

  /// RequesttoPay.
  ///
  /// This operation is used to request a payment from a consumer (Payer). The payer will be asked to authorize the payment. The transaction will be executed once the payer has authorized the payment. The requesttopay will be in status PENDING until the transaction is authorized or declined by the payer or it is timed out by the system. .
  ///  Status of the transaction can be validated by using the GET /requesttopay/\<resourceId\>.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created request to pay transaction. This ID is used, for example, validating the status of the request. ‘Universal Unique ID’ for the transaction generated using UUID version 4.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v1_0/requesttopay')
  Future<void> requesttoPay({
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() RequestToPay? requestToPay,
  });

  /// RequesttoPayTransactionStatus.
  ///
  /// This operation is used to get the status of a request to pay. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the request to pay.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/requesttopay/{referenceId}')
  Future<RequestToPayResult> requesttoPayTransactionStatus({
    @Path('referenceId') required String referenceId,
  });

  /// bc-authorize.
  ///
  /// This operation is used to claim a consent by the account holder for the requested scopes.
  ///
  /// [authorization] - Bearer Token. Replace with a valid oauth2 token received from oauth2 token endpoint in Wallet Platform.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  ///
  /// [xCallbackUrl] - URL to the server where the callback should be sent.
  @FormUrlEncoded()
  @POST('/v1_0/bc-authorize')
  Future<BcauthorizeResponse> bcAuthorize({
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() AuthorizeBody? body,
  });

  /// GetBasicUserinfo.
  ///
  /// This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
  ///
  /// [accountHolderIdType] - Type of account holder identity passed in accountHolderId path param.
  ///
  /// Possible values:.
  /// MSISDN.
  ///
  /// Email.
  ///
  /// Alias.
  ///
  /// ID (account ID).
  ///
  /// [accountHolderId] - ID of the account holder.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET(
    '/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/basicuserinfo',
  )
  Future<BasicUserInfoJsonResponse> getBasicUserinfo({
    @Path('accountHolderIdType')
    required AccountHolderIdType accountHolderIdType,
    @Path('accountHolderId') required String accountHolderId,
  });

  /// RequesttoPayDeliveryNotification.
  ///
  /// This operation is used to send additional Notification to an End User.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id used when creating the RequesttoPay.
  ///
  /// [notificationMessage] - The message to send in the delivery notification. Max              length 160.
  ///
  /// [language] - An ISO 639-1 or ISO 639-3 language code. The language is used to select the best matching notification template when sending the delivery notification to the end-user. A default value is used if not specified.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v1_0/requesttopay/{referenceId}/Deliverynotification')
  Future<void> requesttoPayDeliveryNotification({
    @Path('referenceId') required String referenceId,
    @Header('notificationMessage') required String notificationMessage,
    @Header('Language') String? language,
    @Body() Deliverynotification? deliverynotification,
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
  });

  /// RequestToWithdraw-V1.
  ///
  /// This operation is used to request a withdrawal (cash-out) from a consumer (Payer). The payer will be asked to authorize the withdrawal. The transaction will be executed once the payer has authorized the withdrawal.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - POST Callback URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created request to pay transaction. This ID is used, for example, validating the status of the request. ‘Universal Unique ID’ for the transaction generated using UUID version 4.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v1_0/requesttowithdraw')
  Future<void> requestToWithdrawV1({
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() RequestToPay? requestToPay,
  });

  /// RequestToWithdraw-V2.
  ///
  /// This operation is used to request a withdrawal (cash-out) from a consumer (Payer). The payer will be asked to authorize the withdrawal. The transaction will be executed once the payer has authorized the withdrawal.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - PUT Callback URL to the server where the callback should be sent.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created request to pay transaction. This ID is used, for example, validating the status of the request. ‘Universal Unique ID’ for the transaction generated using UUID version 4.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @POST('/v2_0/requesttowithdraw')
  Future<void> requestToWithdrawV2({
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() RequestToPay? requestToPay,
  });

  /// RequestToWithdrawTransactionStatus.
  ///
  /// This operation is used to get the status of a request to withdraw. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the RequestToWithdraw.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/requesttowithdraw/{referenceId}')
  Future<RequestToPayResult> requestToWithdrawTransactionStatus({
    @Path('referenceId') required String referenceId,
  });

  /// CreateInvoice.
  ///
  /// A merchant may use this in order to create an invoice that can be paid by an intended payer via any channel at a later stage.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - PUT Callback URL to send callback to once the invoice is completed.
  ///
  /// [xReferenceId] - Format - UUID. An id to uniquely identify the making of an invoice.
  ///
  /// [xTargetEnvironment] - The desired target environment to use that is allowed for the API user.
  @POST('/v2_0/invoice')
  Future<void> createInvoice({
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() CreateInvoice? createInvoice,
  });

  /// GetInvoiceStatus.
  ///
  /// This operation is used to get the status of an invoice. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [xReferenceId] - UUID of transaction to get result. Reference id  used when creating the Invoice.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v2_0/invoice/{x-referenceId}')
  Future<InvoiceResult> getInvoiceStatus({
    @Path('x-referenceId') required String xReferenceId,
  });

  /// CancelInvoice.
  ///
  /// This operation is used to delete an invoice. The ReferenceId is associated with the invoice to be cancelled.
  ///
  /// [referenceId] - UUID of transaction to get result. An id to uniquely identify the cancelling an Invoice.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. The desired target environment to use that is allowed for the API user.
  ///
  /// [xReferenceId] - Format - UUID. Recource ID of the created request to pay transaction. This ID is used, for example, validating the status of the request. ‘Universal Unique ID’ for the transaction generated using UUID version 4.
  ///
  /// [xCallbackUrl] - PUT Callback URL to send callback to once the invoice is completed.
  @DELETE('/v2_0/invoice/{referenceId}')
  Future<dynamic> cancelInvoice({
    @Path('referenceId') required String referenceId,
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() String? externalId,
  });

  /// PreApproval.
  ///
  /// Preapproval operation is used to create a pre-approval.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - PUT Callback URL to send callback to once the invoice is completed.
  ///
  /// [xReferenceId] - Format - UUID. An id to uniquely identify the making of an invoice.
  ///
  /// [xTargetEnvironment] - The desired target environment to use that is allowed for the API user.
  @POST('/v2_0/preapproval')
  Future<void> preApproval({
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() PreApproval? preApproval,
  });

  /// GetPreApprovalStatus.
  ///
  /// This operation is used to get the status of a pre-approval. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [referenceId] - UUID of transaction to get result. Reference id  used when creating the PreApproval.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v2_0/preapproval/{referenceId}')
  Future<PreApprovalResult> getPreApprovalStatus({
    @Path('referenceId') required String referenceId,
  });

  /// CreatePayments.
  ///
  /// Making it possible to perform payments via the partner gateway. This may be used to pay for external bills or to perform air-time top-ups.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xCallbackUrl] - PUT Callback URL to send callback to once the invoice is completed.
  ///
  /// [xReferenceId] - Format - UUID. An id to uniquely identify the making of an invoice.
  ///
  /// [xTargetEnvironment] - The desired target environment to use that is allowed for the API user.
  @POST('/v2_0/payment')
  Future<void> createPayments({
    @Header('X-Callback-Url') String? xCallbackUrl,
    @Body() CreatePayments? createPayments,
  });

  /// GetPaymentStatus.
  ///
  /// This operation is used to get the status of a Payment. X-Reference-Id that was passed in the post is used as reference to the request.
  ///
  /// [xReferenceId] - UUID of transaction to get result. Reference id  used when creating the Payment.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v2_0/payment/{x-referenceId}')
  Future<PaymentResult> getPaymentStatus({
    @Path('x-referenceId') required String xReferenceId,
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
    @Header('X-Target-Environment') required String xTargetEnvironment,
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
  Future<ConsentkycResponse> getUserInfoWithConsent();

  /// CreateAccessToken.
  ///
  /// This operation is used to create an access token which can then be used to authorize and authenticate towards the other end-points of the API.
  ///
  /// [authorization] - Basic authentication header containing API user ID and API key. Should be sent in as B64 encoded.
  @POST('/token/')
  Future<TokenPost200ApplicationJsonResponse> createAccessToken({
    @Header('Authorization') required String authorization,
  });

  /// GetApprovedPreApprovals.
  ///
  /// This operation is used to get approved pre-approvals of an account holder. Only those pre-approvals of account holder, where requesting Account Holder (Service Provider or Merchant) is the payee, are returned.
  ///
  /// [accountHolderIdType] - Specifies the type of the accountHolderId.
  ///
  /// Allowed values:.
  /// msisdn.
  /// email.
  /// id.
  /// alias.
  ///
  /// [accountHolderId] - The AccountHolderId .
  ///
  /// Validated according to the accountHolderIdType:.
  /// msisdn - Mobile Number. Validated with IsMSISDN.
  /// email - E-mail. Validated with IsEmail.
  /// id - Internal Id of Account Holder. Validated with IsLongString.
  /// alias - Alias of the party. Validated with IsAlias.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @GET('/v1_0/preapprovals/{accountHolderIdType}/{accountHolderId}')
  Future<List<PreApprovalDetails>> getApprovedPreApprovals({
    @Path('accountHolderId') required String accountHolderId,
    @Path('accountHolderIdType')
    AccountHolderIdType2 accountHolderIdType = AccountHolderIdType2.msisdn,
  });

  /// CancelPreApproval.
  ///
  /// This operation is used to cancel a pre-approval. It is possible to cancel only that preapproval which is in approved state and the requesting Account Holder (Service Provider or Merchant) is the payee.
  ///
  /// [preapprovalid] - UUID of transaction to get result. Reference id  used when creating the PreApproval.
  ///
  /// [authorization] - Bearer Authentication Token generated using CreateAccessToken API Call.
  ///
  /// [xTargetEnvironment] - The identifier of the Wallet Platform system where the transaction shall be processed. This parameter is used to route the request to the Wallet Platform system that will initiate the transaction.
  @DELETE('/v1_0/preapproval/{preapprovalid}')
  Future<void> cancelPreApproval({
    @Path('preapprovalid') required String preapprovalid,
  });
}
