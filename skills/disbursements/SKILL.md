# MTN MoMo SDK Disbursements Skill
---
name: mtn-momo-disbursements
description: Provides guidance for using the Disbursements (Transfer) API via the MTN MoMo SDK.
---
## Core Concepts
- Use a dedicated `MomoCollections` instance for Disbursements (separate from Collections).
- Follow *Product Token Isolation* to avoid token collisions.
- Ensure sandbox user and API key are provisioned before transfers.

## Typical Flow
1. **Create a unique `xReferenceId`** (UUID v4) for the transfer.
2. **Build a `Transfer` object** with amount, currency, payee, and optional notes.
3. **Call `momo.disbursements.transfer`** with the reference id and body.
4. **Poll the transfer status** using `momo.disbursements.getTransferStatus` until completion.

## Example Code
```dart
final disbursementsMomo = MomoCollections(
  baseUrl: 'https://sandbox.momodeveloper.mtn.com',
  subscriptionKey: '<your-subscription-key>',
  userId: '<sandbox-user-id>',
  apiKey: '<sandbox-api-key>',
  targetEnvironment: 'sandbox',
);

final transferUuid = const Uuid().v4();
final transfer = Transfer(
  amount: '12000',
  currency: 'EUR',
  externalId: 'DISB_SAL_001',
  payee: const Party(partyIdType: PartyPartyIdType.msisdn, partyId: '256712345679'),
  payerMessage: 'Monthly Salary',
  payeeNote: 'Salary for August',
);
await disbursementsMomo.disbursements.transfer(
  xReferenceId: transferUuid,
  body: transfer,
);
// Poll status
final status = await disbursementsMomo.disbursements.getTransferStatus(referenceId: transferUuid);
print('Transfer status: ${status.status}');
```
## Refunds (Optional)
```dart
await disbursementsMomo.disbursements.refund(
  xReferenceId: refundUuid,
  body: RefundTransfer(transferId: originalTransferId, amount: '12000', currency: 'EUR'),
);
```
## Error Handling
```dart
try {
  await disbursementsMomo.disbursements.transfer(...);
} on MtnMomoTransactionException catch (e) {
  // Business errors like payeeNotFound, insufficient funds, etc.
  if (e.errorCode == MtnMomoErrorCode.payeeNotFound) {
    // handle missing payee
  }
} on MtnMomoAuthException {
  // Invalid credentials
}
```
## Notes
- The SDK automatically injects OAuth2 token; no manual header handling.
- The `xReferenceId` header is required; the SDK adds it if omitted.
---
