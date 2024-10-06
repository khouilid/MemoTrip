import 'package:hooks_riverpod/hooks_riverpod.dart';
// import "Home_states.dart";
import '../infrastructure/Home_repository.dart';
import 'home_states.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  final HomeRepository _HomeRepository;

  HomeStateNotifier(this._HomeRepository) : super(const HomeState.initial());
}
