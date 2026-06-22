import 'package:mtn_momo_sdk/src/generated/export.dart';

/// Manages the OAuth2 access token lifecycle for the MTN MoMo API.
///
/// Caches the access token and tracks its expiration time, automatically
/// accounting for a 60-second clock-skew safety buffer. The token is
/// considered invalid if it is absent or within 60 seconds of expiry.
///
/// Typically instantiated internally by [MtnMomo] and injected into
/// [MomoInterceptor] — consumers of the SDK do not normally interact with
/// this class directly.
class TokenManager {
  TokenPost200ApplicationJsonResponse? _token;
  DateTime? _expiry;

  bool get isValid {
    if (_token == null || _expiry == null) return false;
    return DateTime.now().isBefore(_expiry!);
  }

  String? get accessToken => _token?.accessToken;

  void setToken(TokenPost200ApplicationJsonResponse token) {
    _token = token;
    // Token expires in 'expiresIn' seconds. We subtract a buffer (e.g., 60s) to be safe.
    final expiresIn = token.expiresIn ?? 3600;
    _expiry = DateTime.now().add(Duration(seconds: expiresIn - 60));
  }

  void clear() {
    _token = null;
    _expiry = null;
  }
}
