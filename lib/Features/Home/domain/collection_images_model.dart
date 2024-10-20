import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_images_model.freezed.dart';

@freezed
class CollectionImageMode with _$CollectionImageMode {
  const factory CollectionImageMode({
    required int id,
    required DateTime createdAt,
    required String image,
    required int collectionId,
  }) = _CollectionImageMode;

  factory CollectionImageMode.empty() => CollectionImageMode(
        id: 0,
        createdAt: DateTime.now(),
        image: '',
        collectionId: 0,
      );
}
