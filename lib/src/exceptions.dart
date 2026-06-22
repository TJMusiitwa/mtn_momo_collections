import 'package:dio/dio.dart';
import 'package:mtn_momo_sdk/src/generated/export.dart';

/// Sane representation of MTN MoMo API error codes based on official documentation:
/// https://momodeveloper.mtn.com/api-documentation/common-error
enum MtnMomoErrorCode {
  payeeNotFound(
    'PAYEE_NOT_FOUND',
    'The MSISDN of the intended recipient is invalid or not registered for Mobile Money.',
  ),
  payerNotFound(
    'PAYER_NOT_FOUND',
    'The MSISDN of the person from whom money is being requested does not exist or is invalid.',
  ),
  invalidCallbackUrlHost(
    'INVALID_CALLBACK_URL_HOST',
    'The callback URL host is invalid (must use a hostname, not an IP address).',
  ),
  invalidReferenceId(
    'INVALID_REFERENCE_ID',
    'The reference ID (UUID) is invalid or improperly formatted.',
  ),
  resourceNotFound(
    'RESOURCE_NOT_FOUND',
    'The requested resource (transaction/pre-approval/invoice) could not be located.',
  ),
  resourceAlreadyExist(
    'RESOURCE_ALREADY_EXIST',
    'A resource with the specified reference ID already exists.',
  ),
  payerLimitReached(
    'PAYER_LIMIT_REACHED',
    'The payer has reached their transaction or wallet limits set for their account.',
  ),
  approvalRejected(
    'APPROVAL_REJECTED',
    'The transaction was manually rejected or timed out by the customer.',
  ),
  notEnoughFunds(
    'NOT_ENOUGH_FUNDS',
    'The customer\'s wallet has insufficient funds to complete this transaction.',
  ),
  senderAccountNotActive(
    'SENDER_ACCOUNT_NOT_ACTIVE',
    'The sender\'s account/wallet is not active.',
  ),
  internalProcessingError(
    'INTERNAL_PROCESSING_ERROR',
    'An internal processing error occurred on the MoMo Wallet platform (often due to insufficient funds or service issues).',
  ),
  couldNotPerformTransaction(
    'COULD_NOT_PERFORM_TRANSACTION',
    'The MoMo system could not perform the transaction at this time.',
  ),
  genericError(
    'GENERIC_ERROR',
    'A generic error occurred during the transaction execution.',
  ),
  forbiddenIp(
    'FORBIDDEN_IP',
    'The originating IP address is not authorized/whitelisted.',
  ),
  accessDenied(
    'ACCESS_DENIED',
    'Invalid subscription key or inactive product subscription.',
  ),
  notAllowedTargetEnvironment(
    'NOT_ALLOWED_TARGET_ENVIRONMENT',
    'Access to target environment is forbidden.',
  ),
  unknown('unknown', 'An unknown or unmapped error occurred.');

  final String code;
  final String description;

  const MtnMomoErrorCode(this.code, this.description);

  static MtnMomoErrorCode fromCode(String? code) {
    if (code == null) return MtnMomoErrorCode.unknown;
    return MtnMomoErrorCode.values.firstWhere(
      (e) => e.code.toUpperCase() == code.toUpperCase(),
      orElse: () => MtnMomoErrorCode.unknown,
    );
  }
}

/// Base class for all exceptions thrown by the MTN MoMo SDK.
/// Extends [DioException] to maintain compatibility with standard Dio pipelines
/// and to allow clean integration with existing error interceptors.
class MtnMomoException extends DioException {
  MtnMomoException({
    required super.requestOptions,
    super.response,
    super.type = DioExceptionType.badResponse,
    super.error,
    super.stackTrace,
    super.message,
  });

  @override
  String toString() => 'MtnMomoException: $message';
}

/// Thrown when there are network timeouts, handshake failures, or offline states.
class MtnMomoNetworkException extends MtnMomoException {
  MtnMomoNetworkException({
    required super.requestOptions,
    super.response,
    required super.type,
    super.error,
    super.stackTrace,
    super.message,
  });

  @override
  String toString() => 'MtnMomoNetworkException [$type]: $message';
}

/// Thrown when the subscription key is invalid, missing, or inactive (HTTP 401).
class MtnMomoAuthException extends MtnMomoException {
  final String? details;

  MtnMomoAuthException({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
    super.stackTrace,
    super.message,
    this.details,
  });

  @override
  String toString() =>
      'MtnMomoAuthException: $message${details != null ? ' ($details)' : ''}';
}

/// Thrown when access is forbidden, e.g., the IP is not whitelisted (HTTP 403).
class MtnMomoForbiddenException extends MtnMomoException {
  MtnMomoForbiddenException({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
    super.stackTrace,
    super.message,
  });

  @override
  String toString() => 'MtnMomoForbiddenException: $message';
}

/// Thrown when the requested resource (e.g. transaction status) is not found (HTTP 404).
class MtnMomoNotFoundException extends MtnMomoException {
  MtnMomoNotFoundException({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
    super.stackTrace,
    super.message,
  });

  @override
  String toString() => 'MtnMomoNotFoundException: $message';
}

/// Thrown when a duplicate reference ID is supplied to a transaction creation (HTTP 409).
class MtnMomoConflictException extends MtnMomoException {
  MtnMomoConflictException({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
    super.stackTrace,
    super.message,
  });

  @override
  String toString() => 'MtnMomoConflictException: $message';
}

/// Thrown when the MTN MoMo server returns an internal error (HTTP 500/503).
class MtnMomoServerException extends MtnMomoException {
  MtnMomoServerException({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
    super.stackTrace,
    super.message,
  });

  @override
  String toString() => 'MtnMomoServerException: $message';
}

/// Thrown when MTN MoMo returns a structured transaction or business logic error.
class MtnMomoTransactionException extends MtnMomoException {
  final MtnMomoErrorCode errorCode;

  MtnMomoTransactionException({
    required super.requestOptions,
    super.response,
    super.type,
    super.error,
    super.stackTrace,
    super.message,
    required this.errorCode,
  });

  @override
  String toString() =>
      'MtnMomoTransactionException [${errorCode.code}]: $message\nDetails: ${errorCode.description}';
}

/// Helper method to translate a standard [DioException] to a clean [MtnMomoException].
MtnMomoException mapDioException(DioException error) {
  final response = error.response;

  // Handle connection timeouts or network errors
  if (response == null) {
    return MtnMomoNetworkException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: error.error,
      stackTrace: error.stackTrace,
      message: error.message ?? 'A connection error occurred.',
    );
  }

  final status = response.statusCode;
  final data = response.data;

  // Try parsing structural error reason if present
  ErrorReason? errorReason;
  if (data is Map) {
    try {
      final mapData = Map<String, dynamic>.from(data);
      errorReason = ErrorReason.fromJson(mapData);
    } catch (_) {
      // Body did not conform to ErrorReason structure
    }
  }

  // 1. Handle HTTP 401 Unauthorized (Auth and Subscription issues)
  if (status == 401) {
    String message = 'Access Denied: Invalid credentials or subscription key.';
    String? details;

    if (data is Map) {
      try {
        final mapData = Map<String, dynamic>.from(data);
        final token401 = TokenPost401ApplicationJsonResponse.fromJson(mapData);
        if (token401.error != null) {
          details = token401.error;
        }
      } catch (_) {}
    }

    if (errorReason != null) {
      message = errorReason.message ?? message;
      details = errorReason.code?.name ?? details;
    }

    return MtnMomoAuthException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: error.error,
      stackTrace: error.stackTrace,
      message: message,
      details: details,
    );
  }

  // 2. Handle HTTP 403 Forbidden (e.g. IP block)
  if (status == 403) {
    final message =
        errorReason?.message ??
        'Forbidden: Access to this API resource is denied (check IP whitelist).';
    return MtnMomoForbiddenException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: error.error,
      stackTrace: error.stackTrace,
      message: message,
    );
  }

  // 3. Handle HTTP 404 Not Found
  if (status == 404) {
    final message = errorReason?.message ?? 'Resource not found.';
    return MtnMomoNotFoundException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: error.error,
      stackTrace: error.stackTrace,
      message: message,
    );
  }

  // 4. Handle HTTP 409 Conflict (Duplicate resource reference)
  if (status == 409) {
    final message =
        errorReason?.message ?? 'Conflict: Resource already exists.';
    return MtnMomoConflictException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: error.error,
      stackTrace: error.stackTrace,
      message: message,
    );
  }

  // 5. Handle HTTP 500 / 503 Server Errors
  if (status == 500 || status == 503) {
    final message = errorReason?.message ?? 'MTN MoMo Server Error.';
    // If the server returns a specific code, let's treat it as a transaction error
    if (data is Map) {
      final rawCode = data['code']?.toString();
      if (rawCode != null) {
        final code = MtnMomoErrorCode.fromCode(rawCode);
        return MtnMomoTransactionException(
          requestOptions: error.requestOptions,
          response: error.response,
          type: error.type,
          error: error.error,
          stackTrace: error.stackTrace,
          message: message,
          errorCode: code,
        );
      }
    }
    return MtnMomoServerException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: error.error,
      stackTrace: error.stackTrace,
      message: message,
    );
  }

  // 6. Sift for generic structured transaction errors (extracting from raw map first for future-proofing)
  if (data is Map) {
    final rawCode = data['code']?.toString();
    final rawMessage = data['message']?.toString();
    if (rawCode != null) {
      final code = MtnMomoErrorCode.fromCode(rawCode);
      return MtnMomoTransactionException(
        requestOptions: error.requestOptions,
        response: error.response,
        type: error.type,
        error: error.error,
        stackTrace: error.stackTrace,
        message:
            rawMessage ?? errorReason?.message ?? 'Transaction error occurred.',
        errorCode: code,
      );
    }
  }

  // Fallback generic exception
  return MtnMomoException(
    requestOptions: error.requestOptions,
    response: error.response,
    type: error.type,
    error: error.error,
    stackTrace: error.stackTrace,
    message:
        errorReason?.message ??
        'An unexpected API error occurred (Status: $status).',
  );
}
