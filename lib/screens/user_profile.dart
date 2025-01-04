class UserProfile {
  final int userID;
  final String name;
  final String phoneNumber;
  final String email;
  final String emergencyPhoneNumber;
  final String gender;

  UserProfile({
    required this.userID,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.emergencyPhoneNumber,
    required this.gender,
  });

  UserProfile copyWith({
    int? userID,
    String? name,
    String? phoneNumber,
    String? email,
    String? emergencyPhoneNumber,
    String? gender,
  }) {
    return UserProfile(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      emergencyPhoneNumber: emergencyPhoneNumber ?? this.emergencyPhoneNumber,
      gender: gender ?? this.gender,
    );
  }
}
