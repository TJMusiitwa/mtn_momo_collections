// ignore_for_file: avoid_print
import 'package:logger/logger.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';

final _logger = Logger(
  printer: SimplePrinter(colors: true),
);

/// Standalone CLI Example: Resilient Error Handling
///
/// Demonstrates how the SDK translates flat Dio errors and status codes
/// into a rich, structured `MtnMomoException` hierarchy.
/// Also showcases how to catch business-logic failures using the `MtnMomoErrorCode`
/// enum to display clean, helpful messages to your end-users.
///
/// Run this example using:
/// `dart example/resilient_error_handling_example.dart`
void main() async {
  print('==================================================');
  print('   MTN MoMo Resilient Error Handling Example');
  print('==================================================');

  // --- Configuration with purposefully invalid API key to trigger error ---
  final momo = MomoCollections(
    baseUrl: 'https://sandbox.momodeveloper.mtn.com',
    subscriptionKey: 'a9acc520ea7d487baa58af01167d5659',
    userId: 'a5db8b08-3067-4221-a3f2-ef971e467d5c',
    apiKey: 'INVALID_API_KEY_ON_PURPOSE',
    targetEnvironment: 'sandbox',
  );

  _logger.i(
      'Attempting balance check with invalid credentials to demonstrate error mapping...');

  try {
    // This call will fail authentication because of the invalid API Key
    await momo.collection.getAccountBalance();
  } on MtnMomoNetworkException catch (e) {
    _logger.e('1. NETWORK ERROR caught!');
    _logger.w('   Ensure your server can connect to the internet.');
    _logger.w('   Details: ${e.message}');
  } on MtnMomoAuthException catch (e) {
    _logger.e('2. AUTHENTICATION ERROR caught! (HTTP 401)');
    _logger.w(
        '   Reason: Your Subscription Key, API User, or API Key is invalid.');
    _logger.w('   Details: ${e.message}');
  } on MtnMomoForbiddenException catch (e) {
    _logger.e('3. FORBIDDEN ERROR caught! (HTTP 403)');
    _logger.w(
        '   Reason: Ensure your servers IP is whitelisted in your MTN developer profile.');
    _logger.w('   Details: ${e.message}');
  } on MtnMomoNotFoundException catch (e) {
    _logger.e('4. NOT FOUND ERROR caught! (HTTP 404)');
    _logger.w(
        '   Reason: The specific transaction reference or balance resource was not found.');
    _logger.w('   Details: ${e.message}');
  } on MtnMomoConflictException catch (e) {
    _logger.e('5. CONFLICT ERROR caught! (HTTP 409)');
    _logger.w(
        '   Reason: This X-Reference-Id UUID has already been used for another transaction.');
    _logger.w('   Details: ${e.message}');
  } on MtnMomoTransactionException catch (e) {
    _logger.e('6. BUSINESS LOGIC TRANSACTION EXCEPTION caught!');
    _logger.w('   This is a structured failure from MTN MoMo Core.');
    _logger.w('   Raw Code   : ${e.errorCode.code}');
    _logger.w('   Description: ${e.errorCode.description}');

    // Map business errors directly to developer actions or UI alerts
    switch (e.errorCode) {
      case MtnMomoErrorCode.payerLimitReached:
        _logger.w(
            '   -> [Action Required]: The payer wallet limit has been exceeded.');
        break;
      case MtnMomoErrorCode.notEnoughFunds:
        _logger.w(
            '   -> [Action Required]: Alert payer to top up their mobile wallet.');
        break;
      case MtnMomoErrorCode.approvalRejected:
        _logger.w(
            '   -> [Action Required]: Customer rejected the USSD PIN prompt.');
        break;
      case MtnMomoErrorCode.payeeNotFound:
      case MtnMomoErrorCode.payerNotFound:
        _logger.w(
            '   -> [Action Required]: MSISDN phone number is invalid or unregistered.');
        break;
      default:
        _logger.w('   -> Unhandled business logic code.');
    }
  } on MtnMomoServerException catch (e) {
    _logger.e('7. MTN INFRASTRUCTURE SERVER ERROR caught! (HTTP 500/503)');
    _logger.w('   MTN MoMo Gateway is experiencing downtime or errors.');
    _logger.w('   Details: ${e.message}');
  } catch (e) {
    _logger.e('8. UNEXPECTED GENERIC ERROR caught!');
    _logger.w('   Details: $e');
  }

  print('\n==================================================');
  print('          ERROR HANDLING ENDED');
  print('==================================================\n');
}
