 
     
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/shared/providers.dart';

import "../application/Home_notifire.dart";  
import '../application/Home_states.dart';
import '../infrastructure/Home_remote_datasource.dart';
import '../infrastructure/Home_repository.dart';

final homeRemoteRepositoryProvider =
    Provider<HomeRemoteDataSource>(
  (ref) => HomeRemoteDataSource(ref.watch(dioProvider)),
);


final homeRepository = Provider<HomeRepository>(
  (ref) => HomeRepository(
    ref.watch(homeRemoteRepositoryProvider),
  ),
);


final homeNotifierProvider =
    StateNotifierProvider<HomeStateNotifier, HomeState>(
  (ref) => HomeStateNotifier(ref.watch(homeRepository)),
);
