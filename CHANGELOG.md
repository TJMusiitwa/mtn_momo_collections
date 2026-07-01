## 0.0.2

* Upgraded dependency versions including `dio` to `^5.10.0`, `logger` to `^2.7.0`, `test` to `^1.31.2`, and code generator packages (`swagger_parser` to `^1.44.0`, `dart_mappable_builder` to `^4.9.0`, `retrofit_generator` to `^10.2.7`).
* Applied `final` class modifiers to core classes (`MtnMomo`, `MtnMomoClient`, `MomoInterceptor`, `TokenManager`, `ErrorReasonCustomMapper`) to enforce non-subclassability in compliance with Dart 3 API guidelines.
* Refactored client and interceptor internal logic to utilize modern Dart 3 `switch` expressions and pattern matching:
  - Streamlined token client selection in `MtnMomo` based on request base URL.
  - Improved data serialization check in `MomoInterceptor` using patterns.
  - Simplified custom decoding implementation in `ErrorReasonCustomMapper`.
* Enhanced error mapping (`mapDioException`) in `lib/src/exceptions.dart`:
  - Rewritten using a structured `switch` expression over HTTP status codes.
  - Introduced `MtnMomoUnexpectedException` for mapping unhandled HTTP status codes.
  - Expanded `MtnMomoAuthException` to capture and expose error details when available.
* Added unit tests validating `MtnMomoUnexpectedException` mapping.

## 0.0.1

* Initial release of the MTN Mobile Money (MoMo) SDK for Dart & Flutter.
* Full support for **Collections**, **Disbursements**, **Remittances**, and **Sandbox Provisioning** API products.
* Automated OAuth2 token lifecycle management with thread-safe deduplication via `TokenManager`.
* `MomoInterceptor` for automatic header injection (`Ocp-Apim-Subscription-Key`, `X-Target-Environment`, `Authorization`).
* Rich native exception hierarchy: `MtnMomoAuthException`, `MtnMomoTransactionException`, `MtnMomoNetworkException`, and more.
* Structured `MtnMomoErrorCode` enum covering all documented MTN MoMo business error codes.
* Generated type-safe Retrofit clients from official MTN OpenAPI specifications using `dart_mappable`.
* Comprehensive test suite: unit tests, interceptor tests, token manager tests, and live sandbox integration tests.
