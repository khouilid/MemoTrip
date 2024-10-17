import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:template/Features/auth/infrastructure/tokens_storage/tokens_storage.dart';
import 'package:template/Features/user/infrastructure/user_storage/user_storage.dart';
import 'package:template/core/infrastructure/helpers/remote_server_connexion.dart';
import 'package:template/core/infrastructure/helpers/remote_service_helper.dart';

class AuthRemoteService extends RemoteServiceHelper {
  final Dio _dio;
  final RemoteServerConnexion _remoteServerConnexion;
  final TokensStorage _tokensStorage;
  final UserStorage _userStorage;

  AuthRemoteService(this._dio, this._remoteServerConnexion, this._tokensStorage,
      this._userStorage);
  String webClientId =
      '702181279182-2ahbq0uh2big8g9vtcoa2vgi01lf81f2.apps.googleusercontent.com';
  String iosClientId =
      '702181279182-scdd5b2t8m9hapaktl707tjk7qsfvra2.apps.googleusercontent.com';

  Future<AuthResponse> nativeGoogleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      return await _remoteServerConnexion.instance().auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: idToken,
            accessToken: accessToken,
          );
    } catch (e) {
      rethrow;
    }
  }

 

  // TokenDto _getAccessToken(dynamic responseData) {
  //   final String = _getTokens(responseData);
  //   return String.access;
  // }
}
