# MTN Mobile Money (MoMo) SDK - Developer Examples

This directory contains executable code examples demonstrating how to get the most out of the `mtn_momo_collections` SDK.

> [!IMPORTANT]
> To run any of these examples, you **MUST** obtain your Primary or Secondary Subscription Key from your Profile on the official **MTN MoMo Developer Portal** at [momodeveloper.mtn.com](https://momodeveloper.mtn.com/).

---

## 📱 Interactive SDK Playground App

We have built a premium, state-of-the-art interactive **SDK Playground App** in Flutter, located at [main.dart](file:///Users/jonathanmusiitwa/Desktop/FLUTTER_PROJ/mtn_momo_collections/example/lib/main.dart).

It offers a gorgeous visual interface adhering strictly to MTN's official **Sunshine Yellow & Black** brand guidelines:
- **Sandbox User & Key Generator**: Tap once to programmatically generate dynamic Sandbox credentials.
- **Collections API Dashboard**: Input a payer's number and amount, dispatch a Push USSD transaction, check live status updates, and read the Collections balance.
- **Disbursements API Dashboard**: Validate a recipient, initialize a transfer (disbursing funds), track the state, and read the Disbursements balance.
- **Live Scrolling Terminal**: View raw gateway responses and exception mappings in real-time.

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
* **File**: [sandbox_provisioning_example.dart](file:///Users/jonathanmusiitwa/Desktop/FLUTTER_PROJ/mtn_momo_collections/example/sandbox_provisioning_example.dart)
* **Execution**:
  ```bash
  dart example/sandbox_provisioning_example.dart
  ```

### 2. Mobile Collections Workflow
Initiate customer payments (USSD push prompts), poll payment status, and verify merchant balance.
* **File**: [collections_example.dart](file:///Users/jonathanmusiitwa/Desktop/FLUTTER_PROJ/mtn_momo_collections/example/collections_example.dart)
* **Execution**:
  ```bash
  export MTN_MOMO_SUBSCRIPTION_KEY="your_sub_key"
  export MTN_MOMO_USER_ID="your_provisioned_user_id"
  export MTN_MOMO_API_KEY="your_provisioned_api_key"
  dart example/collections_example.dart
  ```

### 3. Mobile Payouts & Disbursements Workflow
Check recipient wallet status, disburse funds directly to a mobile number, and poll the transfer status.
* **File**: [disbursements_example.dart](file:///Users/jonathanmusiitwa/Desktop/FLUTTER_PROJ/mtn_momo_collections/example/disbursements_example.dart)
* **Execution**:
  ```bash
  export MTN_MOMO_SUBSCRIPTION_KEY="your_sub_key"
  export MTN_MOMO_USER_ID="your_provisioned_user_id"
  export MTN_MOMO_API_KEY="your_provisioned_api_key"
  dart example/disbursements_example.dart
  ```

### 4. Robust Error & Business Exception Handling
See how the SDK automatically intercepts raw API faults and maps them into clear, actionable `MtnMomoException` types and `MtnMomoErrorCode` enums.
* **File**: [resilient_error_handling_example.dart](file:///Users/jonathanmusiitwa/Desktop/FLUTTER_PROJ/mtn_momo_collections/example/resilient_error_handling_example.dart)
* **Execution**:
  ```bash
  dart example/resilient_error_handling_example.dart
  ```

### 5. Multi-Threaded Access Token Deduplication
Demonstrate how the SDK automatically deduplicates concurrent access token refreshes when multiple parallel network calls are fired at once.
* **File**: [thread_safety_deduplication_example.dart](file:///Users/jonathanmusiitwa/Desktop/FLUTTER_PROJ/mtn_momo_collections/example/thread_safety_deduplication_example.dart)
* **Execution**:
  ```bash
  dart example/thread_safety_deduplication_example.dart
  ```
