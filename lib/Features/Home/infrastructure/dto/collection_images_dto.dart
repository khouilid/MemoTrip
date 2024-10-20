import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/Features/Home/domain/collection_images_model.dart';

part 'collection_images_dto.freezed.dart';
part 'collection_images_dto.g.dart';

@freezed
class CollectionImageDto with _$CollectionImageDto {
  const CollectionImageDto._();
  const factory CollectionImageDto({
    required int id,
    required DateTime createdAt,
    required String image,
    required int collectionId,
  }) = _CollectionImageDto;

  // fromJson
  factory CollectionImageDto.fromJson(Map<String, dynamic> json) =>
      _$CollectionImageDtoFromJson(json);

  // to domain model
  CollectionImageMode toDomain() {
    return CollectionImageMode(
      id: id,
      createdAt: createdAt,
      image: image,
      collectionId: collectionId,
    );
  }

  // from domain model
  factory CollectionImageDto.fromDomain(CollectionImageMode model) {
    return CollectionImageDto(
      id: model.id,
      createdAt: model.createdAt,
      image: model.image,
      collectionId: model.collectionId,
    );
  }
}
