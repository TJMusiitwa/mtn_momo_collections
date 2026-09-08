---
name: mtn-momo-remittances
description: MTN MoMo Remittances (cross-border transfer, cash transfer with payer identity, status polling, account validation, balance). Triggers when sending international money transfers, initiating cash transfers with compliance identity, or checking remittance status.
---

# MTN MoMo Remittances

Send cross-border money transfers internationally, including standard transfers and cash transfers with full payer identity for compliance.

Use a dedicated `MtnMomo` instance for Remittances. Sharing one instance across products causes OAuth2 token cache collisions (401 errors). See `GEMINI.md` for the full architecture rationale.

## Execution Steps

### Step 1: Standard Remittance Transfer (optional branch)
Generate a UUID v4 for `xReferenceId`, construct a `Transfer` model, and call `momo.remittance.transfer`. Poll with `momo.remittance.getTransferStatus`.
- **Completion Criterion**: transfer call returns without exception (HTTP 202) and `getTransferStatus` returns `SUCCESSFUL` or `FAILED`.

### Step 2: Cross-Border Cash Transfer with Payer Identity (optional branch)
Generate a UUID v4 for `xReferenceId`, construct a `CashTransfer` model with origination details and payer identification fields, and call `momo.remittance.cashTransfer`. Poll with `momo.remittance.getCashTransferStatus`.
- **Completion Criterion**: cash transfer call returns without exception (HTTP 202) and `getCashTransferStatus` returns a terminal state.

## Code Reference

```dart
import 'package:uuid/uuid.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';

final momo = MtnMomo(
  baseUrl: 'https://sandbox.momodeveloper.mtn.com',
  subscriptionKey: '<your-remittances-subscription-key>',
  userId: '<sandbox-user-id>',
  apiKey: '<sandbox-api-key>',
  targetEnvironment: 'sandbox',
);

// 1. Standard remittance transfer
final ref = const Uuid().v4();
await momo.remittance.transfer(
  xReferenceId: ref,
  body: Transfer(
    amount: '1000',
    currency: 'EUR',
    externalId: 'REM_INV_20241',
    payee: const Party(partyIdType: PartyPartyIdType.msisdn, partyId: '256712987654'),
    payerMessage: 'Family support',
    payeeNote: 'Remittance received',
  ),
);
final status = await momo.remittance.getTransferStatus(referenceId: ref);

// 2. Cross-border cash transfer with full payer identity
final cashRef = const Uuid().v4();
await momo.remittance.cashTransfer(
  xReferenceId: cashRef,
  body: CashTransfer(
    amount: '1000',
    currency: 'EUR',
    externalId: 'CASH_REM_441',
    payee: const Party(partyIdType: PartyPartyIdType.msisdn, partyId: '256712987654'),
    orginatingCountry: 'SE',
    originalAmount: '12000',
    originalCurrency: 'SEK',
    payerMessage: 'Cross-border remittance',
    payeeNote: 'Cash received',
    payerIdentificationType: CashTransferPayerIdentificationType.pass,
    payerIdentificationNumber: 'AB123456',
    payerFirstName: 'Erik',
    payerSurName: 'Andersson',
    payerLanguageCode: 'sv',
    payerEmail: 'erik@example.se',
    payerMsisdn: '46701234567',
    payerGender: 'M',
  ),
);
final cashStatus = await momo.remittance.getCashTransferStatus(referenceId: cashRef);
```

## Other Available Operations

| Method | Purpose |
| :--- | :--- |
| `getAccountBalance` | Check merchant remittances wallet balance |
| `validateAccountHolderStatus` | Verify recipient MSISDN is registered and active |
| `getBasicUserinfo` | Retrieve personal info of an account holder (no consent needed) |
| `getAccountBalanceInSpecificCurrency` | Balance in a specific ISO4217 currency |

## Error Handling

See `skills/_shared/error_handling.md` for the full exception hierarchy, error code table, and catch-flow template.
