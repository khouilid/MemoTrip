import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:template/core/config/environment.dart';


import 'user_storage.dart';

class SecureUserStorage implements UserStorage {
  final FlutterSecureStorage _storage;

  SecureUserStorage(this._storage);

  User? _cachedUser;

  @override
  Future<User?> read() async {
    if (_cachedUser != null) {
      return _cachedUser;
    }
    final jsonResponse = await _storage.read(key: encryptKey);

    if (jsonResponse == null) {
      return null;
    }

    try {
      return _cachedUser = User.fromJson(
        json.decode(jsonResponse) as Map<String, dynamic>,
      );
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(User user) async {
    _cachedUser = user;
    await clear();
    await _storage.write(
      key: encryptKey,
      value: json.encode(user.toJson()),
    );
  }

  @override
  Future<void> clear() {
    _cachedUser = null;
    return _storage.delete(key: encryptKey);
  }
}
