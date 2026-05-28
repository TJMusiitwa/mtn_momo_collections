import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';
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
      TextEditingController(text: 'a9acc520ea7d487baa58af01167d5659');
  final _userIdController = TextEditingController();
  final _apiKeyController = TextEditingController();
  final _collectMsisdnController = TextEditingController(text: '256772123456');
  final _collectAmountController = TextEditingController(text: '5000');
  final _disbMsisdnController = TextEditingController(text: '256772987654');
  final _disbAmountController = TextEditingController(text: '12000');

  // Interactive UI States
  bool _isProvisioning = false;
  bool _isCollectionsRunning = false;
  bool _isDisbursementsRunning = false;

  // Active status values
  String _colBalance = '—';
  String _disbBalance = '—';
  String _colTxnState = 'No active transaction';
  String _disbTxnState = 'No active transaction';

  // Live Terminal Logs
  final List<String> _terminalLogs = [];
  final ScrollController _terminalScrollController = ScrollController();

  // Unified Momo SDK wrapper
  MomoCollections? _momo;

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

  /// Instantiates the client wrapper using current fields.
  bool _initializeClient() {
    if (_momo != null) return true;

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

    _momo = MomoCollections(
      baseUrl: 'https://sandbox.momodeveloper.mtn.com',
      subscriptionKey: subKey,
      userId: uid,
      apiKey: key,
      targetEnvironment: 'sandbox',
    );
    _logTerminal('Client: MtnMomoClient coordinate initialized successfully.');
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
      _momo = null; // Reset existing wrapper
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
      final balance = await _momo!.collection.getAccountBalance();
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
      await _momo!.collection.validateAccountHolderStatus(
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

      await _momo!.collection.requesttoPay(
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

        final status = await _momo!.collection.requesttoPayTransactionStatus(
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
      final balance = await _momo!.disbursements.getAccountBalance();
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
      await _momo!.disbursements.validateAccountHolderStatus(
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

      await _momo!.disbursements.transfer(
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

        final status = await _momo!.disbursements.getTransferStatus(
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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
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
              child:
                  const Icon(Icons.wallet, color: Color(0xFF004F71), size: 20),
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
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
          ),
          _buildTerminalConsole(isDark),
        ],
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
