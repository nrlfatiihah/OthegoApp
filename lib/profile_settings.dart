class ProfileSettings {
  final String name;
  final String email;
  final String profileImage;
  final bool notificationsEnabled;
  final bool darkModeEnabled;

  const ProfileSettings({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.notificationsEnabled,
    required this.darkModeEnabled,
  });

  ProfileSettings copyWith({
    String? name,
    String? email,
    String? profileImage,
    bool? notificationsEnabled,
    bool? darkModeEnabled,
  }) {
    return ProfileSettings(
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
    );
  }
}
