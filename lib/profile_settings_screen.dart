import 'package:flutter/material.dart';
import 'package:othego_project/profile_header.dart';
import 'package:othego_project/settings_form.dart';
import 'package:othego_project/settings_service.dart';
import 'package:othego_project/profile_settings.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final SettingsService _settingsService = SettingsService();
  late ProfileSettings _settings;
  int _selectedIndex = 4; // Profile tab selected

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              imageUrl: _settings.profileImage,
              onImageChanged: (String newUrl) {
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}