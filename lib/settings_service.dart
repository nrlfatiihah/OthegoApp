import 'package:othego_project/profile_settings.dart';

class SettingsService {
  ProfileSettings getSettings() {
    return const ProfileSettings(
      name: 'John Doe',
      email: 'john.doe@example.com',
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
