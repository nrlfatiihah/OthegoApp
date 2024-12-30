class ProfileSettings {
  final String profileImage;
  final String name;
  final String phone;

  ProfileSettings({
    required this.profileImage,
    required this.name,
    required this.phone,
  });

  ProfileSettings copyWith({
    String? profileImage,
    String? name,
    String? phone,
  }) {
    return ProfileSettings(
      profileImage: profileImage ?? this.profileImage,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }
}
