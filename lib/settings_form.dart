import 'package:flutter/material.dart';
import 'package:othego_project/profile_settings.dart';

class SettingsForm extends StatefulWidget {
  final ProfileSettings settings;
  final Function(ProfileSettings) onSettingsChanged;

  const SettingsForm({
    super.key,
    required this.settings,
    required this.onSettingsChanged,
  });

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _contactController;
  late TextEditingController _emergencyContactController;
  late String _selectedGender;
  late bool _notificationsEnabled;
  late bool _darkModeEnabled;

  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.settings.name);
    _emailController = TextEditingController(text: widget.settings.email);
    _contactController = TextEditingController(text: widget.settings.contactNumber);
    _emergencyContactController =
        TextEditingController(text: widget.settings.emergencyContact);
    _selectedGender = widget.settings.gender;
    _notificationsEnabled = widget.settings.notificationsEnabled;
    _darkModeEnabled = widget.settings.darkModeEnabled;
  }

  void _saveSettings() {
    final updatedSettings = widget.settings.copyWith(
      name: _nameController.text,
      email: _emailController.text,
      contactNumber: _contactController.text,
      emergencyContact: _emergencyContactController.text,
      gender: _selectedGender,
      notificationsEnabled: _notificationsEnabled,
      darkModeEnabled: _darkModeEnabled,
    );
    widget.onSettingsChanged(updatedSettings);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField('Full Name', _nameController),
            const SizedBox(height: 16),
            _buildTextField('Email', _emailController),
            const SizedBox(height: 16),
            _buildTextField('Contact Number', _contactController),
            const SizedBox(height: 16),
            _buildTextField('Emergency Contact', _emergencyContactController),
            const SizedBox(height: 16),
            _buildGenderDropdown(),
            const SizedBox(height: 16),
            _buildSwitch(
              'Enable Notifications',
              _notificationsEnabled,
              (value) => setState(() => _notificationsEnabled = value),
            ),
            const SizedBox(height: 16),
            _buildSwitch(
              'Enable Dark Mode',
              _darkModeEnabled,
              (value) => setState(() => _darkModeEnabled = value),
            ),
            const SizedBox(height: 24),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
        ),
      ],
    );
  }

  Widget _buildGenderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender'),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedGender,
          items: _genders
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
        ),
      ],
    );
  }

  Widget _buildSwitch(String label, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(label),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _saveSettings,
      child: const Text('Save'),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _emergencyContactController.dispose();
    super.dispose();
  }
}
