import 'package:flutter/material.dart';
import 'package:othego_project/profile_settings_screen.dart';
import 'package:othego_project/screens/homepage.dart';
import 'package:othego_project/profile_settings.dart'; // ProfileSettings model
import 'package:othego_project/settings_service.dart'; // SettingsService for managing profile data

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 4;
  ProfileSettings? _currentSettings; // Holds the current profile settings
  late SettingsService _settingsService;

  @override
  void initState() {
    super.initState();
    _settingsService = SettingsService();
    _loadSettings();
  }

  // Load current settings from the service
  Future<void> _loadSettings() async {
    // Fetch settings (This could come from a local database or API)
    ProfileSettings settings = await _settingsService.getSettings();
    setState(() {
      _currentSettings = settings;
    });
  }

  // Update the settings with new values after edit
  void _onSettingsUpdated(ProfileSettings updatedSettings) {
    setState(() {
      _currentSettings = updatedSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDECEC), // Light pink background
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  if (_currentSettings != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileSettingsScreen(
                          currentSettings: _currentSettings!,
                          onSettingsUpdated: _onSettingsUpdated,
                        ),
                      ),
                    );
                  }
                },
                child: Row(
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: _currentSettings?.profileImage != null
                          ? NetworkImage(_currentSettings!.profileImage)
                          : null,
                      child: _currentSettings?.profileImage == null
                          ? const Icon(
                              Icons.person,
                              color: Colors.black54,
                              size: 50,
                            )
                          : null,
                    ),
                    const SizedBox(width: 12),
                    // User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _currentSettings?.name ?? 'Loading...',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _currentSettings?.contactNumber ?? 'Loading...',
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),

            // Other sections...
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red, // Active item color
        unselectedItemColor: Colors.black, // Inactive items color
        backgroundColor: Colors.white,
        iconSize: 30.0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the active index
          });
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transaction History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildOptionTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
    );
  }
}
