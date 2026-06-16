# MTN MoMo SDK Collections Skill
---
name: mtn-momo-collections
description: Provides detailed guidance for integrating the Collections (USSD Push) API using the MTN MoMo SDK.
---
## Core Concepts
- Use a dedicated `MomoCollections` instance for Collections (do not share with Disbursements).
- Follow the *Product Token Isolation* rule to avoid token collisions.
- Provision a sandbox user and API key before making Calls.
## Typical Flow
1. **Create a unique `xReferenceId`** (UUID v4) for the transaction.
2. **Build a `RequestToPay` object** with amount, currency, payer, etc.
3. **Call `momo.collection.requesttoPay`** with the reference id and body.
4. **Poll the transaction status** using `momo.collection.requesttoPayTransactionStatus` until you receive a final status.
## Example Code
```dart
final collectionsMomo = MomoCollections(
  baseUrl: 'https://sandbox.momodeveloper.mtn.com',
  subscriptionKey: '<your-subscription-key>',
  userId: '<sandbox-user-id>',
  apiKey: '<sandbox-api-key>',
  targetEnvironment: 'sandbox',
);

final referenceUuid = const Uuid().v4();
final request = RequestToPay(
  amount: '5000',
  currency: 'EUR',
  externalId: 'INV_001',
  payer: const Party(partyIdType: PartyPartyIdType.msisdn, partyId: '256712345678'),
  payerMessage: 'Subscription renewal',
  payeeNote: 'Thank you',
);
await collectionsMomo.collection.requesttoPay(xReferenceId: referenceUuid, body: request);
// Poll status
final status = await collectionsMomo.collection.requesttoPayTransactionStatus(referenceId: referenceUuid);
print('Status: ${status.status}');
```
## Error Handling
Wrap calls in specific catch blocks:
```dart
try {
  // request to pay
} on MtnMomoTransactionException catch (e) {
  // Access e.errorCode for business errors
} on MtnMomoAuthException { /* invalid credentials */ }
```
## Notes
- The SDK automatically injects the OAuth2 token; no manual header handling needed.
- The `requesttoPay` endpoint requires the `X-Reference-Id` header; the SDK adds it if omitted.
---
