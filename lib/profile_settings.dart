class ProfileSettings {
  final String userID;  // Add userID field
  final String name;
  final String email;
  final String profileImage;
  final bool notificationsEnabled;
  final bool darkModeEnabled;
  final String gender;
  final String contactNumber;
  final String emergencyContact;

  ProfileSettings({
    required this.userID,  // Make sure to include userID in the constructor
    required this.name,
    required this.email,
    required this.profileImage,
    required this.notificationsEnabled,
    required this.darkModeEnabled,
    required this.gender,
    required this.contactNumber,
    required this.emergencyContact,
  });

  ProfileSettings copyWith({
    String? userID,
    String? name,
    String? email,
    String? profileImage,
    bool? notificationsEnabled,
    bool? darkModeEnabled,
    String? gender,
    String? contactNumber,
    String? emergencyContact,
  }) {
    return ProfileSettings(
      userID: userID ?? this.userID,  // Include userID in the copyWith method
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      gender: gender ?? this.gender,
      contactNumber: contactNumber ?? this.contactNumber,
      emergencyContact: emergencyContact ?? this.emergencyContact,
    );
  }
}
