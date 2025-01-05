class Room {
  final String name;
  final List<String> features;
  final int bedrooms;
  final int baths;
  final bool hasWashingMachine;
  final String imageUrl;
  final double price;

  const Room({  // Add const constructor
    required this.name,
    required this.features,
    required this.bedrooms,
    required this.baths,
    required this.hasWashingMachine,
    required this.imageUrl,
    required this.price,
  });
}