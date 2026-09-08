# MTN MoMo SDK Exception Handling Reference

All outbound `DioException` states are sifted through `mapDioException()` into a sealed `MtnMomoException` hierarchy. Catch from most specific to most general.

## Exception Hierarchy

| Exception | HTTP / Condition | Cause |
| :--- | :--- | :--- |
| `MtnMomoNetworkException` | No response (timeout, DNS, offline) | Connection failures, handshake timeouts |
| `MtnMomoAuthException` | 401 | Invalid subscription key, API User, or API Key |
| `MtnMomoForbiddenException` | 403 | Originating server IP not whitelisted on portal |
| `MtnMomoNotFoundException` | 404 | Transaction, pre-approval, or invoice ID not found |
| `MtnMomoConflictException` | 409 | Duplicate reference UUID already utilized |
| `MtnMomoTransactionException` | 400 / 500 with business error code | Structured business logic failure (carries `MtnMomoErrorCode`) |
| `MtnMomoServerException` | 500 / 503 (no error code) | MTN platform infrastructure failure |
| `MtnMomoUnexpectedException` | Other unmapped status | Unrecognized response |

## Transaction Error Codes (`MtnMomoErrorCode`)

`MtnMomoTransactionException` exposes `e.errorCode` as a typed enum:

| Enum | Raw API Value | Description |
| :--- | :--- | :--- |
| `payeeNotFound` | `PAYEE_NOT_FOUND` | Recipient MSISDN invalid or unregistered |
| `payerNotFound` | `PAYER_NOT_FOUND` | Sender MSISDN does not exist or is invalid |
| `invalidCallbackUrlHost` | `INVALID_CALLBACK_URL_HOST` | Callback URL host must be a domain name, not an IP |
| `invalidReferenceId` | `INVALID_REFERENCE_ID` | Reference ID (UUID v4) is invalid or malformed |
| `resourceNotFound` | `RESOURCE_NOT_FOUND` | Transaction or reference cannot be located |
| `resourceAlreadyExist` | `RESOURCE_ALREADY_EXIST` | Duplicate reference ID supplied |
| `payerLimitReached` | `PAYER_LIMIT_REACHED` | Daily or monthly wallet limits hit by customer |
| `approvalRejected` | `APPROVAL_REJECTED` | Customer rejected or timed out on USSD prompt |
| `notEnoughFunds` | `NOT_ENOUGH_FUNDS` | Wallet has insufficient balance |
| `senderAccountNotActive` | `SENDER_ACCOUNT_NOT_ACTIVE` | Payer wallet is frozen or inactive |
| `internalProcessingError` | `INTERNAL_PROCESSING_ERROR` | Core processing engine error |
| `couldNotPerformTransaction` | `COULD_NOT_PERFORM_TRANSACTION` | System failure to complete transaction |
| `genericError` | `GENERIC_ERROR` | Generic transaction error |
| `forbiddenIp` | `FORBIDDEN_IP` | Source server IP is blocked |
| `accessDenied` | `ACCESS_DENIED` | Invalid subscription key or inactive product |
| `notAllowedTargetEnvironment` | `NOT_ALLOWED_TARGET_ENVIRONMENT` | Access to target environment is forbidden |

## Catch-Flow Template

```dart
try {
  await momo.collection.requesttoPay(xReferenceId: ref, body: request);
} on MtnMomoTransactionException catch (e) {
  switch (e.errorCode) {
    case MtnMomoErrorCode.notEnoughFunds:
      // insufficient balance
    case MtnMomoErrorCode.approvalRejected:
      // customer rejected USSD prompt
    case MtnMomoErrorCode.payerLimitReached:
      // daily wallet limit hit
    default:
      // other business logic failure: ${e.errorCode.code} - ${e.errorCode.description}
  }
} on MtnMomoAuthException catch (e) {
  // invalid credentials (401): ${e.message} ${e.details ?? ''}
} on MtnMomoForbiddenException {
  // IP not whitelisted (403)
} on MtnMomoNotFoundException {
  // resource not found (404)
} on MtnMomoConflictException {
  // duplicate reference UUID (409)
} on MtnMomoServerException {
  // MTN server error (500/503)
} on MtnMomoNetworkException {
  // connection timeout or DNS failure
} on MtnMomoUnexpectedException catch (e) {
  // unmapped response: ${e.message}
}
```
