## 0.0.5

* Updated dependency constraints to the latest compatible releases, including `dart_mappable` 4.10.0, `dio` 5.11.1, `retrofit` 4.10.0, and the code generation and testing tools. `build_runner` remains on 2.16.2 for compatibility with `dart_mappable_builder`.
* Updated the minimum Dart SDK to 3.13.7, matching the installed stable toolchain.
* Migrated the Flutter playground to the standalone `material_ui` 1.8.0 package, refreshed its dependencies and lockfile, and required Flutter 3.47.8 or newer.
* Regenerated Retrofit clients with the updated generator.
* Added playground rendering and tab-navigation tests for light and dark themes, and documented the example's SDK requirements.

## 0.0.4

* Reworked package skills for agent consumption based on writing-for-agents principles:
  * Rewrote `collections`, `disbursements`, and `sandbox_provisioning` skills to remove duplicated architecture text, fix API mismatches (Disbursements refund model and method names), and expand coverage to the full client API surface.
  * Added `remittances` skill covering standard transfers and cross-border cash transfers with payer identity.
  * Added shared `skills/_shared/error_handling.md` reference consolidating the exception hierarchy and error code table into a single source of truth.
  * Added `AGENTS.md` as a top-level context pointer to all skills and key repo conventions.

## 0.0.3

* Refactored core SDK methods and test suites to reduce cognitive complexity:
  * Decomposed `MomoInterceptor.onRequest` into modular helper methods (`_normalizeData`, `_injectHeaders`, `_handleTokenEndpoints`, `_ensureToken`), reducing its cognitive complexity score from 24 to < 15.
  * Refactored `mapDioException` using Dart 3 switch expressions and status-specific error builders (`_buildAuthException`, `_buildServerErrorException`, `_buildDefaultException`, `_parseErrorReason`), reducing its cognitive complexity score from 21 to < 15.
  * Modularized `sandbox_usecases_test.dart` into discrete test group functions (`_testCollectionsGroup`, `_testDisbursementsGroup`, `_testRemittancesGroup`, `_testCashTransferGroup`), bringing cognitive complexity down from 182 to < 40.

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
