---
name: mtn-momo-collections
description: Collections API (requestToPay, payment collection, transaction status polling) integration for MTN MoMo SDK. Triggers when initiating payments, requesting money from subscribers, or checking collection transaction status.
---

# MTN MoMo SDK Collections Skill

Integrates USSD Push payment collection using the MTN Mobile Money Collections API.

## Core Architecture

- **Dedicated Instance**: Instantiate a distinct `MtnMomo` client for Collections to maintain an isolated token cache in `TokenManager` and avoid authentication conflicts with Disbursements or Remittances.
- **Automated Plumbing**: `MomoInterceptor` automatically manages OAuth2 token fetching, `Ocp-Apim-Subscription-Key`, and `X-Target-Environment` header injection for all outbound requests.

## Execution Steps

### Step 1: Reference Identification
Generate a unique UUID v4 string to serve as `xReferenceId` for request tracking.
- **Completion Criterion**: `referenceUuid` is a valid, unique UUID v4 string.

### Step 2: Payload Construction & Dispatch
Construct a `RequestToPay` model and call `momo.collection.requesttoPay`.
- **Completion Criterion**: Request succeeds with HTTP 202 status (no exception thrown), signifying the payment prompt was queued for the subscriber.

### Step 3: Status Polling
Poll payment status using `momo.collection.requesttoPayTransactionStatus(referenceId: referenceUuid)` until a terminal state is returned.
- **Completion Criterion**: `status.status` evaluates to `SUCCESSFUL`, `FAILED`, or `REJECTED`, or an explicit `MtnMomoTransactionException` is caught.

## Code Reference

```dart
import 'package:uuid/uuid.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';

// 1. Dedicated Client Setup
final collectionsMomo = MtnMomo(
  baseUrl: 'https://sandbox.momodeveloper.mtn.com',
  subscriptionKey: '<your-subscription-key>',
  userId: '<sandbox-user-id>',
  apiKey: '<sandbox-api-key>',
  targetEnvironment: 'sandbox',
);

// 2. Transaction Dispatch
final referenceUuid = const Uuid().v4();
final request = RequestToPay(
  amount: '5000',
  currency: 'EUR',
  externalId: 'INV_001',
  payer: const Party(partyIdType: PartyPartyIdType.msisdn, partyId: '256712345678'),
  payerMessage: 'Subscription renewal',
  payeeNote: 'Thank you',
);

await collectionsMomo.collection.requesttoPay(
  xReferenceId: referenceUuid,
  body: request,
);

// 3. Status Polling
final status = await collectionsMomo.collection.requesttoPayTransactionStatus(
  referenceId: referenceUuid,
);
```

## Exception Handling

Wrap collection calls in explicit exception blocks to handle business logic and network failures:

```dart
try {
  await collectionsMomo.collection.requesttoPay(xReferenceId: referenceUuid, body: request);
} on MtnMomoTransactionException catch (e) {
  // Parsed business failure (e.g. MtnMomoErrorCode.payerLimitReached, MtnMomoErrorCode.notEnoughFunds)
  switch (e.errorCode) {
    case MtnMomoErrorCode.notEnoughFunds:
      // Handle insufficient subscriber balance
      break;
    case MtnMomoErrorCode.approvalRejected:
      // Handle subscriber USSD rejection
      break;
    default:
      break;
  }
} on MtnMomoAuthException {
  // Handle invalid subscription key or API credentials
} on MtnMomoNetworkException {
  // Handle connection timeouts or socket failures
}
```
