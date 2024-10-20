
import 'package:freezed_annotation/freezed_annotation.dart';
part 'collections_model.freezed.dart';

@freezed
class CollectionModel with _$CollectionModel {
  const factory CollectionModel({
    required int id,
    required DateTime createdAt,
    required String userId,
    required String title,
    required String desc,
    required Map<String, dynamic> location,
    required DateTime date,
  }) = _CollectionModel;

  factory CollectionModel.empty() => CollectionModel(
        id: 0,
        createdAt: DateTime.now(),
        userId: '',
        title: '',
        desc: '',
        location: {},
        date: DateTime.now(),
      );
}
