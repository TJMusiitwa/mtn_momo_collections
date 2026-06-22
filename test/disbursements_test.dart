import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';
import 'package:test/test.dart';

class MockHttpClientAdapter implements HttpClientAdapter {
  ResponseBody Function(RequestOptions options)? handler;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path.contains('/token')) {
      return ResponseBody.fromString(
        '{"access_token": "mock_disbursement_token", "token_type": "Bearer", "expires_in": 3600}',
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }
    if (handler != null) {
      return handler!(options);
    }
    return ResponseBody.fromString(
      '{"status": "ok"}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('MomoCollections Disbursements API', () {
    const baseUrl = 'https://sandbox.momodeveloper.mtn.com';
    const subKey = 'test_sub_key';
    const userId = 'test_user_id';
    const apiKey = 'test_api_key';

    late MomoCollections momo;
    late MockHttpClientAdapter mockAdapter;

    setUp(() {
      momo = MomoCollections(
        baseUrl: baseUrl,
        subscriptionKey: subKey,
        userId: userId,
        apiKey: apiKey,
      );
      mockAdapter = MockHttpClientAdapter();
      momo.dio.httpClientAdapter = mockAdapter;
    });

    test(
      'validateAccountHolderStatus returns successfully for active msisdn',
      () async {
        mockAdapter.handler = (options) {
          if (options.path.contains(
                '/v1_0/accountholder/msisdn/256772123456/active',
              ) &&
              options.method == 'GET') {
            return ResponseBody.fromString(
              '',
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            );
          }
          return ResponseBody.fromString('Not Found', 404);
        };

        await expectLater(
          momo.disbursements.validateAccountHolderStatus(
            accountHolderId: '256772123456',
            accountHolderIdType: 'msisdn',
          ),
          completes,
        );
      },
    );

    test('transfer completes successfully with valid request body', () async {
      const refId = 'c0a80101-0000-0000-0000-000000000001';
      final transferPayload = Transfer(
        amount: '10000',
        currency: 'EUR',
        externalId: '12345',
        payee: const Party(
          partyId: '256772123456',
          partyIdType: PartyPartyIdType.msisdn,
        ),
        payerMessage: 'Paying recipient',
        payeeNote: 'Received disbursement',
      );

      mockAdapter.handler = (options) {
        if (options.path.contains('/v1_0/transfer') &&
            options.method == 'POST' &&
            options.headers['X-Reference-Id'] == refId) {
          return ResponseBody.fromString(
            '',
            202,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );
        }
        return ResponseBody.fromString('Bad Request', 400);
      };

      await expectLater(
        momo.disbursements.transfer(xReferenceId: refId, body: transferPayload),
        completes,
      );
    });

    test(
      'getTransferStatus returns correct transfer result status and details',
      () async {
        const refId = 'c0a80101-0000-0000-0000-000000000001';

        mockAdapter.handler = (options) {
          if (options.path.contains('/v1_0/transfer/$refId') &&
              options.method == 'GET') {
            return ResponseBody.fromString(
              jsonEncode({
                'amount': '10000',
                'currency': 'EUR',
                'financialTransactionId': 'fin-10101',
                'externalId': '12345',
                'status': 'SUCCESSFUL',
                'payerCorrelationId': '98765',
                'payee': {'partyId': '256772123456', 'partyIdType': 'MSISDN'},
              }),
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            );
          }
          return ResponseBody.fromString('Not Found', 404);
        };

        final result = await momo.disbursements.getTransferStatus(
          referenceId: refId,
        );

        expect(result.amount, equals('10000'));
        expect(result.currency, equals('EUR'));
        expect(result.financialTransactionId, equals('fin-10101'));
        expect(result.externalId, equals('12345'));
        expect(result.status, equals(TransferResultStatus.successful));
        expect(result.payee?.partyId, equals('256772123456'));
      },
    );

    test('getAccountBalance returns disbursements balance details', () async {
      mockAdapter.handler = (options) {
        if (options.path.contains('/v1_0/account/balance') &&
            options.method == 'GET') {
          return ResponseBody.fromString(
            jsonEncode({'availableBalance': '50000.00', 'currency': 'UGX'}),
            200,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );
        }
        return ResponseBody.fromString('Not Found', 404);
      };

      final balance = await momo.disbursements.getAccountBalance();

      expect(balance.availableBalance, equals('50000.00'));
      expect(balance.currency, equals('UGX'));
    });
  });
}
