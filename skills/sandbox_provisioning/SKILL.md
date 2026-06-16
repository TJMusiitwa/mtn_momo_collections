# MTN MoMo SDK Sandbox Provisioning Skill
---
name: mtn-momo-sandbox-provisioning
description: Guides developers on programmatically creating a sandbox API user and obtaining an API key using the SDK.
---
## Overview
The sandbox environment requires a dynamic API user and API key for each session. This skill describes the exact steps and provides example code.

## Steps
1. **Create a Dio client** with the `Ocp-Apim-Subscription-Key` header.
2. **Instantiate `SandboxProvisioningClient`** with the Dio instance.
3. **Generate a UUID** to use as `xReferenceId` (the sandbox user identifier).
4. **POST `/v1_0/apiuser`** to create the user.
5. **Wait for propagation** (recommended `Future.delayed(const Duration(seconds: 2))`).
6. **POST `/v1_0/apiuser/{xReferenceId}/apikey`** to retrieve the API key.
7. **Initialize `MomoCollections`** with the returned `userId` and `apiKey`.

## Example Code
```dart
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';

Future<MomoCollections> createSandboxClient({
  required String subscriptionKey,
  String baseUrl = 'https://sandbox.momodeveloper.mtn.com',
}) async {
  // 1. Dio client
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Ocp-Apim-Subscription-Key': subscriptionKey,
      'Content-Type': 'application/json',
    },
  ));

  // 2. Provisioning client
  final provisioner = SandboxProvisioningClient(dio);
  final userUuid = const Uuid().v4();

  // 3. Create API user
  await provisioner.postV10Apiuser(
    xReferenceId: userUuid,
    apiUser: ApiUser(providerCallbackHost: 'example.com'),
  );
  // 4. Allow propagation
  await Future.delayed(const Duration(seconds: 2));

  // 5. Request API key
  final apiKeyResult = await provisioner.postV10ApiuserApikey(
    xReferenceId: userUuid,
  );

  // 6. Initialize SDK client
  return MomoCollections(
    baseUrl: baseUrl,
    subscriptionKey: subscriptionKey,
    userId: userUuid,
    apiKey: apiKeyResult.apiKey,
    targetEnvironment: 'sandbox',
  );
}
```

## Error Handling
```dart
try {
  await provisioner.postV10Apiuser(...);
} on MtnMomoException catch (e) {
  // Handle network, auth, or validation errors
}
```
---
