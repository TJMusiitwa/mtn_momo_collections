## MTN MOMO COLLECTIONS

[![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A Dart package for integrating with MTN Mobile Money Collections API, enabling seamless mobile money transactions across African markets.

**Disclaimer:** This is an unofficial package. It is not affiliated with, endorsed by, or in any way officially connected with MTN Group or any of its subsidiaries. This package is provided as-is, and the developers are not responsible for any issues that may arise from its use.

## Features

🌍 **Multi-Country Support** - Operates in all MTN Mobile Money markets including Uganda, Ghana, Cameroon, and more

🛠 **Core Functionalities**:
- Sandbox environment provisioning
- Account balance checks
- Payment request initiation
- Transaction status verification
- Account holder validation
- Collections operations management

🔒 **Security**:
- Automatic header validation
- Secure token handling
- Encrypted communication
- Error handling for API limitations

⚡ **Efficiency**:
- Pre-built API models
- Automatic request retries
- Rate limiting handling
- Comprehensive logging

## Getting Started

### Prerequisites
- Dart 3.0+ or Flutter 3.10+
- MTN Developer Account ([Sign up](https://momodeveloper.mtn.com))
- Valid API subscription key

### Installation
Add to your `pubspec.yaml`:
```yaml
dependencies:
  mtn_momo_collections: ^0.1.0
  dio: ^5.0.0
```

## Usage

### Initialization
```dart
import 'package:dio/dio.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'https://sandbox.momodeveloper.mtn.com',
  headers: {
    'Ocp-Apim-Subscription-Key': 'YOUR_SUBSCRIPTION_KEY',
  },
));

final collectionsClient = CollectionClient(dio);
```

### Check Account Balance
```dart
try {
  final balance = await collectionsClient.getAccountBalance(
    authorization: 'Bearer YOUR_ACCESS_TOKEN',
    xTargetEnvironment: 'sandbox',
  );
  print('Available Balance: ${balance.availableBalance}');
} catch (e) {
  print('Balance check failed: ${e.toString()}');
}
```

### Create Payment Request
```dart
final paymentRequest = RequestToPay(
  amount: '1500',
  currency: 'UGX',
  externalId: 'TX_${DateTime.now().millisecondsSinceEpoch}',
  payer: Payer(
    partyIdType: 'MSISDN',
    partyId: '256772123456',
  ),
  payerMessage: 'School Fees Payment',
  payeeNote: 'Thank you for your payment',
);

await collectionsClient.requesttoPay(
  authorization: 'Bearer YOUR_ACCESS_TOKEN',
  xReferenceId: 'UNIQUE_REFERENCE_ID',
  xTargetEnvironment: 'sandbox',
  requestToPay: paymentRequest,
);
```

### Validate Account Holder
```dart
final isValid = await collectionsClient.validateAccountHolderStatus(
  accountHolderId: '256772123456',
  accountHolderIdType: 'msisdn',
  authorization: 'Bearer YOUR_ACCESS_TOKEN',
  xTargetEnvironment: 'sandbox',
);

print('Account validation result: ${isValid ? "Valid" : "Invalid"}');
```

### Check Account Balance
```dart
try {
  final balance = await collectionsClient.getAccountBalance(
    authorization: 'Bearer YOUR_ACCESS_TOKEN',
    xTargetEnvironment: 'sandbox',
  );
  print('Available Balance: ${balance.availableBalance}');
} catch (e) {
  print('Balance check failed: ${e.toString()}');
}
```

### Create Payment Request
```dart
final paymentRequest = RequestToPay(
  amount: '1500',
  currency: 'UGX',
  externalId: 'TX_${DateTime.now().millisecondsSinceEpoch}',
  payer: Payer(
    partyIdType: 'MSISDN',
    partyId: '256772123456',
  ),
  payerMessage: 'School Fees Payment',
  payeeNote: 'Thank you for your payment',
);

await collectionsClient.requesttoPay(
  authorization: 'Bearer YOUR_ACCESS_TOKEN',
  xReferenceId: 'UNIQUE_REFERENCE_ID',
  xTargetEnvironment: 'sandbox',
  requestToPay: paymentRequest,
);
```

## Configuration
### Environment Setup
1. Obtain credentials from [MTN Developer Portal](https://momodeveloper.mtn.com)
2. Choose target country environment
3. Set appropriate base URLs:
   - Sandbox: `https://sandbox.momodeveloper.mtn.com`
   - Production: `https://momodeveloper.mtn.com`

## Additional Resources

- [MTN API Documentation](https://momodeveloper.mtn.com/api-documentation)
- [Sandbox Guide](https://momodeveloper.mtn.com/api-documentation/getting-started)
- [Error Codes Reference](https://momodeveloper.mtn.com/api-documentation/common-error)   