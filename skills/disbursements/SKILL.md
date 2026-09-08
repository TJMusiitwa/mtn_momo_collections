---
name: mtn-momo-disbursements
description: MTN MoMo Disbursements (transfer, deposit, refund, status polling, account validation, balance). Triggers when sending payouts to mobile wallets, depositing funds, issuing refunds, or checking transfer status.
---

# MTN MoMo Disbursements

Pay out money from your merchant account into a recipient's mobile wallet, deposit funds, and issue refunds.

Use a dedicated `MtnMomo` instance for Disbursements. Sharing one instance across products causes OAuth2 token cache collisions (401 errors). See `GEMINI.md` for the full architecture rationale.

## Execution Steps

### Step 1: Validate Payee Account (optional but recommended)
Call `momo.disbursements.validateAccountHolderStatus` to confirm the recipient MSISDN is registered and active before transferring.
- **Completion Criterion**: call returns without exception, confirming the account holder is active.

### Step 2: Transfer
Generate a UUID v4 for `xReferenceId`, construct a `Transfer` model, and call `momo.disbursements.transfer`.
- **Completion Criterion**: call returns without exception (HTTP 202 accepted), confirming the transfer was queued.

### Step 3: Poll Transfer Status
Call `momo.disbursements.getTransferStatus(referenceId:)` until a terminal state is returned.
- **Completion Criterion**: `status.status` is `SUCCESSFUL` or `FAILED`, or a `MtnMomoTransactionException` is caught.

### Step 4: Deposit (optional branch)
Call `momo.disbursements.depositV1` or `depositV2` with a `Transfer` body, then poll with `getDepositStatus`.
- **Completion Criterion**: deposit call returns without exception and `getDepositStatus` returns a terminal state.

### Step 5: Refund (optional branch)
Call `momo.disbursements.refundV1` or `refundV2` with a `Refund` body referencing the original transaction's `referenceIdToRefund`, then poll with `getRefundStatus`.
- **Completion Criterion**: refund call returns without exception and `getRefundStatus` returns a terminal state.

## Code Reference

```dart
import 'package:uuid/uuid.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';

final momo = MtnMomo(
  baseUrl: 'https://sandbox.momodeveloper.mtn.com',
  subscriptionKey: '<your-subscription-key>',
  userId: '<sandbox-user-id>',
  apiKey: '<sandbox-api-key>',
  targetEnvironment: 'sandbox',
);

// 1. Validate payee
await momo.disbursements.validateAccountHolderStatus(
  accountHolderId: '256712345679',
  accountHolderIdType: 'msisdn',
);

// 2. Transfer
final ref = const Uuid().v4();
await momo.disbursements.transfer(
  xReferenceId: ref,
  body: Transfer(
    amount: '12000',
    currency: 'EUR',
    externalId: 'DISB_SAL_001',
    payee: const Party(partyIdType: PartyPartyIdType.msisdn, partyId: '256712345679'),
    payerMessage: 'Monthly Salary',
    payeeNote: 'Salary for August',
  ),
);

// 3. Poll transfer status
final status = await momo.disbursements.getTransferStatus(referenceId: ref);

// 4. Refund (optional)
final refundRef = const Uuid().v4();
await momo.disbursements.refundV1(
  xReferenceId: refundRef,
  body: Refund(
    amount: '12000',
    currency: 'EUR',
    referenceIdToRefund: ref,
  ),
);
final refundStatus = await momo.disbursements.getRefundStatus(referenceId: refundRef);
```

## Other Available Operations

| Method | Purpose |
| :--- | :--- |
| `getAccountBalance` | Check merchant disbursements wallet balance |
| `getAccountBalanceInSpecificCurrency` | Balance in a specific ISO4217 currency |
| `depositV1` / `depositV2` / `getDepositStatus` | Deposit funds to a payee account |

## Error Handling

See `skills/_shared/error_handling.md` for the full exception hierarchy, error code table, and catch-flow template.
