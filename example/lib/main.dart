import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';
import 'package:uuid/uuid.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MomoSdkPlaygroundApp());
}

/// The main entry point of the interactive SDK Playground.
class MomoSdkPlaygroundApp extends StatelessWidget {
  const MomoSdkPlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTN MoMo SDK Playground',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFCB05), // MTN Sunshine Yellow (#FFCB05)
          primary: const Color(0xFFFFCB05),
          onPrimary: Colors.black,
          secondary: const Color(0xFF004F71), // MoMo Blue (#004F71)
          onSecondary: Colors.white,
          surface: const Color(0xFFFFFFFF), // Pure White (#FFFFFF)
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFE5E5E5), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF004F71), width: 1.5),
          ),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFCB05), // MTN Sunshine Yellow (#FFCB05)
          onPrimary: Colors.black,
          secondary: Color(0xFF004F71), // MoMo Blue (#004F71)
          onSecondary: Colors.white,
          surface: Color(
              0xFF0C2B3E), // Lighter deep navy blue for dark card surfaces
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF0C2B3E),
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFF143D56), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF072030),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF143D56), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFFFCB05), width: 1.5),
          ),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const PlaygroundHomeScreen(),
    );
  }
}

class PlaygroundHomeScreen extends StatefulWidget {
  const PlaygroundHomeScreen({super.key});

  @override
  State<PlaygroundHomeScreen> createState() => _PlaygroundHomeScreenState();
}

class _PlaygroundHomeScreenState extends State<PlaygroundHomeScreen> {
  // Controller inputs
  final _subKeyController =
      TextEditingController(text: 'a9acc520ea7d487baa58af01167d5659'); // This is an example key, replace it with your own!
  final _userIdController = TextEditingController();
  final _apiKeyController = TextEditingController();
  final _collectMsisdnController = TextEditingController(text: '256772123456');
  final _collectAmountController = TextEditingController(text: '5000');
  final _disbMsisdnController = TextEditingController(text: '256772987654');
  final _disbAmountController = TextEditingController(text: '12000');

  // New Controllers for Advanced examples
  final _preAppMsisdnController = TextEditingController(text: '256772123456');
  final _preAppValidityController = TextEditingController(text: '3600');
  final _refundTransferIdController = TextEditingController();
  final _refundAmountController = TextEditingController(text: '5000');

  // Interactive UI States
  bool _isProvisioning = false;
  bool _isCollectionsRunning = false;
  bool _isDisbursementsRunning = false;
  bool _isPreAppRunning = false;
  bool _isRefundRunning = false;
  bool _isSimulatorRunning = false;

  // Active status values
  String _colBalance = '—';
  String _disbBalance = '—';
  String _colTxnState = 'No active transaction';
  String _disbTxnState = 'No active transaction';
  String _preAppTxnState = 'No active request';
  String _refundTxnState = 'No active request';
  String _simulatorState = 'Idle';

  // Live Terminal Logs
  final List<String> _terminalLogs = [];
  final ScrollController _terminalScrollController = ScrollController();

  // Unified Momo SDK wrappers for Product Token Isolation
  MtnMomo? _collectionsMomo;
  MtnMomo? _disbursementsMomo;

  @override
  void initState() {
    super.initState();
    _logTerminal('System: MTN Mobile Money SDK Playground Initialized.');
    _logTerminal(
        'System: Aligned with official MoMo Blue (#004F71) & MTN Sunshine (#FFCB05) guidelines.');
  }

  @override
  void dispose() {
    _subKeyController.dispose();
    _userIdController.dispose();
    _apiKeyController.dispose();
    _collectMsisdnController.dispose();
    _collectAmountController.dispose();
    _disbMsisdnController.dispose();
    _disbAmountController.dispose();
    _preAppMsisdnController.dispose();
    _preAppValidityController.dispose();
    _refundTransferIdController.dispose();
    _refundAmountController.dispose();
    _terminalScrollController.dispose();
    super.dispose();
  }

  void _logTerminal(String message) {
    final timestamp = DateTime.now().toLocal().toString().substring(11, 19);
    setState(() {
      _terminalLogs.add('[$timestamp] $message');
    });
    // Autoscroll terminal
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_terminalScrollController.hasClients) {
        _terminalScrollController.animateTo(
          _terminalScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  /// Instantiates the client wrappers using current fields.
  bool _initializeClient() {
    if (_collectionsMomo != null && _disbursementsMomo != null) return true;

    final subKey = _subKeyController.text.trim();
    final uid = _userIdController.text.trim();
    final key = _apiKeyController.text.trim();

    if (subKey.isEmpty || uid.isEmpty || key.isEmpty) {
      _logTerminal(
          'Client: Error - Subscription Key, API User, or API Key cannot be empty.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please complete Sandbox Credentials first!')),
      );
      return false;
    }

    _collectionsMomo = MtnMomo(
      baseUrl: 'https://sandbox.momodeveloper.mtn.com',
      subscriptionKey: subKey,
      userId: uid,
      apiKey: key,
      targetEnvironment: 'sandbox',
    );

    _disbursementsMomo = MtnMomo(
      baseUrl: 'https://sandbox.momodeveloper.mtn.com',
      subscriptionKey: subKey,
      userId: uid,
      apiKey: key,
      targetEnvironment: 'sandbox',
    );

    _logTerminal(
        'Client: Separate dedicated Collections and Disbursements clients initialized.');
    return true;
  }

  /// Flow 1: Provision Sandbox User
  Future<void> _provisionSandbox() async {
    final subKey = _subKeyController.text.trim();
    if (subKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a Subscription Key first.')),
      );
      return;
    }

    setState(() {
      _isProvisioning = true;
      _collectionsMomo = null;
      _disbursementsMomo = null; // Reset existing wrappers
    });

    _logTerminal('Sandbox: Initializing user provisioning process...');
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://sandbox.momodeveloper.mtn.com',
        headers: {
          'Ocp-Apim-Subscription-Key': subKey,
          'Content-Type': 'application/json',
        },
      ),
    );

    final provisioner = SandboxProvisioningClient(dio);
    final generatedUserId = const Uuid().v4();

    try {
      _logTerminal('Sandbox: Posting V1.0 API User registration request...');
      _logTerminal('Sandbox: X-Reference-Id generated: $generatedUserId');

      await provisioner.postV10Apiuser(
        xReferenceId: generatedUserId,
        body: const ApiUser(
          providerCallbackHost: 'callbacks.playground-app.com',
        ),
      );

      _logTerminal(
          'Sandbox: Registration completed. Propagating database records...');
      await Future.delayed(const Duration(seconds: 2));

      _logTerminal(
          'Sandbox: Requesting API Key for User ID: $generatedUserId...');
      final response = await provisioner.postV10ApiuserApikey(
        xReferenceId: generatedUserId,
      );

      final key = response.apiKey;
      if (key == null || key.isEmpty) {
        throw Exception('Gateway returned empty or null API Key.');
      }

      setState(() {
        _userIdController.text = generatedUserId;
        _apiKeyController.text = key;
      });

      _logTerminal('Sandbox: ✓ API Key successfully generated: $key');
      _logTerminal('Sandbox: Provisioning fully completed!');
    } on MtnMomoException catch (e) {
      _logTerminal('Sandbox: ✗ Exception: ${e.message}');
    } catch (e) {
      _logTerminal('Sandbox: ✗ Error: $e');
    } finally {
      setState(() {
        _isProvisioning = false;
      });
    }
  }

  /// Flow 2: Collections - Check Balance
  Future<void> _fetchCollectionsBalance() async {
    if (!_initializeClient()) return;

    _logTerminal('Collections: Fetching merchant account balance...');
    try {
      final balance = await _collectionsMomo!.collection.getAccountBalance();
      setState(() {
        _colBalance = '${balance.availableBalance} ${balance.currency}';
      });
      _logTerminal('Collections: ✓ Balance fetched: $_colBalance');
    } on MtnMomoException catch (e) {
      _logTerminal('Collections: ✗ Exception: ${e.message}');
    } catch (e) {
      _logTerminal('Collections: ✗ Error: $e');
    }
  }

  /// Flow 3: Collections - Push USSD
  Future<void> _runCollectionsFlow() async {
    if (!_initializeClient()) return;

    final customer = _collectMsisdnController.text.trim();
    final amount = _collectAmountController.text.trim();

    if (customer.isEmpty || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please specify customer phone number and amount.')),
      );
      return;
    }

    setState(() {
      _isCollectionsRunning = true;
      _colTxnState = 'Initializing request...';
    });

    try {
      // 1. Validate status
      _logTerminal(
          'Collections: Validating customer wallet registration ($customer)...');
      await _collectionsMomo!.collection.validateAccountHolderStatus(
        accountHolderId: customer,
        accountHolderIdType: 'msisdn',
      );
      _logTerminal('Collections: ✓ Wallet verified.');

      // 2. Trigger push
      final referenceId = const Uuid().v4();
      _logTerminal(
          'Collections: Dispatching Request to Pay ($referenceId) for $amount EUR...');

      final requestBody = RequestToPay(
        amount: amount,
        currency: 'EUR',
        externalId: 'TXN_PLAYGROUND_${const Uuid().v4().substring(0, 8)}',
        payer: Party(
          partyIdType: PartyPartyIdType.msisdn,
          partyId: customer,
        ),
        payerMessage: 'Playground transaction',
        payeeNote: 'Antigravity systems integration',
      );

      await _collectionsMomo!.collection.requesttoPay(
        xReferenceId: referenceId,
        body: requestBody,
      );
      _logTerminal(
          'Collections: ✓ Request to pay sent to handset. Polling active status...');

      // 3. Polling
      RequestToPayResultStatus? finalState;
      var attempts = 0;

      while (attempts < 10) {
        attempts++;
        setState(() {
          _colTxnState = 'Polling status (Attempt $attempts/10)';
        });

        final status =
            await _collectionsMomo!.collection.requesttoPayTransactionStatus(
          referenceId: referenceId,
        );

        finalState = status.status;
        _logTerminal('Collections: Current poll status: $finalState');

        if (finalState == RequestToPayResultStatus.successful) {
          setState(() {
            _colTxnState = '✓ Transaction Successful';
          });
          _logTerminal('Collections: ✓ Payment completed SUCCESSFUL!');
          break;
        } else if (finalState == RequestToPayResultStatus.failed) {
          setState(() {
            _colTxnState = '✗ Transaction Failed: ${status.reason?.code}';
          });
          _logTerminal(
              'Collections: ✗ Payment FAILED. Reason: ${status.reason?.code}');
          break;
        }

        await Future.delayed(const Duration(seconds: 3));
      }

      if (finalState == RequestToPayResultStatus.pending) {
        setState(() {
          _colTxnState = '✗ Polling Timeout';
        });
        _logTerminal(
            'Collections: ✗ Polling timeout. Handset response took too long.');
      }
    } on MtnMomoException catch (e) {
      setState(() {
        _colTxnState = 'Exception: ${e.message}';
      });
      _logTerminal('Collections: ✗ Exception: ${e.message}');
    } catch (e) {
      setState(() {
        _colTxnState = 'Error: $e';
      });
      _logTerminal('Collections: ✗ Error: $e');
    } finally {
      setState(() {
        _isCollectionsRunning = false;
      });
      _fetchCollectionsBalance();
    }
  }

  /// Flow 4: Disbursements - Check Balance
  Future<void> _fetchDisbursementsBalance() async {
    if (!_initializeClient()) return;

    _logTerminal('Disbursements: Fetching merchant payout balance...');
    try {
      final balance =
          await _disbursementsMomo!.disbursements.getAccountBalance();
      setState(() {
        _disbBalance = '${balance.availableBalance} ${balance.currency}';
      });
      _logTerminal('Disbursements: ✓ Balance fetched: $_disbBalance');
    } on MtnMomoException catch (e) {
      _logTerminal('Disbursements: ✗ Exception: ${e.message}');
    } catch (e) {
      _logTerminal('Disbursements: ✗ Error: $e');
    }
  }

  /// Flow 5: Disbursements - Transfer
  Future<void> _runDisbursementsFlow() async {
    if (!_initializeClient()) return;

    final payee = _disbMsisdnController.text.trim();
    final amount = _disbAmountController.text.trim();

    if (payee.isEmpty || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please specify payee phone number and amount.')),
      );
      return;
    }

    setState(() {
      _isDisbursementsRunning = true;
      _disbTxnState = 'Initializing transfer...';
    });

    try {
      // 1. Validate status
      _logTerminal('Disbursements: Checking payee wallet status ($payee)...');
      await _disbursementsMomo!.disbursements.validateAccountHolderStatus(
        accountHolderId: payee,
        accountHolderIdType: 'msisdn',
      );
      _logTerminal('Disbursements: ✓ Payee wallet is active.');

      // 2. Trigger transfer
      final referenceId = const Uuid().v4();
      _logTerminal(
          'Disbursements: Initiating transfer ($referenceId) for $amount EUR...');

      final transferBody = Transfer(
        amount: amount,
        currency: 'EUR',
        externalId: 'TXN_DISB_${const Uuid().v4().substring(0, 8)}',
        payee: Party(
          partyIdType: PartyPartyIdType.msisdn,
          partyId: payee,
        ),
        payerMessage: 'Salary disbursement',
        payeeNote: 'Playground transfer',
      );

      await _disbursementsMomo!.disbursements.transfer(
        xReferenceId: referenceId,
        body: transferBody,
      );
      _logTerminal(
          'Disbursements: ✓ Transfer posted on gateway. Polling status...');

      // 3. Polling
      TransferResultStatus? finalState;
      var attempts = 0;

      while (attempts < 10) {
        attempts++;
        setState(() {
          _disbTxnState = 'Polling status (Attempt $attempts/10)';
        });

        final status =
            await _disbursementsMomo!.disbursements.getTransferStatus(
          referenceId: referenceId,
        );

        finalState = status.status;
        _logTerminal('Disbursements: Current poll status: $finalState');

        if (finalState == TransferResultStatus.successful) {
          setState(() {
            _disbTxnState = '✓ Transfer Successful';
          });
          _logTerminal('Disbursements: ✓ Transfer completed SUCCESSFUL!');
          break;
        } else if (finalState == TransferResultStatus.failed) {
          setState(() {
            _disbTxnState = '✗ Payout Failed: ${status.reason?.code}';
          });
          _logTerminal(
              'Disbursements: ✗ Payout FAILED. Reason: ${status.reason?.code}');
          break;
        }

        await Future.delayed(const Duration(seconds: 3));
      }

      if (finalState == TransferResultStatus.pending) {
        setState(() {
          _disbTxnState = '✗ Polling Timeout';
        });
        _logTerminal(
            'Disbursements: ✗ Polling timeout. Gateway took too long to complete.');
      }
    } on MtnMomoException catch (e) {
      setState(() {
        _disbTxnState = 'Exception: ${e.message}';
      });
      _logTerminal('Disbursements: ✗ Exception: ${e.message}');
    } catch (e) {
      setState(() {
        _disbTxnState = 'Error: $e';
      });
      _logTerminal('Disbursements: ✗ Error: $e');
    } finally {
      setState(() {
        _isDisbursementsRunning = false;
      });
      _fetchDisbursementsBalance();
    }
  }

  /// Advanced Flow 1: Collections Pre-Approval
  Future<void> _runPreApprovalFlow() async {
    if (!_initializeClient()) return;

    final customer = _preAppMsisdnController.text.trim();
    final validityStr = _preAppValidityController.text.trim();

    if (customer.isEmpty || validityStr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Please specify customer phone and validity duration.')),
      );
      return;
    }

    final validity = int.tryParse(validityStr) ?? 3600;

    setState(() {
      _isPreAppRunning = true;
      _preAppTxnState = 'Initializing request...';
    });

    try {
      final referenceId = const Uuid().v4();
      _logTerminal(
          'Pre-Approval: Initiating consent request ($referenceId) for $customer...');

      final preApproval = PreApproval(
        payer: Party(
          partyIdType: PartyPartyIdType.msisdn,
          partyId: customer,
        ),
        payerCurrency: 'EUR',
        payerMessage: 'Consent to charge wallet for subscription.',
        validityTime: validity,
      );

      await _collectionsMomo!.collection.preApproval(
        xReferenceId: referenceId,
        body: preApproval,
      );
      _logTerminal(
          'Pre-Approval: ✓ Consent request submitted. Polling status...');

      PreApprovalResultStatus? finalState;
      var attempts = 0;

      while (attempts < 10) {
        attempts++;
        setState(() {
          _preAppTxnState = 'Polling status (Attempt $attempts/10)';
        });
        await Future.delayed(const Duration(seconds: 2));

        try {
          final status = await _collectionsMomo!.collection
              .getPreApprovalStatus(referenceId: referenceId);
          finalState = status.status;
          _logTerminal('Pre-Approval: Current status: $finalState');

          if (finalState == PreApprovalResultStatus.successful) {
            setState(() {
              _preAppTxnState = '✓ Consent Granted';
            });
            _logTerminal('Pre-Approval: ✓ Mandate GRANTED successfully!');
            break;
          } else if (finalState == PreApprovalResultStatus.failed) {
            setState(() {
              _preAppTxnState = '✗ Consent Rejected: ${status.reason?.code}';
            });
            _logTerminal(
                'Pre-Approval: ✗ Consent REJECTED. Reason: ${status.reason?.code}');
            break;
          }
        } on MtnMomoNotFoundException catch (_) {
          _logTerminal(
              'Pre-Approval: [Attempt $attempts/10] Not propagated on gateway yet (404)...');
        }
      }

      if (finalState == PreApprovalResultStatus.pending) {
        setState(() {
          _preAppTxnState = '✗ Polling Timeout';
        });
        _logTerminal('Pre-Approval: ✗ Polling timeout. No response received.');
      }
    } on MtnMomoException catch (e) {
      setState(() {
        _preAppTxnState = 'Exception: ${e.message}';
      });
      _logTerminal('Pre-Approval: ✗ Exception: ${e.message}');
    } catch (e) {
      setState(() {
        _preAppTxnState = 'Error: $e';
      });
      _logTerminal('Pre-Approval: ✗ Error: $e');
    } finally {
      setState(() {
        _isPreAppRunning = false;
      });
    }
  }

  /// Advanced Flow 2: Disbursements Refund
  Future<void> _runRefundFlow() async {
    if (!_initializeClient()) return;

    final transferId = _refundTransferIdController.text.trim();
    final amount = _refundAmountController.text.trim();

    if (transferId.isEmpty || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Please specify the original Transfer Reference ID and refund amount.')),
      );
      return;
    }

    setState(() {
      _isRefundRunning = true;
      _refundTxnState = 'Initializing refund...';
    });

    try {
      final refundRefId = const Uuid().v4();
      _logTerminal(
          'Refund: Initiating refund request ($refundRefId) for Transfer ID: $transferId...');

      final refund = Refund(
        amount: amount,
        currency: 'EUR',
        externalId: 'TXN_REFUND_${refundRefId.substring(0, 8)}',
        referenceIdToRefund: transferId,
        payerMessage: 'Refunding salary payment error',
        payeeNote: 'Refunding payout via Playground',
      );

      await _disbursementsMomo!.disbursements.refundV1(
        xReferenceId: refundRefId,
        body: refund,
      );
      _logTerminal('Refund: ✓ Refund request accepted. Polling status...');

      RefundResultStatus? finalState;
      var attempts = 0;

      while (attempts < 10) {
        attempts++;
        setState(() {
          _refundTxnState = 'Polling status (Attempt $attempts/10)';
        });
        await Future.delayed(const Duration(seconds: 2));

        try {
          final status = await _disbursementsMomo!.disbursements
              .getRefundStatus(referenceId: refundRefId);
          finalState = status.status;
          _logTerminal('Refund: Current status: $finalState');

          if (finalState == RefundResultStatus.successful) {
            setState(() {
              _refundTxnState = '✓ Refund Successful';
            });
            _logTerminal('Refund: ✓ Refund completed SUCCESSFUL!');
            break;
          } else if (finalState == RefundResultStatus.failed) {
            setState(() {
              _refundTxnState = '✗ Refund Failed: ${status.reason?.code}';
            });
            _logTerminal(
                'Refund: ✗ Refund FAILED. Reason: ${status.reason?.code}');
            break;
          }
        } on MtnMomoNotFoundException catch (_) {
          _logTerminal(
              'Refund: [Attempt $attempts/10] Not propagated on gateway yet (404)...');
        }
      }

      if (finalState == RefundResultStatus.pending) {
        setState(() {
          _refundTxnState = '✗ Polling Timeout';
        });
        _logTerminal('Refund: ✗ Polling timeout. Gateway took too long.');
      }
    } on MtnMomoException catch (e) {
      setState(() {
        _refundTxnState = 'Exception: ${e.message}';
      });
      _logTerminal('Refund: ✗ Exception: ${e.message}');
    } catch (e) {
      setState(() {
        _refundTxnState = 'Error: $e';
      });
      _logTerminal('Refund: ✗ Error: $e');
    } finally {
      setState(() {
        _isRefundRunning = false;
      });
      _fetchDisbursementsBalance();
    }
  }

  /// Advanced Flow 3: Sandbox Use Cases Simulator
  Future<void> _runSandboxSimulatorFlow() async {
    if (!_initializeClient()) return;

    setState(() {
      _isSimulatorRunning = true;
      _simulatorState = 'Running Simulation...';
    });

    _logTerminal('Simulator: starting full sandbox test cases execution...');

    try {
      // 1. Success Case
      await _simulateCollect('256772123456', 'Success Case (Standard MSISDN)');

      // 2. Account Not Found
      await _simulateValidation('46733123450', 'Account Holder Not Found');

      // 3. Account Holder Inactive (Expired)
      await _simulateCollect(
          '46733123451', 'Account Holder Not Active (Expired Status)');

      // 4. Operation Not Allowed
      await _simulateValidation('46733123452', 'Operation Not Allowed');

      // 5. Target Environment Forbidden
      await _simulateCollect('46733123453', 'Target Environment Forbidden');

      // 6. Internal Processing Error
      await _simulateCollect('46733123454', 'Internal Processing Error Status');

      setState(() {
        _simulatorState = '✓ Completed';
      });
      _logTerminal(
          'Simulator: All simulation test cases completed successfully.');
    } catch (e) {
      setState(() {
        _simulatorState = '✗ Simulation Error';
      });
      _logTerminal('Simulator: ✗ Unexpected Simulator Error: $e');
    } finally {
      setState(() {
        _isSimulatorRunning = false;
      });
    }
  }

  Future<void> _simulateValidation(String msisdn, String label) async {
    _logTerminal('Simulator: Running validation: $label (MSISDN: $msisdn)...');
    try {
      await _collectionsMomo!.collection.validateAccountHolderStatus(
        accountHolderId: msisdn,
        accountHolderIdType: 'msisdn',
      );
      _logTerminal('Simulator: ✓ Active account status verified.');
    } on MtnMomoException catch (e) {
      _logTerminal(
          'Simulator: Caught expected exception: ${e.runtimeType} -> ${e.message}');
    }
  }

  Future<void> _simulateCollect(String msisdn, String label) async {
    _logTerminal('Simulator: Running collection: $label (MSISDN: $msisdn)...');
    final referenceId = const Uuid().v4();

    try {
      await _collectionsMomo!.collection.requesttoPay(
        xReferenceId: referenceId,
        body: RequestToPay(
          amount: '1000',
          currency: 'EUR',
          externalId: 'TXN_SIM_${referenceId.substring(0, 8)}',
          payer: Party(
            partyIdType: PartyPartyIdType.msisdn,
            partyId: msisdn,
          ),
          payerMessage: 'Simulation of $label',
          payeeNote: 'Sandbox simulation',
        ),
      );
      _logTerminal('Simulator: Request submitted. Polling...');

      RequestToPayResultStatus? state;
      var attempts = 0;

      while (attempts < 10) {
        attempts++;
        await Future.delayed(const Duration(milliseconds: 1500));
        try {
          final status = await _collectionsMomo!.collection
              .requesttoPayTransactionStatus(referenceId: referenceId);
          state = status.status;
          _logTerminal(
              'Simulator:   [Poll $attempts/10] Current status: $state');

          if (state == RequestToPayResultStatus.successful) {
            _logTerminal('Simulator:   ✓ Success!');
            break;
          } else if (state == RequestToPayResultStatus.failed) {
            _logTerminal(
                'Simulator:   ✗ Failed. Reason: ${status.reason?.code}');
            break;
          }
        } on MtnMomoNotFoundException catch (_) {
          _logTerminal(
              'Simulator:   [Poll $attempts/10] Not propagated yet (404)...');
        }
      }
    } on MtnMomoException catch (e) {
      _logTerminal(
          'Simulator: Caught expected initialization exception: ${e.runtimeType} -> ${e.message}');
    } catch (e) {
      _logTerminal('Simulator: Unexpected error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF004F71), // Solid MoMo Blue
          foregroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFCB05), // MTN Sunshine Yellow
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.wallet,
                    color: Color(0xFF004F71), size: 20),
              ),
              const SizedBox(width: 10),
              const Text(
                'MTN MoMo SDK Playground',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.white),
              tooltip: 'Clear Logs',
              onPressed: () {
                setState(() {
                  _terminalLogs.clear();
                });
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFFFFCB05),
            labelColor: Color(0xFFFFCB05),
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.star), text: 'Core APIs'),
              Tab(icon: Icon(Icons.extension), text: 'Advanced'),
              Tab(icon: Icon(Icons.bug_report), text: 'Simulator'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: Core APIs
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSandboxCredentialsCard(isDark),
                        const SizedBox(height: 16),
                        _buildCollectionsCard(isDark),
                        const SizedBox(height: 16),
                        _buildDisbursementsCard(isDark),
                      ],
                    ),
                  ),
                  // Tab 2: Advanced
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildPreApprovalCard(isDark),
                        const SizedBox(height: 16),
                        _buildRefundCard(isDark),
                      ],
                    ),
                  ),
                  // Tab 3: Simulator
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSimulatorCard(isDark),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildTerminalConsole(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildPreApprovalCard(bool isDark) {
    final credentialsValid =
        _userIdController.text.isNotEmpty && _apiKeyController.text.isNotEmpty;

    return Opacity(
      opacity: credentialsValid ? 1.0 : 0.5,
      child: AbsorbPointer(
        absorbing: !credentialsValid,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lock_person, color: Color(0xFF004F71)),
                    const SizedBox(width: 8),
                    Text(
                      'Collections Pre-Approval',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: _preAppMsisdnController,
                        decoration: const InputDecoration(
                            labelText: 'Payer Phone (MSISDN)'),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _preAppValidityController,
                        decoration:
                            const InputDecoration(labelText: 'Validity (sec)'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _isPreAppRunning ? null : _runPreApprovalFlow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004F71),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: isDark
                        ? const Color(0xFF143D56)
                        : const Color(0xFFE5E5E5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: _isPreAppRunning
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Request Payment Consent',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    _preAppTxnState,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRefundCard(bool isDark) {
    final credentialsValid =
        _userIdController.text.isNotEmpty && _apiKeyController.text.isNotEmpty;

    return Opacity(
      opacity: credentialsValid ? 1.0 : 0.5,
      child: AbsorbPointer(
        absorbing: !credentialsValid,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Icon(Icons.settings_backup_restore,
                        color: Color(0xFF004F71)),
                    const SizedBox(width: 8),
                    Text(
                      'Disbursements Refund',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _refundTransferIdController,
                  decoration: const InputDecoration(
                    labelText: 'Original Transfer Reference ID (UUID)',
                    hintText: 'Enter transfer UUID to refund...',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _refundAmountController,
                  decoration: const InputDecoration(
                    labelText: 'Refund Amount (EUR)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _isRefundRunning ? null : _runRefundFlow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004F71),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: isDark
                        ? const Color(0xFF143D56)
                        : const Color(0xFFE5E5E5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: _isRefundRunning
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Initiate Payout Refund',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    _refundTxnState,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSimulatorCard(bool isDark) {
    final credentialsValid =
        _userIdController.text.isNotEmpty && _apiKeyController.text.isNotEmpty;

    return Opacity(
      opacity: credentialsValid ? 1.0 : 0.5,
      child: AbsorbPointer(
        absorbing: !credentialsValid,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Icon(Icons.play_circle_outline,
                        color: Color(0xFF004F71)),
                    const SizedBox(width: 8),
                    Text(
                      'Predefined Sandbox Use Cases Simulator',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Runs a sequential suite of 6 standard sandbox test scenarios using official MSISDN configurations (Success, Bad Wallet, Inactive User, Permissions Error, Forbidden Env, Server Fault). Results stream live into the scrolling Console below.',
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey[300] : Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed:
                      _isSimulatorRunning ? null : _runSandboxSimulatorFlow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFCB05),
                    foregroundColor: Colors.black,
                    disabledBackgroundColor: isDark
                        ? const Color(0xFF143D56)
                        : const Color(0xFFE5E5E5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: _isSimulatorRunning
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.black,
                          ),
                        )
                      : const Text(
                          'Run Use Cases Simulator',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    _simulatorState,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSandboxCredentialsCard(bool isDark) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.settings,
                    color: Color(0xFF004F71)), // MoMo Blue
                const SizedBox(width: 8),
                Text(
                  '1. Sandbox Credentials',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _subKeyController,
              decoration: const InputDecoration(
                labelText: 'Subscription Key',
                hintText: 'Enter subscription key...',
                helperText:
                    'Get this Primary/Secondary Subscription Key from your profile at https://momodeveloper.mtn.com/',
                helperMaxLines: 2,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isProvisioning ? null : _provisionSandbox,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFFFCB05), // MTN Sunshine Yellow
                      foregroundColor: Colors.black,
                      disabledBackgroundColor: isDark
                          ? const Color(0xFF143D56)
                          : const Color(0xFFE5E5E5),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: _isProvisioning
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                          )
                        : const Text(
                            'Provision Sandbox User',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _userIdController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Generated User ID (API User)',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: _userIdController.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User ID copied!')),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _apiKeyController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Generated API Key',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: _apiKeyController.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('API Key copied!')),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionsCard(bool isDark) {
    final credentialsValid =
        _userIdController.text.isNotEmpty && _apiKeyController.text.isNotEmpty;

    return Opacity(
      opacity: credentialsValid ? 1.0 : 0.5,
      child: AbsorbPointer(
        absorbing: !credentialsValid,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_downward,
                            color: Color(0xFF004F71)), // MoMo Blue
                        const SizedBox(width: 8),
                        Text(
                          '2. Collections API',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: _fetchCollectionsBalance,
                      icon: const Icon(Icons.refresh,
                          size: 16, color: Color(0xFF004F71)),
                      label: Text(
                        'Bal: $_colBalance',
                        style: const TextStyle(
                          color: Color(0xFF004F71), // MoMo Blue
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: _collectMsisdnController,
                        decoration: const InputDecoration(
                            labelText: 'Customer Phone (MSISDN)'),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _collectAmountController,
                        decoration:
                            const InputDecoration(labelText: 'Amount (EUR)'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _isCollectionsRunning ? null : _runCollectionsFlow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004F71), // Solid MoMo Blue
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: isDark
                        ? const Color(0xFF143D56)
                        : const Color(0xFFE5E5E5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: _isCollectionsRunning
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Request Payment (USSD Push)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    _colTxnState,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDisbursementsCard(bool isDark) {
    final credentialsValid =
        _userIdController.text.isNotEmpty && _apiKeyController.text.isNotEmpty;

    return Opacity(
      opacity: credentialsValid ? 1.0 : 0.5,
      child: AbsorbPointer(
        absorbing: !credentialsValid,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_upward,
                            color: Color(0xFF004F71)), // MoMo Blue
                        const SizedBox(width: 8),
                        Text(
                          '3. Disbursements API',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: _fetchDisbursementsBalance,
                      icon: const Icon(Icons.refresh,
                          size: 16, color: Color(0xFF004F71)),
                      label: Text(
                        'Bal: $_disbBalance',
                        style: const TextStyle(
                          color: Color(0xFF004F71), // MoMo Blue
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: _disbMsisdnController,
                        decoration: const InputDecoration(
                            labelText: 'Payee Phone (MSISDN)'),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _disbAmountController,
                        decoration:
                            const InputDecoration(labelText: 'Amount (EUR)'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed:
                      _isDisbursementsRunning ? null : _runDisbursementsFlow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004F71), // Solid MoMo Blue
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: isDark
                        ? const Color(0xFF143D56)
                        : const Color(0xFFE5E5E5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: _isDisbursementsRunning
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Disburse Funds (Transfer)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    _disbTxnState,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTerminalConsole(bool isDark) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.terminal,
                      color: Color(0xFFFFCB05),
                      size: 14), // MTN Sunshine Yellow
                  SizedBox(width: 6),
                  Text(
                    'LIVE SDK TERMINAL LOGS',
                    style: TextStyle(
                      color: Color(0xFFFFCB05),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _terminalLogs.clear();
                  });
                },
                child: const Text(
                  'CLEAR',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Color(0xFF2C2C2C), height: 10, thickness: 1),
          Expanded(
            child: ListView.builder(
              controller: _terminalScrollController,
              itemCount: _terminalLogs.length,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final logText = _terminalLogs[index];
                Color textColor = Colors.greenAccent;
                if (logText.contains('✗') ||
                    logText.contains('Error') ||
                    logText.contains('Exception')) {
                  textColor = Colors.redAccent;
                } else if (logText.contains('✓')) {
                  textColor = const Color(0xFFFFCB05); // MTN Sunshine Yellow
                } else if (logText.contains('System:')) {
                  textColor = Colors.white70;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    logText,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'Courier',
                      fontSize: 11,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
