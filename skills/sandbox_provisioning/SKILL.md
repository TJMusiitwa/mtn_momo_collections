---
name: mtn-momo-sandbox-provisioning
description: MTN MoMo Sandbox API user creation and API key provisioning. Triggers when setting up test environments, registering sandbox user credentials, or generating sandbox API keys.
---

# MTN MoMo Sandbox Provisioning

Programmatically provision sandbox API Users and generate API Keys required for authentication. The sandbox requires dynamically provisioned credentials before any Collections, Disbursements, or Remittances client can authenticate.

Uses `SandboxProvisioningClient` with a raw `Dio` instance (subscription key only, no OAuth2 token needed). See `GEMINI.md` for architecture details.

## Execution Steps

### Step 1: Base HTTP Client Setup
Initialize a `Dio` instance with the `Ocp-Apim-Subscription-Key` header and sandbox base URL.
- **Completion Criterion**: `Dio` instance created with the subscription key header configured.

### Step 2: API User Registration
Generate a UUID v4 for `xReferenceId`, instantiate `SandboxProvisioningClient`, and call `postV10Apiuser`.
- **Completion Criterion**: call returns without exception (HTTP 201 Created).

### Step 3: Propagation Delay
Execute a brief `Future.delayed` (2 seconds) to let the sandbox infrastructure propagate the new user record.
- **Completion Criterion**: delay completes.

### Step 4: API Key Generation
Call `postV10ApiuserApikey(xReferenceId:)` with the same UUID from Step 2.
- **Completion Criterion**: `apiKeyResult.apiKey` returns a non-empty string.

### Step 5: SDK Client Instantiation
Instantiate `MtnMomo` with the provisioned `userUuid` as `userId` and the generated `apiKey`.
- **Completion Criterion**: `MtnMomo` instance is ready for Collections, Disbursements, or Remittances calls.

## Code Reference

```dart
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';

Future<MtnMomo> createSandboxClient({
  required String subscriptionKey,
  String baseUrl = 'https://sandbox.momodeveloper.mtn.com',
}) async {
  // 1. Raw Dio client with subscription key
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Ocp-Apim-Subscription-Key': subscriptionKey,
      'Content-Type': 'application/json',
    },
  ));

  // 2. Provision Sandbox API User
  final provisioner = SandboxProvisioningClient(dio);
  final userUuid = const Uuid().v4();

  await provisioner.postV10Apiuser(
    xReferenceId: userUuid,
    apiUser: const ApiUser(providerCallbackHost: 'example.com'),
  );

  // 3. Propagation delay
  await Future.delayed(const Duration(seconds: 2));

  // 4. Generate API Key
  final apiKeyResult = await provisioner.postV10ApiuserApikey(
    xReferenceId: userUuid,
  );

  // 5. Initialize SDK Client
  return MtnMomo(
    baseUrl: baseUrl,
    subscriptionKey: subscriptionKey,
    userId: userUuid,
    apiKey: apiKeyResult.apiKey,
    targetEnvironment: 'sandbox',
  );
}
```

## Error Handling

See `skills/_shared/error_handling.md` for the full exception hierarchy, error code table, and catch-flow template.
