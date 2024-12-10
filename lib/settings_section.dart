import 'package:flutter/material.dart';
import 'package:othego_project/profile_settings.dart';

class SettingsSection extends StatelessWidget {
  final ProfileSettings settings;
  final Function(ProfileSettings) onSettingsChanged;

  const SettingsSection({
    super.key,
    required this.settings,
    required this.onSettingsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            'Name',
            settings.name,
            (value) => onSettingsChanged(settings.copyWith(name: value)),
          ),
          const SizedBox(height: 16),
          _buildTextField(
            'Email',
            settings.email,
            (value) => onSettingsChanged(settings.copyWith(email: value)),
          ),
          const SizedBox(height: 16),
          _buildSwitch(
            'Notifications',
            settings.notificationsEnabled,
            (value) => onSettingsChanged(settings.copyWith(notificationsEnabled: value)),
          ),
          const SizedBox(height: 16),
          _buildSwitch(
            'Dark Mode',
            settings.darkModeEnabled,
            (value) => onSettingsChanged(settings.copyWith(darkModeEnabled: value)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String value, Function(String) onChanged) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      controller: TextEditingController(text: value),
      onChanged: onChanged,
    );
  }

  Widget _buildSwitch(String label, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}