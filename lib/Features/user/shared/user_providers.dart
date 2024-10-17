import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:template/Features/auth/infrastructure/tokens_storage/secure_tokens_storage.dart';
import 'package:template/core/shared/providers.dart';

import '../infrastructure/user_storage/secure_user_storage.dart';
import '../infrastructure/user_storage/user_storage.dart';

final secureUserStorageProvider = Provider<UserStorage>(
  (ref) => SecureUserStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);
// SecureTokensStorage
final secureTokensStorageProvider = Provider<SecureTokensStorage>(
  (ref) => SecureTokensStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);



// final userRemoteRepositoryProvider = Provider<UserRemoteDataSource>(
//   (ref) => UserRemoteDataSource(ref.watch(dioProvider)),
// );

// final userRepositoryProvider = Provider<UserRepository>(
//   (ref) => UserRepository(
//     ref.watch(userRemoteRepositoryProvider),
//   ),
// );

// final userNotifierProvider =
//     StateNotifierProvider<UserStateNotifier, UserState>(
//   (ref) => UserStateNotifier(ref.watch(userRepositoryProvider)),
// );

final sideMenuStateProvider = StateProvider<bool>((ref) => false);

final userProvider = StateProvider<User?>(
  (ref) => null,
);

final resizeToAvoidBottomInsetProvider = StateProvider<bool?>(
  (ref) => null,
);
