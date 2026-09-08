# AGENTS.md

Unofficial Dart & Flutter SDK for the MTN Mobile Money (MoMo) API. Supports Collections, Disbursements, Remittances, and Sandbox Provisioning across sandbox and production environments.

## Skills

Reach the skill that matches the integration task:

| Skill | Triggers |
| :--- | :--- |
| `skills/collections/SKILL.md` | Requesting money from subscribers (requestToPay), polling payment status, validating payer MSISDN, checking collection balance, managing invoices or pre-approvals |
| `skills/disbursements/SKILL.md` | Sending payouts to mobile wallets, depositing funds, issuing refunds, checking transfer or deposit status |
| `skills/remittances/SKILL.md` | Sending international money transfers, cross-border cash transfers with payer identity, checking remittance status |
| `skills/sandbox_provisioning/SKILL.md` | Setting up test environments, registering sandbox API users, generating sandbox API keys |

Shared reference: `skills/_shared/error_handling.md` covers the full `MtnMomoException` hierarchy, `MtnMomoErrorCode` table, and catch-flow template. All skills link to it.

## Architecture

See `GEMINI.md` for the deep architecture reference: layer design, code generation pipeline, token lifecycle, interceptor internals, and the product token isolation requirement (one `MtnMomo` instance per product).

## Key Conventions

- **One `MtnMomo` per product.** Collections, Disbursements, and Remittances each need a dedicated instance with their own credentials. Sharing causes OAuth2 token cache collisions (401 errors).
- **Generated clients.** Retrofit clients and dart_mappable models under `lib/src/generated/` are produced from OpenAPI specs in `schemes/`. Do not edit generated files by hand.
- **Code generation pipeline.** After modifying schemas: `dart run swagger_parser && dart run build_runner build --delete-conflicting-outputs`.
- **Testing.** `dart test` for the unit suite. `dart test test/sandbox_usecases_test.dart` for live sandbox integration tests (requires `.env` with keys).
- **Usage examples.** Standalone example files are in `example/lib/` with per-scenario instructions in `example/README.md`.
