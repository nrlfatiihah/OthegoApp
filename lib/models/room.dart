class Room {
  final int id;
  final String name;
  final String location;
  final double price;
  final String description;
  final String images;
  final double rating;
  final int reviewCount;
  final String amenities;
  final String address;
  final List<String> features;

  Room({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.description,
    required this.images,
    required this.rating,
    required this.reviewCount,
    required this.amenities,
    required this.address,
    required this.features, // Add this to the constructor
  });

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'],
      name: map['name'],
      location: map['location'],
      price: map['price'],
      description: map['description'],
      images: map['images'],
      rating: map['rating'],
      reviewCount: map['review_count'],
      amenities: map['amenities'], 
      address: map['address'],
      features: List<String>.from(map['features']), 
    );
  }
}
