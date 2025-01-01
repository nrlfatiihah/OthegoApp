import 'package:flutter/material.dart';
import 'package:othego_project/profile_header.dart';
import 'package:othego_project/profile_settings.dart';
import 'package:othego_project/settings_form.dart';
import 'package:othego_project/settings_service.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final SettingsService _settingsService = SettingsService();
  late ProfileSettings _settings;

  @override
  void initState() {
    super.initState();
    _settings = _settingsService.getSettings();
  }

  void _updateSettings(ProfileSettings newSettings) {
    setState(() {
      _settings = newSettings;
      _settingsService.saveSettings(newSettings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        backgroundColor: const Color(0xFFFDECEC), // Light pink color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to profile
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              imageUrl: _settings.profileImage,
              onImageChanged: (newUrl) {
                _updateSettings(_settings.copyWith(profileImage: newUrl));
              },
            ),
            SettingsForm(
              settings: _settings,
              onSettingsChanged: _updateSettings,
            ),
          ],
        ),
      ),
    );
  }
}
