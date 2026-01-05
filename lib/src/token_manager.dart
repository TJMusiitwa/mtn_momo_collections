import 'package:mtn_momo_collections/models/token_post200_application_json_response.dart';

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
