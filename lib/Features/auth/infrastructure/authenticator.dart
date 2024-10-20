import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:template/Features/auth/infrastructure/tokens_storage/secure_tokens_storage.dart';
import 'package:template/core/domain/failure.dart';
import 'package:template/core/infrastructure/helpers/repository_helper.dart';
import '../../user/infrastructure/user_storage/user_storage.dart';
import 'auth_remote_service.dart';

class Authenticator with RepositoryHelper {
  final AuthRemoteService _remoteService;
  final UserStorage _userStorage;
  final SecureTokensStorage _tokensStorage;
  const Authenticator(
    this._remoteService,
    this._userStorage,
    this._tokensStorage,
  );

  // Future<Tokens?> getTokens() async {
  //   try {
  //     final String = await _tokensStorage.read();
  //     print(String);
  //     if (String != null) {
  //       return String.toDomain();
  //     }
  //     return null;
  //   } on PlatformException {
  //     return null;
  //   }
  // }

  FutureEitherFailureOr<AuthResponse> nativeGoogleSignIn() => handleData(
        _remoteService.nativeGoogleSignIn(),
        (_) async {
          if (_.user != null) {
            _userStorage.save(_.user!);
            await _tokensStorage.save(_.session!.accessToken);
            return _;
          }
          return _;
        },
      );

  Future<AuthResponse?> getSignedInUser() async {
    try {
      final tokensFromStorage = await getTokens();
      if (tokensFromStorage == null) {
        await _userStorage.clear();
        return null;
      }

      final user = await _userStorage.read();
      final token = await _tokensStorage.read() ?? "";
      Logger().i(user);
      return AuthResponse(
          session: Session(accessToken: token, tokenType: '', user: user!),
          user: user);
    } on PlatformException {
      rethrow;
    }
  }

  Future<String?> getTokens() async {
    try {
      final tokens = await _tokensStorage.read();
      if (tokens != null) {
        return tokens;
      }
      return null;
    } on PlatformException {
      return null;
    }
  }

  FutureEitherFailureOr<Unit> signOut() async {
    try {
      await _userStorage.clear();

      if (kIsWeb) {
        return right(unit);
      }

      // await _isarDatabase.isar.writeTxn(
      //   () => _isarDatabase.isar.clear(),
      // );

      return right(unit);
    } on PlatformException {
      return left(const Failure.storage());
    } catch (e) {
      rethrow;
    }
  }
}
