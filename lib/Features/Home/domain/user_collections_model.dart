import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_collections_model.freezed.dart';

@freezed
class UserCollectionModel with _$UserCollectionModel {
  const factory UserCollectionModel({
    required int id,
    required DateTime createdAt,
    required String userId,
    required int collectionId,
  }) = _UserCollectionModel;

  factory UserCollectionModel.empty() => UserCollectionModel(
        id: 0,
        createdAt: DateTime.now(),
        userId: '',
        collectionId: 0,
      );

}
