
class MemoryModel {
  final int id;
  final String title, description;
  final List<String> images;

  final double rating, price;
  final bool isFavourite, isPopular;

  MemoryModel({
    required this.id,
    required this.images,

    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}
