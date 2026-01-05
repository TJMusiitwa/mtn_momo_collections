# Project Overview

This is a Flutter package that provides a client for the MTN Mobile Money Collections API. It allows developers to integrate MTN Mobile Money payments into their Dart applications. The package supports core functionalities such as sandbox provisioning, account balance checks, payment requests, and transaction status verification.

**Key Technologies:**

*   **Dart:** The primary programming language.
*   **Flutter:** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **Dio:** A powerful HTTP client for Dart, which is used to make requests to the MTN Mobile Money API.
*   **Retrofit:** A type-safe HTTP client for Dart and Flutter, used to generate the API client from a specification.
*   **dart_mappable:** A library for object-to-JSON mapping.

**Architecture:**

The package follows a client-server architecture. The `MtnMomoClient` class is the main entry point for interacting with the API. It provides access to two clients:

*   `CollectionClient`: This client handles all the operations related to collections, such as requesting payments, checking account balances, and validating account holders.
*   `SandboxProvisioningClient`: This client is used for creating and managing sandbox environments for testing purposes.

The API clients are generated using `retrofit` and `swagger_parser` from a Swagger/OpenAPI specification. The data models are generated using `dart_mappable`.

# Building and Running

**Building:**

To build the project, run the following command:

```bash
flutter pub get
flutter pub run build_runner build
```

**Testing:**

To run the tests, use the following command:

```bash
flutter test
```

# Development Conventions

*   **Coding Style:** The project follows the official Dart style guide.
*   **Testing:** The project uses the `flutter_test` package for testing. All new features should be accompanied by corresponding tests.
*   **Contributions:** Contributions are welcome. Please open an issue to discuss any major changes before submitting a pull request.
