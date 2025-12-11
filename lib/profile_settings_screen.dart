import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class ProfileSettingsScreen extends StatefulWidget {
  final UserProfile userProfile;
  final Function(UserProfile) onProfileUpdated;

  const ProfileSettingsScreen({
    super.key,
    required this.userProfile,
    required this.onProfileUpdated,
  });

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emergencyphoneController;
  late TextEditingController _emailController;
  String _selectedGender = "Select gender";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userProfile.name);
    _phoneController =
        TextEditingController(text: widget.userProfile.phoneNumber);
    _emailController =
        TextEditingController(); // Initialize with an empty string or pre-filled value
    _emergencyphoneController =
        TextEditingController(); // Initialize with an empty string or pre-filled value
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _emergencyphoneController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    final url = Uri.parse(
        'http://192.168.0.162/OthegoApp/OthegoApp/Othego_mobile/update_profile.php');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userID': widget.userProfile.userID,
        'userName': _nameController.text,
        'userEmail': _emailController.text,
        'userphoneNo': _phoneController.text, // Corrected key
        'userEmerphoneNo': _emergencyphoneController.text, // Corrected key
        'userGender': _selectedGender, // Corrected key
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['success']) {
        final updatedProfile = widget.userProfile.copyWith(
          name: _nameController.text,
          phoneNumber: _phoneController.text,
          email: _emailController.text,
          emergencyPhoneNumber: _emergencyphoneController.text,
          gender: _selectedGender,
        );
        widget.onProfileUpdated(updatedProfile);
        Navigator.pop(context);
      } else {
        print('Failed to update profile: ${responseData['message']}');
      }
    } else {
      print('Server error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDECEC),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle change photo functionality
                    },
                    child: const Text('Change Photo'),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                label: const Text('Name'),
                hintText: 'Enter Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                label: const Text('Email'),
                hintText: 'Enter Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                label: const Text('Phone Number'),
                hintText: 'Enter Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            TextField(
              controller: _emergencyphoneController,
              decoration: InputDecoration(
                label: const Text('Emergency Phone Number'),
                hintText: 'Enter Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 25),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              items: ["Select gender", "Male", "Female", "Prefer Not To Say"]
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
              decoration: InputDecoration(
                label: const Text('Gender'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _updateProfile,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
