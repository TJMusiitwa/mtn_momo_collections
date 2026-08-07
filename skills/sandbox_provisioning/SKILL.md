---
name: mtn-momo-sandbox-provisioning
description: Sandbox API user creation and API key provisioning for testing MTN MoMo SDK. Triggers when setting up test environments, registering sandbox user credentials, or generating sandbox API keys.
---

# MTN MoMo SDK Sandbox Provisioning Skill

Programmatically provisions sandbox API Users and generates API Keys required for authentication in the MTN Mobile Money Sandbox environment.

## Core Architecture

- **Dynamic Credentials**: The MTN MoMo Sandbox requires dynamically provisioned API Users and API Keys before Collections, Disbursements, or Remittances clients can authenticate.
- **Direct Provisioning Client**: Use `SandboxProvisioningClient` with a raw Dio instance containing your `Ocp-Apim-Subscription-Key`.

## Execution Steps

### Step 1: Base HTTP Client Setup
Initialize a `Dio` instance configured with the `Ocp-Apim-Subscription-Key` and base URL.
- **Completion Criterion**: `Dio` instance created with required subscription key header.

### Step 2: User Reference Generation
Generate a UUID v4 string to serve as `xReferenceId` for the new sandbox API user.
- **Completion Criterion**: `userUuid` is a valid UUID v4 string.

### Step 3: API User Registration
Instantiate `SandboxProvisioningClient` and call `postV10Apiuser`.
- **Completion Criterion**: HTTP 201 Created response returned without exception.

### Step 4: Infrastructure Propagation Delay
Execute a brief delay (`Future.delayed(const Duration(seconds: 2))`).
- **Completion Criterion**: Delay completes, ensuring sandbox infrastructure propagates the newly created user record.

### Step 5: API Key Generation
Call `postV10ApiuserApikey(xReferenceId: userUuid)` to obtain the API key.
- **Completion Criterion**: `apiKeyResult.apiKey` returns a non-empty string.

### Step 6: SDK Client Instantiation
Instantiate `MtnMomo` with the provisioned `userUuid` and `apiKey`.
- **Completion Criterion**: Operational `MtnMomo` instance ready for Collections, Disbursements, or Remittances calls.

## Code Reference

```dart
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';

Future<MtnMomo> createSandboxClient({
  required String subscriptionKey,
  String baseUrl = 'https://sandbox.momodeveloper.mtn.com',
}) async {
  // Step 1: Raw Dio client with subscription key
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Ocp-Apim-Subscription-Key': subscriptionKey,
      'Content-Type': 'application/json',
    },
  ));

  // Step 2 & 3: Provision Sandbox API User
  final provisioner = SandboxProvisioningClient(dio);
  final userUuid = const Uuid().v4();

  await provisioner.postV10Apiuser(
    xReferenceId: userUuid,
    apiUser: const ApiUser(providerCallbackHost: 'example.com'),
  );

  // Step 4: Propagation delay
  await Future.delayed(const Duration(seconds: 2));

  // Step 5: Generate API Key
  final apiKeyResult = await provisioner.postV10ApiuserApikey(
    xReferenceId: userUuid,
  );

  // Step 6: Initialize SDK Client
  return MtnMomo(
    baseUrl: baseUrl,
    subscriptionKey: subscriptionKey,
    userId: userUuid,
    apiKey: apiKeyResult.apiKey,
    targetEnvironment: 'sandbox',
  );
}
```

## Exception Handling

Wrap provisioning logic in explicit `MtnMomoException` catch blocks:

```dart
try {
  final momoClient = await createSandboxClient(subscriptionKey: 'your-sub-key');
} on MtnMomoAuthException {
  // Invalid subscription key provided
} on MtnMomoNetworkException {
  // Network connectivity failure during user/key provisioning
} on MtnMomoException catch (e) {
  // General provisioning error
}
```
