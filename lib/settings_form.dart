import 'package:flutter/material.dart';
import 'package:othego_project/profile_settings.dart';

class SettingsForm extends StatefulWidget {
  final ProfileSettings settings;
  final ValueChanged<ProfileSettings> onSettingsChanged;

  const SettingsForm({
    Key? key,
    required this.settings,
    required this.onSettingsChanged,
  }) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.settings.name);
    _phoneController = TextEditingController(text: widget.settings.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveSettings() {
    if (_formKey.currentState!.validate()) {
      widget.onSettingsChanged(
        widget.settings.copyWith(
          name: _nameController.text,
          phone: _phoneController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Enter your name'),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Name cannot be empty' : null,
            ),
            const SizedBox(height: 16),
            const Text('Phone', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(hintText: 'Enter your phone'),
              keyboardType: TextInputType.phone,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Phone cannot be empty' : null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
