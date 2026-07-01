import 'package:dio/dio.dart';
import 'package:mtn_momo_sdk/mtn_momo_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('Exceptions Mapping', () {
    final requestOptions = RequestOptions(path: '/test');

    test('maps connection error to MtnMomoNetworkException', () {
      final dioError = DioException(
        requestOptions: requestOptions,
        type: DioExceptionType.connectionTimeout,
        message: 'Timeout occurred',
      );

      final result = mapDioException(dioError);
      expect(result, isA<MtnMomoNetworkException>());
      expect(result.message, contains('Timeout occurred'));
    });

    test('maps HTTP 401 to MtnMomoAuthException', () {
      final dioError = DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 401,
          data: {'error': 'invalid_client'},
        ),
      );

      final result = mapDioException(dioError);
      expect(result, isA<MtnMomoAuthException>());
      final authEx = result as MtnMomoAuthException;
      expect(authEx.details, equals('invalid_client'));
    });

    test('maps HTTP 403 to MtnMomoForbiddenException', () {
      final dioError = DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 403,
          data: {'message': 'IP not whitelisted'},
        ),
      );

      final result = mapDioException(dioError);
      expect(result, isA<MtnMomoForbiddenException>());
      expect(result.message, equals('IP not whitelisted'));
    });

    test('maps HTTP 404 to MtnMomoNotFoundException', () {
      final dioError = DioException(
        requestOptions: requestOptions,
        response: Response(requestOptions: requestOptions, statusCode: 404),
      );

      final result = mapDioException(dioError);
      expect(result, isA<MtnMomoNotFoundException>());
    });

    test('maps HTTP 409 to MtnMomoConflictException', () {
      final dioError = DioException(
        requestOptions: requestOptions,
        response: Response(requestOptions: requestOptions, statusCode: 409),
      );

      final result = mapDioException(dioError);
      expect(result, isA<MtnMomoConflictException>());
    });

    test('maps specific transaction errors to MtnMomoTransactionException', () {
      final dioError = DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 400,
          data: {
            'code': 'PAYER_LIMIT_REACHED',
            'message': 'Limit has been reached.',
          },
        ),
      );

      final result = mapDioException(dioError);
      expect(result, isA<MtnMomoTransactionException>());
      final transEx = result as MtnMomoTransactionException;
      expect(transEx.errorCode, equals(MtnMomoErrorCode.payerLimitReached));
      expect(transEx.message, equals('Limit has been reached.'));
    });

    test('maps target environment error to MtnMomoTransactionException', () {
      final dioError = DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 400,
          data: {
            'code': 'NOT_ALLOWED_TARGET_ENVIRONMENT',
            'message': 'Access to target environment is forbidden.',
          },
        ),
      );

      final result = mapDioException(dioError);
      expect(result, isA<MtnMomoTransactionException>());
      final transEx = result as MtnMomoTransactionException;
      expect(
        transEx.errorCode,
        equals(MtnMomoErrorCode.notAllowedTargetEnvironment),
      );
    });

    test('maps unexpected status code to MtnMomoUnexpectedException', () {
      final dioError = DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 502,
          data: {'message': 'Proxy error'},
        ),
      );

      final result = mapDioException(dioError);
      expect(result, isA<MtnMomoUnexpectedException>());
      expect(result.message, equals('Proxy error'));
    });
  });
}
