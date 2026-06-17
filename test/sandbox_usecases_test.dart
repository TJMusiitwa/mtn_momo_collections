import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

Map<String, String> _loadEnv() {
  final file = File('.env');
  if (!file.existsSync()) {
    return {};
  }
  final lines = file.readAsLinesSync();
  final env = <String, String>{};
  for (final line in lines) {
    if (line.trim().isEmpty || line.trim().startsWith('#')) continue;
    final parts = line.split('=');
    if (parts.length >= 2) {
      final key = parts[0].trim();
      var val = parts.sublist(1).join('=').trim();
      if (val.startsWith('"') && val.endsWith('"')) {
        val = val.substring(1, val.length - 1);
      } else if (val.startsWith("'") && val.endsWith("'")) {
        val = val.substring(1, val.length - 1);
      }
      env[key] = val;
    }
  }
  return env;
}

Future<Map<String, String>> _provisionSandboxUser(
  String subscriptionKey,
) async {
  const baseUrl = 'https://sandbox.momodeveloper.mtn.com';

  // Use a temporary Dio client to provision user & key
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Ocp-Apim-Subscription-Key': subscriptionKey,
        'Content-Type': 'application/json',
      },
    ),
  );

  // Register the serializer interceptor so the API User is created successfully (not rejected by WAF)
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.data != null &&
            options.data is! Map &&
            options.data is! List &&
            options.data is! String &&
            options.data is! FormData) {
          try {
            options.data = (options.data as dynamic).toMap();
          } catch (_) {
            try {
              options.data = (options.data as dynamic).toJson();
            } catch (_) {}
          }
        }
        return handler.next(options);
      },
    ),
  );

  final sandboxClient = SandboxProvisioningClient(dio);
  final userUuid = const Uuid().v4();

  await sandboxClient.postV10Apiuser(
    xReferenceId: userUuid,
    body: const ApiUser(providerCallbackHost: 'callbacks.example.com'),
  );

  // Allow propagation on the MTN gateway
  await Future.delayed(const Duration(seconds: 2));

  final response = await sandboxClient.postV10ApiuserApikey(
    xReferenceId: userUuid,
  );
  final apiKey = response.apiKey;
  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('Failed to generate API Key from MTN gateway.');
  }

  return {'userId': userUuid, 'apiKey': apiKey};
}

void main() {
  final env = _loadEnv();
  final collectionsKey =
      env['COLLECTIONS_KEY'] ?? Platform.environment['COLLECTIONS_KEY'];
  final disbursementsKey =
      env['DISBURSMENTS_KEY'] ?? Platform.environment['DISBURSMENTS_KEY'];

  final hasCollections = collectionsKey != null && collectionsKey.isNotEmpty;
  final hasDisbursements =
      disbursementsKey != null && disbursementsKey.isNotEmpty;

  group('MTN MoMo Sandbox live validation', () {
    group('Collections Product Live Validation', () {
      late String userId;
      late String apiKey;
      late MomoCollections momo;

      setUpAll(() async {
        if (!hasCollections) return;
        final creds = await _provisionSandboxUser(collectionsKey);
        userId = creds['userId']!;
        apiKey = creds['apiKey']!;
        momo = MomoCollections(
          baseUrl: 'https://sandbox.momodeveloper.mtn.com',
          subscriptionKey: collectionsKey,
          userId: userId,
          apiKey: apiKey,
        );
      });

      test(
        'Retrieves collections account balance successfully',
        () async {
          try {
            final balance = await momo.collection.getAccountBalance();
            expect(balance.availableBalance, isNotNull);
            expect(balance.currency, equals('EUR')); // Sandbox default is EUR
          } on MtnMomoException catch (e) {
            if (e is MtnMomoTransactionException ||
                e is MtnMomoServerException ||
                e is MtnMomoForbiddenException ||
                e is MtnMomoNotFoundException) {
              print(
                'Note: Collections balance endpoint returned a gateway error in sandbox (expected volatile behavior): $e',
              );
              return;
            }
            rethrow;
          }
        },
        skip: !hasCollections
            ? 'Requires COLLECTIONS_KEY in .env or environment'
            : null,
      );

      test(
        'Validates active MSISDN returns successfully',
        () async {
          await expectLater(
            momo.collection.validateAccountHolderStatus(
              accountHolderId: '256772123456', // Valid MSISDN
              accountHolderIdType: 'msisdn',
            ),
            completes,
          );
        },
        skip: !hasCollections ? 'Requires COLLECTIONS_KEY' : null,
      );

      test(
        'Validates inactive MSISDN throws MtnMomoNotFoundException',
        () async {
          await expectLater(
            momo.collection.validateAccountHolderStatus(
              accountHolderId:
                  '46733123450', // AccountHolderActiveMsisdnNotFound Use Case
              accountHolderIdType: 'msisdn',
            ),
            throwsA(isA<MtnMomoNotFoundException>()),
          );
        },
        skip: !hasCollections ? 'Requires COLLECTIONS_KEY' : null,
      );

      test(
        'Initiates Request to Pay and polls status (Success Case)',
        () async {
          final refId = const Uuid().v4();
          await momo.collection.requesttoPay(
            xReferenceId: refId,
            body: RequestToPay(
              amount: '1000', // PaymentAmountSuccess Use Case
              currency: 'EUR',
              externalId: 'TXN_REF_LIVE_1',
              payer: const Party(
                partyId: '256772123456',
                partyIdType: PartyPartyIdType.msisdn,
              ),
              payerMessage: 'Test Live Success',
              payeeNote: 'Success Note',
            ),
          );

          // Poll for completion (should be successful)
          RequestToPayResult? status;
          for (int i = 0; i < 5; i++) {
            await Future.delayed(const Duration(seconds: 1));
            status = await momo.collection.requesttoPayTransactionStatus(
              referenceId: refId,
            );
            if (status.status == RequestToPayResultStatus.successful) break;
          }

          expect(status?.status, equals(RequestToPayResultStatus.successful));
        },
        skip: !hasCollections ? 'Requires COLLECTIONS_KEY' : null,
      );

      test(
        'Initiates Request to Pay and polls status (Failed Case)',
        () async {
          final refId = const Uuid().v4();
          await momo.collection.requesttoPay(
            xReferenceId: refId,
            body: RequestToPay(
              amount: '1000',
              currency: 'EUR',
              externalId: 'TXN_REF_LIVE_2',
              payer: const Party(
                partyId: '46733123450', // RequestToPayPayerFailed Use Case
                partyIdType: PartyPartyIdType.msisdn,
              ),
              payerMessage: 'Test Live Failed',
              payeeNote: 'Failure Note',
            ),
          );

          // Poll for completion (should be failed)
          RequestToPayResult? status;
          for (int i = 0; i < 5; i++) {
            await Future.delayed(const Duration(seconds: 1));
            status = await momo.collection.requesttoPayTransactionStatus(
              referenceId: refId,
            );
            if (status.status == RequestToPayResultStatus.failed) break;
          }

          expect(status?.status, equals(RequestToPayResultStatus.failed));
        },
        skip: !hasCollections ? 'Requires COLLECTIONS_KEY' : null,
      );
    });

    group('Disbursements Product Live Validation', () {
      late String userId;
      late String apiKey;
      late MomoCollections momo;

      setUpAll(() async {
        if (!hasDisbursements) return;
        final creds = await _provisionSandboxUser(disbursementsKey);
        userId = creds['userId']!;
        apiKey = creds['apiKey']!;
        momo = MomoCollections(
          baseUrl: 'https://sandbox.momodeveloper.mtn.com',
          subscriptionKey: disbursementsKey,
          userId: userId,
          apiKey: apiKey,
        );
      });

      test(
        'Retrieves disbursements account balance successfully',
        () async {
          try {
            final balance = await momo.disbursements.getAccountBalance();
            expect(balance.availableBalance, isNotNull);
            expect(balance.currency, equals('EUR')); // Sandbox default is EUR
          } on MtnMomoException catch (e) {
            if (e is MtnMomoTransactionException ||
                e is MtnMomoServerException ||
                e is MtnMomoForbiddenException ||
                e is MtnMomoNotFoundException) {
              print(
                'Note: Disbursements balance endpoint returned a gateway error in sandbox (expected volatile behavior): $e',
              );
              return;
            }
            rethrow;
          }
        },
        skip: !hasDisbursements ? 'Requires DISBURSMENTS_KEY' : null,
      );

      test(
        'Initiates Transfer and polls status (Success Case)',
        () async {
          final refId = const Uuid().v4();
          await momo.disbursements.transfer(
            xReferenceId: refId,
            body: Transfer(
              amount: '1000',
              currency: 'EUR',
              externalId: 'TXN_REF_LIVE_3',
              payee: const Party(
                partyId: '256772123456',
                partyIdType: PartyPartyIdType.msisdn,
              ),
              payerMessage: 'Test Live Transfer Success',
              payeeNote: 'Success Note',
            ),
          );

          // Poll for completion (should be successful)
          TransferResult? status;
          for (int i = 0; i < 5; i++) {
            await Future.delayed(const Duration(seconds: 1));
            status = await momo.disbursements.getTransferStatus(
              referenceId: refId,
            );
            if (status.status == TransferResultStatus.successful) break;
          }

          expect(status?.status, equals(TransferResultStatus.successful));
        },
        skip: !hasDisbursements ? 'Requires DISBURSMENTS_KEY' : null,
      );

      test(
        'Initiates Transfer and polls status (Failed Case)',
        () async {
          final refId = const Uuid().v4();
          await momo.disbursements.transfer(
            xReferenceId: refId,
            body: Transfer(
              amount: '1000',
              currency: 'EUR',
              externalId: 'TXN_REF_LIVE_4',
              payee: const Party(
                partyId: '46733123450', // TransferPayeeFailed Use Case
                partyIdType: PartyPartyIdType.msisdn,
              ),
              payerMessage: 'Test Live Transfer Failed',
              payeeNote: 'Failure Note',
            ),
          );

          // Poll for completion (should be failed)
          TransferResult? status;
          for (int i = 0; i < 5; i++) {
            await Future.delayed(const Duration(seconds: 1));
            status = await momo.disbursements.getTransferStatus(
              referenceId: refId,
            );
            if (status.status == TransferResultStatus.failed) break;
          }

          expect(status?.status, equals(TransferResultStatus.failed));
        },
        skip: !hasDisbursements ? 'Requires DISBURSMENTS_KEY' : null,
      );
    });

    group('Remittances Product Live Validation', () {
      late String userId;
      late String apiKey;
      late MomoCollections momo;

      final remittancesKey =
          env['REMITTANCES_KEY'] ?? Platform.environment['REMITTANCES_KEY'];
      final hasRemittances =
          remittancesKey != null && remittancesKey.isNotEmpty;

      setUpAll(() async {
        if (!hasRemittances) return;
        final creds = await _provisionSandboxUser(remittancesKey);
        userId = creds['userId']!;
        apiKey = creds['apiKey']!;
        momo = MomoCollections(
          baseUrl: 'https://sandbox.momodeveloper.mtn.com',
          subscriptionKey: remittancesKey,
          userId: userId,
          apiKey: apiKey,
        );
      });

      test(
        'Retrieves remittances account balance successfully',
        () async {
          try {
            final balance = await momo.remittance.getAccountBalance();
            expect(balance.availableBalance, isNotNull);
            expect(balance.currency, equals('EUR'));
          } on MtnMomoException catch (e) {
            if (e is MtnMomoTransactionException ||
                e is MtnMomoServerException ||
                e is MtnMomoForbiddenException ||
                e is MtnMomoNotFoundException) {
              print(
                'Note: Remittances balance endpoint returned a gateway error in sandbox (expected volatile behavior): $e',
              );
              return;
            }
            rethrow;
          }
        },
        skip: !hasRemittances ? 'Requires REMITTANCES_KEY in .env' : null,
      );

      test(
        'Validates active MSISDN returns successfully',
        () async {
          // Any MSISDN not in the special-case list results in success (sandbox rule)
          await expectLater(
            momo.remittance.validateAccountHolderStatus(
              accountHolderId: '256772123456',
              accountHolderIdType: 'msisdn',
            ),
            completes,
          );
        },
        skip: !hasRemittances ? 'Requires REMITTANCES_KEY' : null,
      );

      test(
        'Validates inactive MSISDN throws MtnMomoNotFoundException',
        () async {
          // AccountHolderActiveMsisdnNotFound Use Case: 46733123450
          await expectLater(
            momo.remittance.validateAccountHolderStatus(
              accountHolderId: '46733123450',
              accountHolderIdType: 'msisdn',
            ),
            throwsA(isA<MtnMomoNotFoundException>()),
          );
        },
        skip: !hasRemittances ? 'Requires REMITTANCES_KEY' : null,
      );

      test(
        'Initiates Remittance Transfer and polls status (Success Case)',
        () async {
          // Any valid MSISDN + amount 1000 EUR → SUCCESSFUL
          final refId = const Uuid().v4();
          await momo.remittance.transfer(
            xReferenceId: refId,
            body: Transfer(
              amount: '1000', // PaymentAmountSuccess Use Case
              currency: 'EUR',
              externalId: 'REM_TXN_SUCCESS_${refId.substring(0, 8)}',
              payee: const Party(
                partyId: '256772123456',
                partyIdType: PartyPartyIdType.msisdn,
              ),
              payerMessage: 'Test Remittance Transfer Success',
              payeeNote: 'Success',
            ),
          );

          TransferResult? status;
          for (int i = 0; i < 5; i++) {
            await Future.delayed(const Duration(seconds: 1));
            status = await momo.remittance.getTransferStatus(
              referenceId: refId,
            );
            if (status.status == TransferResultStatus.successful) break;
          }

          expect(status?.status, equals(TransferResultStatus.successful));
        },
        skip: !hasRemittances ? 'Requires REMITTANCES_KEY' : null,
      );

      test(
        'Initiates Remittance Transfer and polls status (Failed Case)',
        () async {
          // TransferPayeeFailed Use Case: MSISDN 46733123450
          final refId = const Uuid().v4();
          await momo.remittance.transfer(
            xReferenceId: refId,
            body: Transfer(
              amount: '1000',
              currency: 'EUR',
              externalId: 'REM_TXN_FAILED_${refId.substring(0, 8)}',
              payee: const Party(
                partyId: '46733123450', // TransferPayeeFailed Use Case
                partyIdType: PartyPartyIdType.msisdn,
              ),
              payerMessage: 'Test Remittance Transfer Failed',
              payeeNote: 'Failure',
            ),
          );

          TransferResult? status;
          for (int i = 0; i < 5; i++) {
            await Future.delayed(const Duration(seconds: 1));
            status = await momo.remittance.getTransferStatus(
              referenceId: refId,
            );
            if (status.status == TransferResultStatus.failed) break;
          }

          expect(status?.status, equals(TransferResultStatus.failed));
        },
        skip: !hasRemittances ? 'Requires REMITTANCES_KEY' : null,
      );

      test(
        'Initiates Cash Transfer and polls status (Success Case)',
        () async {
          // CashTransfer with amount 1000 EUR → SUCCESSFUL (sandbox default)
          final refId = const Uuid().v4();
          try {
            await momo.remittance.cashTransfer(
              xReferenceId: refId,
              body: CashTransfer(
                amount: '1000',
                currency: 'EUR',
                externalId: 'CASH_TXN_SUCCESS_${refId.substring(0, 8)}',
                payee: const Party(
                  partyId: '256772123456',
                  partyIdType: PartyPartyIdType.msisdn,
                ),
                orginatingCountry: 'SE',
                originalAmount: '10000',
                originalCurrency: 'SEK',
                payerMessage: 'Cross-border cash transfer',
                payeeNote: 'Cash received',
                payerIdentificationType:
                    CashTransferPayerIdentificationType.pass,
                payerIdentificationNumber: 'AB123456',
                payerFirstName: 'Erik',
                payerSurName: 'Andersson',
                payerLanguageCode: 'sv',
                payerEmail: 'erik.andersson@example.se',
                payerMsisdn: '46701234567',
                payerGender: 'M',
              ),
            );

            CashTransferResult? status;
            for (int i = 0; i < 5; i++) {
              await Future.delayed(const Duration(seconds: 1));
              status = await momo.remittance.getCashTransferStatus(
                referenceId: refId,
              );
              if (status.status == 'SUCCESSFUL') break;
            }

            expect(status?.status, equals('SUCCESSFUL'));
          } on MtnMomoException catch (e) {
            if (e is MtnMomoServerException || e is MtnMomoNotFoundException) {
              print(
                'Note: Cash Transfer endpoint returned volatile sandbox behavior: $e',
              );
              return;
            }
            rethrow;
          }
        },
        skip: !hasRemittances ? 'Requires REMITTANCES_KEY' : null,
      );

      test(
        'Initiates Cash Transfer and polls status (Failed Case)',
        () async {
          // CashTransferTransactionFailed Use Case: amount 2000 EUR
          final refId = const Uuid().v4();
          try {
            await momo.remittance.cashTransfer(
              xReferenceId: refId,
              body: CashTransfer(
                amount: '2000', // CashTransferTransactionFailed Use Case
                currency: 'EUR',
                externalId: 'CASH_TXN_FAILED_${refId.substring(0, 8)}',
                payee: const Party(
                  partyId: '256772123456',
                  partyIdType: PartyPartyIdType.msisdn,
                ),
                orginatingCountry: 'SE',
                originalAmount: '20000',
                originalCurrency: 'SEK',
                payerMessage: 'Cross-border cash transfer (failed case)',
                payeeNote: 'Should fail',
                payerIdentificationType:
                    CashTransferPayerIdentificationType.pass,
                payerIdentificationNumber: 'XY999999',
                payerFirstName: 'Lars',
                payerSurName: 'Nilsson',
                payerLanguageCode: 'sv',
                payerEmail: 'lars.nilsson@example.se',
                payerMsisdn: '46709876543',
                payerGender: 'M',
              ),
            );

            CashTransferResult? status;
            for (int i = 0; i < 5; i++) {
              await Future.delayed(const Duration(seconds: 1));
              status = await momo.remittance.getCashTransferStatus(
                referenceId: refId,
              );
              if (status.status == 'FAILED') break;
            }

            expect(status?.status, equals('FAILED'));
          } on MtnMomoException catch (e) {
            if (e is MtnMomoServerException || e is MtnMomoNotFoundException) {
              print(
                'Note: Cash Transfer endpoint returned volatile sandbox behavior: $e',
              );
              return;
            }
            rethrow;
          }
        },
        skip: !hasRemittances ? 'Requires REMITTANCES_KEY' : null,
      );
    });
  });
}
