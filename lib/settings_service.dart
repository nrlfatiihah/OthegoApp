import 'package:othego_project/profile_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  Future<ProfileSettings> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return ProfileSettings(
      profileImage: prefs.getString('profileImage') ?? '',
      name: prefs.getString('name') ?? '',
      phone: prefs.getString('phone') ?? '',
    );
  }

  Future<void> saveSettings(ProfileSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', settings.profileImage);
    await prefs.setString('name', settings.name);
    await prefs.setString('phone', settings.phone);
  }
}
