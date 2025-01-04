import 'package:flutter/material.dart';
import 'package:othego_project/profile_settings_screen.dart';
import 'package:othego_project/screens/homepage.dart';
import 'package:othego_project/screens/welcome_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 4;
  late UserProfile _userProfile;

  @override
  void initState() {
    super.initState();
    // Initialize with default values (or load from database)
    _userProfile = UserProfile(
      userID: 7,
      name: "Kamal Adli",
      phoneNumber: "+6012-3456789",
      email: '',
      emergencyPhoneNumber: '',
      gender: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDECEC),
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
                  // Navigate to ProfileSettingsScreen with the current user profile
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileSettingsScreen(
                        userProfile: _userProfile,
                        onProfileUpdated: _updateProfile,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[200],
                      child: const Icon(
                        Icons.person,
                        color: Colors.black54,
                        size: 50,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _userProfile.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _userProfile.phoneNumber,
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

            // Options List
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 8),
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
              child: Column(
                children: [
                  buildOptionTile(Icons.history, 'Rental Application History'),
                  buildOptionTile(Icons.receipt_long, 'Transaction History'),
                  buildOptionTile(Icons.support_agent, 'Contact Us'),
                  buildOptionTile(Icons.settings, 'Settings'),
                  buildOptionTile(Icons.description, 'Terms and Conditions'),
                ],
              ),
            ),

            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomePage()),
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                  'Log Out Account',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        iconSize: 30.0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            // Navigate to search room
          }
          if (index == 1) {
            // Navigate to transaction history
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          }
          if (index == 3) {
            // Navigate to contact us
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
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

  // Callback to update profile
  void _updateProfile(UserProfile updatedProfile) {
    setState(() {
      _userProfile = updatedProfile;
    });
  }
}
