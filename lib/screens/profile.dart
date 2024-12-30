import 'package:flutter/material.dart';
import 'package:othego_project/profile_settings_screen.dart';
import 'package:othego_project/screens/homepage.dart';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 4;

  bool _isEditing = false; 
  final TextEditingController _nameController = TextEditingController(text: 'Kamal Adli');
  final TextEditingController _phoneController = TextEditingController(text: '+6012-3456789');

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
              child: Column(
                children: [
                  Row(
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isEditing
                                ? TextFormField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                      border: OutlineInputBorder(),
                                    ),
                                  )
                                : Text(
                                    _nameController.text,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            const SizedBox(height: 8),
                            _isEditing
                                ? TextFormField(
                                    controller: _phoneController,
                                    decoration: const InputDecoration(
                                      labelText: 'Phone',
                                      border: OutlineInputBorder(),
                                    ),
                                  )
                                : Text(
                                    _phoneController.text,
                                    style: const TextStyle(color: Colors.black54),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_isEditing)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isEditing = false; 
                            });
                          },
                          child: const Text('Save'),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = !_isEditing; 
                          });
                        },
                        child: Text(_isEditing ? 'Cancel' : 'Edit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Options List
            Container(
              margin: const EdgeInsets.all(16), 
              padding:
                  const EdgeInsets.symmetric(vertical: 8), 
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
                  buildOptionTile(Icons.history, 'Rental application history'),
                  buildOptionTile(Icons.receipt_long, 'Transaction history'),
                  buildOptionTile(Icons.support_agent, 'Contact Us'),
                  buildOptionTile(Icons.settings, 'Setting'),
                  buildOptionTile(Icons.description, 'Terms and conditions'),
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
                  // Handle logout
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                  'Log out account',
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

          if (index == 2) {
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
      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
    );
  }
}
