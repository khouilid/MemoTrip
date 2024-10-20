import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/Features/Home/domain/user_collections_model.dart';

part 'user_collections_dto.freezed.dart';
part 'user_collections_dto.g.dart';

@freezed
class UserCollectionsDto with _$UserCollectionsDto {
  const UserCollectionsDto._();
  const factory UserCollectionsDto({
    int? id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'collection_id') int? collectionId,
  }) = _UserCollections;

  factory UserCollectionsDto.fromJson(Map<String, dynamic> json) =>
      _$UserCollectionsDtoFromJson(json);

  // to domain model
  UserCollectionModel toDomain() {
    return UserCollectionModel(
      id: id ?? 0,
      createdAt: createdAt ?? DateTime.now(),
      userId: userId ?? '',
      collectionId: collectionId ?? 0,
    );
  }

  // from domain model
  factory UserCollectionsDto.fromDomain(UserCollectionModel model) {
    return UserCollectionsDto(
      id: model.id,
      createdAt: model.createdAt,
      userId: model.userId,
      collectionId: model.collectionId,
    );
  }
}
