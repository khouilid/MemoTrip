import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:template/Features/auth/application/auth_states.dart';

import '../infrastructure/authenticator.dart';
import 'auth_notifier.dart';

class AuthNotifier extends StateNotifier<AuthStates> {
  AuthNotifier(this._authenticator) : super(const AuthStates.initial());

  final Authenticator _authenticator;

  Future<void> checkAndUpdateAuthStatus() async {
    state = const AuthStates.loading();
    return _authenticator.getSignedInUser().then(
      (userAndToken) {
        Logger().i(userAndToken);
        if (userAndToken?.user != null) {
          state = AuthStates.authenticated(userAndToken!.user!);
        } else {
          state = const AuthStates.unauthenticated();
        }
      },
    );
  }

  nativeGoogleSignIn() async {
    state = const AuthStates.loading();

    final failureOrSuccess = await _authenticator.nativeGoogleSignIn();

    state = failureOrSuccess.fold(
      (l) => AuthStates.failure(l),
      (r) => AuthStates.authenticated(r.user!),
    );
  }

  Future<void> signOut() async {
    final failureOrSuccess = await _authenticator.signOut();

    state = failureOrSuccess.fold(
      (l) => AuthStates.failure(l),
      (r) => const AuthStates.unauthenticated(),
    );
  }
}
