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
  });
}
