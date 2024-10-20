import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/Features/Home/domain/collections_model.dart';

part 'collections_dto.freezed.dart';
part 'collections_dto.g.dart';

@freezed
class CollectionDto with _$CollectionDto {
  const CollectionDto._();
  const factory CollectionDto({
    required int id,
    required DateTime createdAt,
    required String userId,
    required String title,
    String? desc,
    Map<String, dynamic>? location,
    required DateTime date,
  }) = _CollectionDto;

  // fromJson
  factory CollectionDto.fromJson(Map<String, dynamic> json) =>
      _$CollectionDtoFromJson(json);

  // to domain model
  CollectionModel toDomain() {
    return CollectionModel(
      id: id,
      createdAt: createdAt,
      userId: userId,
      title: title,
      desc: desc ?? '',
      location: location ?? {},
      date: date,
    );
  }

  // from domain model
  factory CollectionDto.fromDomain(CollectionModel model) {
    return CollectionDto(
      id: model.id,
      createdAt: model.createdAt,
      userId: model.userId,
      title: model.title,
      desc: model.desc,
      location: model.location,
      date: model.date,
    );
  }
}
