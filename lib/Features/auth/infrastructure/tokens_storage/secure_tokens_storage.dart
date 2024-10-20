import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:template/core/config/environment.dart';

import 'tokens_storage.dart';

class SecureTokensStorage implements TokensStorage {
  final FlutterSecureStorage _storage;

  SecureTokensStorage(this._storage);

  String? _cachedTokens;

  @override
  Future<String?> read() async {
    if (_cachedTokens != null) {
      return _cachedTokens;
    }
    try {
      final jsonResponse = await _storage.read(key: encryptKey);

      if (jsonResponse == null) {
        return null;
      }

      return _cachedTokens = jsonResponse;
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(String tokens) {
    _cachedTokens = tokens;

    return _storage.write(
      key: encryptKey,
      value: json.encode(
        tokens,
      ),
    );
  }

  @override
  Future<void> clear() {
    _cachedTokens = null;
    return _storage.delete(key: encryptKey);
  }
}
