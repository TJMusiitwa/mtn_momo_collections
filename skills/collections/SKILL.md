---
name: mtn-momo-collections
description: MTN MoMo Collections (requestToPay, status polling, account validation, balance, invoices, pre-approvals). Triggers when requesting money from subscribers, polling payment status, validating payer MSISDN, or checking collection balance.
---

# MTN MoMo Collections

Request payments from customer wallets to your merchant account via USSD Push.

Use a dedicated `MtnMomo` instance for Collections. Sharing one instance across products causes OAuth2 token cache collisions (401 errors). See `GEMINI.md` for the full architecture rationale.

## Execution Steps

### Step 1: Validate Payer Account (optional but recommended)
Call `momo.collection.validateAccountHolderStatus` to confirm the subscriber MSISDN is registered and active before requesting payment.
- **Completion Criterion**: call returns without exception, confirming the account holder is active.

### Step 2: Request Payment
Generate a UUID v4 for `xReferenceId`, construct a `RequestToPay` model, and call `momo.collection.requesttoPay`.
- **Completion Criterion**: call returns without exception (HTTP 202 accepted), confirming the payment prompt was queued for the subscriber.

### Step 3: Poll Transaction Status
Call `momo.collection.requesttoPayTransactionStatus(referenceId:)` until a terminal state is returned.
- **Completion Criterion**: `status.status` is `SUCCESSFUL`, `FAILED`, or `REJECTED`, or a `MtnMomoTransactionException` is caught.

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

// 1. Validate payer
await momo.collection.validateAccountHolderStatus(
  accountHolderId: '256712345678',
  accountHolderIdType: 'msisdn',
);

// 2. Request payment
final ref = const Uuid().v4();
await momo.collection.requesttoPay(
  xReferenceId: ref,
  body: RequestToPay(
    amount: '5000',
    currency: 'EUR',
    externalId: 'INV_001',
    payer: const Party(partyIdType: PartyPartyIdType.msisdn, partyId: '256712345678'),
    payerMessage: 'Subscription renewal',
    payeeNote: 'Thank you',
  ),
);

// 3. Poll status
final status = await momo.collection.requesttoPayTransactionStatus(referenceId: ref);
```

## Other Available Operations

| Method | Purpose |
| :--- | :--- |
| `getAccountBalance` | Check merchant collection wallet balance |
| `requestToWithdrawV1` / `requestToWithdrawV2` | Request a cash-out withdrawal from a subscriber |
| `requestToWithdrawTransactionStatus` | Poll withdrawal status |
| `createInvoice` / `getInvoiceStatus` / `cancelInvoice` | Create and manage invoices |
| `preApproval` / `getPreApprovalStatus` / `cancelPreApproval` | Manage pre-approved payments |
| `getApprovedPreApprovals` | List approved pre-approvals for an account holder |
| `createPayments` / `getPaymentStatus` | Partner gateway payments (external bills, airtime) |
| `requesttoPayDeliveryNotification` | Send additional notification to end user |

## Error Handling

See `skills/_shared/error_handling.md` for the full exception hierarchy, error code table, and catch-flow template.
