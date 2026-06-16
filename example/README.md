# MTN Mobile Money (MoMo) SDK - Developer Examples

This directory contains executable code examples demonstrating how to get the most out of the `mtn_momo_collections` SDK.

> [!IMPORTANT]
> To run any of these examples, you **MUST** obtain your Primary or Secondary Subscription Key from your Profile on the official **MTN MoMo Developer Portal** at [momodeveloper.mtn.com](https://momodeveloper.mtn.com/).

---

## 📱 Interactive SDK Playground App

We have built a premium, state-of-the-art interactive **SDK Playground App** in Flutter, located at [main.dart](lib/main.dart).

It offers a gorgeous visual interface adhering strictly to MTN's official **Sunshine Yellow & Black** brand guidelines, organized into a clean **tabbed interface**:
*   **Core APIs Tab**:
    *   **Sandbox Credentials**: Programmatically provision a dynamic Sandbox User ID and API Key.
    *   **Collections (USSD Push)**: Input a payer's number and amount, dispatch a transaction, and poll for live status updates.
    *   **Disbursements (Transfer)**: Verify a payee wallet, disburse funds, and monitor transfer states.
*   **Advanced Tab**:
    *   **Collections Pre-Approval**: Request customer mandates/consents with custom validity durations and poll authorization status.
    *   **Disbursements Refund**: Reference a prior transfer ID to issue a payout refund, monitoring the status.
*   **Simulator Tab**:
    *   **Sandbox Use Cases Simulator**: Run a sequential sequence of 6 predefined sandbox test scenarios (Success, validation errors, mandate rejections, etc.) streaming execution logs live into the console.
*   **Live Scrolling Terminal**: Displays WAF raw responses, token manager updates, and mapped exception logs in real-time.

> [!TIP]
> **Product Token Isolation Example**: Look at the source code in `lib/main.dart`. The playground initializes separate, dedicated instances of `MomoCollections` (`_collectionsMomo` and `_disbursementsMomo`) to demonstrate the recommended best practice of avoiding token cache overwrites between the different portal product scopes.

To launch the Playground on a simulator or device:
```bash
flutter run
```

---

## 💻 Standalone CLI Script Examples

If you are developing backend systems, scripts, or console apps, you can run and inspect our standalone CLI examples directly from the command line using the `dart` command.

> [!TIP]
> Run `sandbox_provisioning_example.dart` first to obtain valid dynamic user credentials for the other scripts.

### 1. Sandbox User & API Key Generation
Provision a new sandbox user ID and retrieve its corresponding API key.
* **File**: [sandbox_provisioning_example.dart](lib/sandbox_provisioning_example.dart)
* **Execution**:
  ```bash
  dart example/lib/sandbox_provisioning_example.dart
  ```

### 2. Mobile Collections Workflow
Initiate customer payments (USSD push prompts), poll payment status, and verify merchant balance.
* **File**: [collections_example.dart](lib/collections_example.dart)
* **Execution**:
  ```bash
  export MTN_MOMO_SUBSCRIPTION_KEY="your_sub_key"
  export MTN_MOMO_USER_ID="your_provisioned_user_id"
  export MTN_MOMO_API_KEY="your_provisioned_api_key"
  dart example/lib/collections_example.dart
  ```

### 3. Mobile Payouts & Disbursements Workflow
Check recipient wallet status, disburse funds directly to a mobile number, and poll the transfer status.
* **File**: [disbursements_example.dart](lib/disbursements_example.dart)
* **Execution**:
  ```bash
  export MTN_MOMO_SUBSCRIPTION_KEY="your_sub_key"
  export MTN_MOMO_USER_ID="your_provisioned_user_id"
  export MTN_MOMO_API_KEY="your_provisioned_api_key"
  dart example/lib/disbursements_example.dart
  ```

### 4. Robust Error & Business Business Exception Handling
See how the SDK automatically intercepts raw API faults and maps them into clear, actionable `MtnMomoException` types and `MtnMomoErrorCode` enums.
* **File**: [resilient_error_handling_example.dart](lib/resilient_error_handling_example.dart)
* **Execution**:
  ```bash
  dart example/lib/resilient_error_handling_example.dart
  ```

### 5. Multi-Threaded Access Token Deduplication
Demonstrate how the SDK automatically deduplicates concurrent access token refreshes when multiple parallel network calls are fired at once.
* **File**: [thread_safety_deduplication_example.dart](lib/thread_safety_deduplication_example.dart)
* **Execution**:
  ```bash
  dart example/lib/thread_safety_deduplication_example.dart
  ```

### 6. Collections Pre-Approval (Mandates)
Demonstrate requesting payment consent/mandates from customers and checking status.
* **File**: [collections_preapproval_example.dart](lib/collections_preapproval_example.dart)
* **Execution**:
  ```bash
  export MTN_MOMO_SUBSCRIPTION_KEY="your_sub_key"
  dart example/lib/collections_preapproval_example.dart
  ```

### 7. Disbursements Payout Refund
Demonstrate making a disbursement transfer and then issuing a refund referencing the original transfer.
* **File**: [disbursements_refund_example.dart](lib/disbursements_refund_example.dart)
* **Execution**:
  ```bash
  export MTN_MOMO_DISB_SUBSCRIPTION_KEY="your_disb_sub_key"
  dart example/lib/disbursements_refund_example.dart
  ```

### 8. Sandbox Use Cases Simulator
A comprehensive simulation runner that tests a sequence of 6 predefined sandbox behaviors (success, validation error, account inactive, mandate rejection, etc.) mapping exceptions correctly.
* **File**: [sandbox_usecase_simulator.dart](lib/sandbox_usecase_simulator.dart)
* **Execution**:
  ```bash
  export MTN_MOMO_SUBSCRIPTION_KEY="your_sub_key"
  dart example/lib/sandbox_usecase_simulator.dart
  ```

