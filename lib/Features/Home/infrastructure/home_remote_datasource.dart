import 'dart:io';
import 'package:template/core/infrastructure/helpers/remote_server_connexion.dart';
import 'package:template/core/infrastructure/helpers/remote_service_helper.dart';

class HomeRemoteDataSource extends RemoteServiceHelper {
  RemoteServerConnexion _remoteServerConnexion;
  HomeRemoteDataSource(
    this._remoteServerConnexion,
  );

  Future<List<String>> _uploadCollectionImages(List<File> imageFiles) async {
    List<String> imageUrls = [];

    for (File imageFile in imageFiles) {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;

      try {
        final imageUrlResponse = await _remoteServerConnexion.instance().storage
            .from('collections')
            .uploadBinary(
              filePath,
              bytes,
            );
        // final imageUrlResponse = await _remoteServerConnexion.storage
        //     .from('collections')
        //     .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
        imageUrls.add(imageUrlResponse);
      } catch (e) {
        rethrow;
      }
    }

    return imageUrls;
  }

  Future<void> insertNewTripCollection({
    required String title,
    required String description,
    required List<File> images,
    required String locationLatitude,
    required String locationLongitude,
    required String locationName,
  }) async {
    final user = _remoteServerConnexion.instance().auth.currentUser;

    List<String> imageUrls = await _uploadCollectionImages(images);

    final collection = {
      'user_id': user!.id,
      'title': title,
      'desc': description,
      'location_latitude': locationLatitude,
      'location_longitude': locationLongitude,
      'location_name': locationName,
      'created_at': DateTime.now().toIso8601String(),
      'images': imageUrls,
    };
    try {
      await _remoteServerConnexion.instance()
          .from('collection')
          .insert(collection)
          .select('id')
          .then(
            (value) => print(value),
          );
      // final userCollections = {
      //   'user_id': user.id,
      //   'collection_id': collection['id'],
      // };
    } catch (e) {
      rethrow;
    }
  }
}
