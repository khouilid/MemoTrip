class MemoryModel {
  final int id;
  final String title, description;
  final List<String> images;
  final bool isFavourite;
  final double latitude, longitude;
  final String address;

  MemoryModel({
    required this.id,
    required this.images,
    this.isFavourite = false,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.description,
  });
}
