import 'package:mtn_momo_collections/src/generated/export.dart';
import 'package:mtn_momo_collections/src/token_manager.dart';
import 'package:test/test.dart';

void main() {
  group('TokenManager', () {
    late TokenManager tokenManager;

    setUp(() {
      tokenManager = TokenManager();
    });

    test('initial state is invalid with null token and expiry', () {
      expect(tokenManager.isValid, isFalse);
      expect(tokenManager.accessToken, isNull);
    });

    test('setting a token with long lifespan makes it valid', () {
      const mockToken = TokenPost200ApplicationJsonResponse(
        accessToken: 'valid_test_token_abc123',
        tokenType: 'Bearer',
        expiresIn: 3600,
      );

      tokenManager.setToken(mockToken);

      expect(tokenManager.isValid, isTrue);
      expect(tokenManager.accessToken, equals('valid_test_token_abc123'));
    });

    test(
      'setting a token with expires_in <= buffer (60s) makes it immediately invalid',
      () {
        const mockToken = TokenPost200ApplicationJsonResponse(
          accessToken: 'short_lived_token',
          tokenType: 'Bearer',
          expiresIn: 50, // Less than the 60-second buffer
        );

        tokenManager.setToken(mockToken);

        expect(tokenManager.isValid, isFalse);
        expect(tokenManager.accessToken, equals('short_lived_token'));
      },
    );

    test('token becomes invalid after it expires', () async {
      const mockToken = TokenPost200ApplicationJsonResponse(
        accessToken: 'expiring_token',
        tokenType: 'Bearer',
        expiresIn:
            61, // Just 1 second remaining after subtracting the 60s buffer
      );

      tokenManager.setToken(mockToken);
      expect(tokenManager.isValid, isTrue);

      // Wait for 2 seconds to exceed the 1 second validity window
      await Future.delayed(const Duration(seconds: 2));

      expect(tokenManager.isValid, isFalse);
    });

    test('clear() resets manager to invalid and clears access token', () {
      const mockToken = TokenPost200ApplicationJsonResponse(
        accessToken: 'token_to_clear',
        tokenType: 'Bearer',
        expiresIn: 120,
      );

      tokenManager.setToken(mockToken);
      expect(tokenManager.isValid, isTrue);
      expect(tokenManager.accessToken, equals('token_to_clear'));

      tokenManager.clear();

      expect(tokenManager.isValid, isFalse);
      expect(tokenManager.accessToken, isNull);
    });
  });
}
