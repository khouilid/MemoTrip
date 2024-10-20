import "dart:io";

import "package:template/Features/Home/infrastructure/home_remote_datasource.dart";
import "package:template/core/infrastructure/helpers/repository_helper.dart";

class HomeRepository with RepositoryHelper {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepository(this._homeRemoteDataSource);

  FutureEitherFailureOrFresh<void> insertNewTripCollection({
    required String title,
    required String description,
    required List<File> images,
    required String locationLatitude,
    required String locationLongitude,
    required String locationName,
  }) async =>
      handleData(
        _homeRemoteDataSource.insertNewTripCollection(
          title: title,
          description: description,
          images: images,
          locationLatitude: locationLatitude,
          locationLongitude: locationLongitude,
          locationName: locationName,
        ),
        (_) {
          return Future.value();
        },
      );
}
