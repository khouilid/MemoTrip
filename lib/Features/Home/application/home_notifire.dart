import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
// import "Home_states.dart";
import '../infrastructure/Home_repository.dart';
import 'home_states.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  final HomeRepository _homeRepository;

  HomeStateNotifier(this._homeRepository) : super(const HomeState.initial());

  Future<void> insertNewTripCollection({
    required String title,
    required String description,
    required List<File> images,
    required String locationLatitude,
    required String locationLongitude,
    required String locationName,
  }) async {
    state = const HomeState.loading();
    final failureOrObservation = await _homeRepository.insertNewTripCollection(
      title: title,
      description: description,
      images: images,
      locationLatitude: locationLatitude,
      locationLongitude: locationLongitude,
      locationName: locationName,
    );
    state = failureOrObservation.fold((l) => HomeState.failure(l),
        (r) => const HomeState.updatedCollection());
  }
}
