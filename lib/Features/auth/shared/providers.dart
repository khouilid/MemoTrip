import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/user/shared/user_providers.dart';
import 'package:template/core/shared/providers.dart';
import '../application/auth_notifier.dart';
import '../application/auth_states.dart';
import '../infrastructure/auth_remote_service.dart';
import '../infrastructure/authenticator.dart';

final remoteServiceProvider = Provider<AuthRemoteService>(
  (ref) => AuthRemoteService(
    ref.watch(dioProvider),
    ref.read(remoteServerConnexionProvider),
    ref.watch(secureTokensStorageProvider),
    ref.watch(secureUserStorageProvider),
  ),
);

final authenticatorProvider = Provider<Authenticator>(
  (ref) => Authenticator(
    ref.watch(remoteServiceProvider),
    ref.watch(secureUserStorageProvider),
    ref.watch(secureTokensStorageProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthStates>(
  (ref) => AuthNotifier(
    ref.watch(authenticatorProvider),
  ),
);
