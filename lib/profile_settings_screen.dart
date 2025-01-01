import 'package:flutter/material.dart';
import 'package:othego_project/profile_header.dart';
import 'package:othego_project/profile_settings.dart';
import 'package:othego_project/settings_form.dart';
import 'package:othego_project/settings_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileSettingsScreen extends StatefulWidget {
  final ProfileSettings currentSettings;
  final Function(ProfileSettings) onSettingsUpdated;

  const ProfileSettingsScreen({
    super.key,
    required this.currentSettings,
    required this.onSettingsUpdated,
  });

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _contactController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentSettings.name);
    _emailController = TextEditingController(text: widget.currentSettings.email);
    _contactController = TextEditingController(text: widget.currentSettings.contactNumber);
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://192.168.0.180/Othego_mobile/profile.php'),
        body: jsonEncode({
          'userID': widget.currentSettings.userID, // Send userID for reference
          'name': _nameController.text,
          'email': _emailController.text,
          'contactNumber': _contactController.text,
        }),
      );

      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData['status'] == 'success') {
        widget.onSettingsUpdated(ProfileSettings(
          userID: widget.currentSettings.userID, // Keep the userID unchanged
          name: _nameController.text,
          email: _emailController.text,
          contactNumber: _contactController.text,
          emergencyContact: widget.currentSettings.emergencyContact,
          gender: widget.currentSettings.gender,
          profileImage: widget.currentSettings.profileImage,
          notificationsEnabled: widget.currentSettings.notificationsEnabled,
          darkModeEnabled: widget.currentSettings.darkModeEnabled,
        ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(responseData['message'])));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${responseData['message']}')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Enter your full name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Enter your email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(hintText: 'Enter your contact number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}