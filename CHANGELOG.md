## 0.0.1

* Initial release of the MTN Mobile Money (MoMo) SDK for Dart & Flutter.
* Full support for **Collections**, **Disbursements**, **Remittances**, and **Sandbox Provisioning** API products.
* Automated OAuth2 token lifecycle management with thread-safe deduplication via `TokenManager`.
* `MomoInterceptor` for automatic header injection (`Ocp-Apim-Subscription-Key`, `X-Target-Environment`, `Authorization`).
* Rich native exception hierarchy: `MtnMomoAuthException`, `MtnMomoTransactionException`, `MtnMomoNetworkException`, and more.
* Structured `MtnMomoErrorCode` enum covering all documented MTN MoMo business error codes.
* Generated type-safe Retrofit clients from official MTN OpenAPI specifications using `dart_mappable`.
* Comprehensive test suite: unit tests, interceptor tests, token manager tests, and live sandbox integration tests.
