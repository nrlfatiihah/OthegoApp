import 'package:othego_project/profile_settings.dart';

class SettingsService {
  ProfileSettings getSettings() {
    return ProfileSettings(
      name: 'John Doe',
      email: 'john.doe@example.com',
      contactNumber: '1234567890',
      emergencyContact: '0987654321',
      gender: 'Male',
      profileImage: 'https://example.com/profile.jpg',
      notificationsEnabled: true,
      darkModeEnabled: false,
    );
  }

  void saveSettings(ProfileSettings settings) {
    // Implement actual storage logic here
    print('Settings saved: $settings');
  }
}