---
name: mtn-momo-disbursements
description: Disbursements API (transfer, payouts, refunds, transfer status polling) integration for MTN MoMo SDK. Triggers when executing payouts, sending funds, issuing refunds, or checking transfer status.
---

# MTN MoMo SDK Disbursements Skill

Integrates B2C payout transfers and refunds using the MTN Mobile Money Disbursements API.

## Core Architecture

- **Dedicated Instance**: Instantiate a distinct `MtnMomo` client for Disbursements to maintain an isolated token cache in `TokenManager` and avoid authentication conflicts with Collections or Remittances.
- **Automated Plumbing**: `MomoInterceptor` automatically manages OAuth2 token fetching, `Ocp-Apim-Subscription-Key`, and `X-Target-Environment` header injection for all outbound requests.

## Execution Steps

### Step 1: Reference Identification
Generate a unique UUID v4 string to serve as `xReferenceId` for transfer tracking.
- **Completion Criterion**: `transferUuid` is a valid, unique UUID v4 string.

### Step 2: Transfer Payload Construction & Dispatch
Construct a `Transfer` model and call `momo.disbursements.transfer`.
- **Completion Criterion**: Request succeeds with HTTP 202 status (no exception thrown), indicating the transfer request was queued.

### Step 3: Status Polling
Poll transfer status using `momo.disbursements.getTransferStatus(referenceId: transferUuid)` until a terminal state is reached.
- **Completion Criterion**: `status.status` evaluates to `SUCCESSFUL` or `FAILED`, or an explicit `MtnMomoTransactionException` is caught.

### Step 4: Refund Execution (Optional)
Construct a `RefundTransfer` payload referencing the original transfer ID and invoke `momo.disbursements.refund`.
- **Completion Criterion**: Refund request completes with HTTP 202 status (no exception thrown).

## Code Reference

```dart
import 'package:uuid/uuid.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';

// 1. Dedicated Client Setup
final disbursementsMomo = MtnMomo(
  baseUrl: 'https://sandbox.momodeveloper.mtn.com',
  subscriptionKey: '<your-subscription-key>',
  userId: '<sandbox-user-id>',
  apiKey: '<sandbox-api-key>',
  targetEnvironment: 'sandbox',
);

// 2. Transfer Dispatch
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

// 3. Status Polling
final status = await disbursementsMomo.disbursements.getTransferStatus(
  referenceId: transferUuid,
);

// 4. Optional Refund Dispatch
final refundUuid = const Uuid().v4();
await disbursementsMomo.disbursements.refund(
  xReferenceId: refundUuid,
  body: RefundTransfer(
    transferId: transferUuid,
    amount: '12000',
    currency: 'EUR',
  ),
);
```

## Exception Handling

Wrap disbursement calls in explicit exception blocks to handle business logic and credential failures:

```dart
try {
  await disbursementsMomo.disbursements.transfer(xReferenceId: transferUuid, body: transfer);
} on MtnMomoTransactionException catch (e) {
  // Parsed business failure (e.g. MtnMomoErrorCode.payeeNotFound, MtnMomoErrorCode.notEnoughFunds)
  switch (e.errorCode) {
    case MtnMomoErrorCode.payeeNotFound:
      // Handle invalid or unregistered payee MSISDN
      break;
    case MtnMomoErrorCode.notEnoughFunds:
      // Handle insufficient merchant account balance
      break;
    default:
      break;
  }
} on MtnMomoAuthException {
  // Handle invalid subscription key or API credentials
} on MtnMomoNetworkException {
  // Handle connection timeouts or DNS resolution failures
}
```
