class Room {
  final String name;
  final String description;
  final double pricePerMonth;
  final List<String> features;
  final List<String> images;
  final String location;
  final double rating;
  final int reviews;

  Room({
    required this.name,
    required this.description,
    required this.pricePerMonth,
    required this.features,
    required this.images,
    required this.location,
    required this.rating,
    required this.reviews,
  });
}