import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';
import 'package:uuid/uuid.dart';

/// A comprehensive example demonstrating the use of the MTN MoMo Collections API client.
///
/// This example covers the entire workflow:
/// 1. Sandbox Provisioning: Creates a new API user and API key.
/// 2. Authentication: Obtains an access token using the generated credentials (handled automatically).
/// 3. API Usage: Makes a `requestToPay` call using the access token.
///
/// To run this example, you need to provide your Ocp-Apim-Subscription-Key.
Future<void> main() async {
  // --- Configuration ---
  // Replace with your actual subscription key (this subscription key is an example and will not work)
  const subscriptionKey = '336fc06958ad400c9be4e1944fb9fe33';
  final xReferenceId = const Uuid().v4();
  const baseUrl = 'https://sandbox.momodeveloper.mtn.com';

  // --- Dio Setup for Provisioning ---
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Ocp-Apim-Subscription-Key': subscriptionKey,
      'Content-Type': 'application/json',
    },
  ));

  // --- Client Initialization for Provisioning ---
  final sandboxClient = SandboxProvisioningClient(dio);

  try {
    // --- Step 1: Sandbox Provisioning ---
    log('--- Step 1: Sandbox Provisioning ---');
    await _provisionSandboxUser(sandboxClient, xReferenceId,
        'https://webhook.site/62ac2583-cca7-4430-97dd-2bac8149f598');

    // --- Step 2: Get API Key ---
    log('--- Step 2: Get API Key ---');
    final apiKey = await _getApiKey(sandboxClient, xReferenceId);

    // --- Step 3: Initialize MomoCollections Wrapper ---
    log('--- Step 3: Initialize MomoCollections Wrapper ---');
    final momo = MomoCollections(
      baseUrl: baseUrl,
      subscriptionKey: subscriptionKey,
      userId: xReferenceId,
      apiKey: apiKey,
    );

    // --- Step 4: Make a Payment Request ---
    log('--- Step 4: Make a Payment Request ---');
    await _requestToPay(momo.collection);

    log('--- Example finished successfully! ---');
  } on DioException catch (e) {
    log('A Dio error occurred: ${e.message}');
    log('Response: ${e.response?.data}');
  } catch (e) {
    log('An unexpected error occurred: $e');
  }
}

/// Provisions a new sandbox user.
Future<void> _provisionSandboxUser(SandboxProvisioningClient client,
    String xReferenceId, String? providerCallbackHost) async {
  log('Creating API user with X-Reference-Id: $xReferenceId');
  await client.postV10Apiuser(
    xReferenceId: xReferenceId,
    apiUser: ApiUser(providerCallbackHost: providerCallbackHost),
  );
  log('API user created successfully.');
}

/// Retrieves the API key for the provisioned user.
Future<String> _getApiKey(
    SandboxProvisioningClient client, String xReferenceId) async {
  log('Retrieving API key for user: $xReferenceId');
  final response =
      await client.postV10ApiuserApikey(xReferenceId: xReferenceId);
  final apiKey = response.apiKey;
  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('Failed to retrieve API key.');
  }
  log('API key retrieved successfully: $apiKey.');
  return apiKey;
}

/// Makes a `requestToPay` call.
Future<void> _requestToPay(CollectionClient client) async {
  log('Making a request to pay...');
  final request = RequestToPay(
    amount: '100',
    currency: 'EUR',
    externalId: '123456',
    payer: Party(
      partyIdType: PartyPartyIdType.msisdn,
      partyId: '256772123456',
    ),
    payerMessage: 'Payment for services',
    payeeNote: 'Thank you!',
  );

  // No need to pass authorization, xReferenceId, or xTargetEnvironment!
  await client.requesttoPay(
    xCallbackUrl: 'https://webhook.site/callback',
    requestToPay: request,
  );
  log('Request to pay sent successfully.');
}
