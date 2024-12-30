import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final ValueChanged<String> onImageChanged;

  const ProfileHeader({
    Key? key,
    required this.imageUrl,
    required this.onImageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: imageUrl.isNotEmpty
                ? NetworkImage(imageUrl)
                : null, // Fallback to an icon if no image
            child: imageUrl.isEmpty
                ? const Icon(Icons.person, size: 50, color: Colors.grey)
                : null,
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () async {
              // Handle profile image change logic
              const newUrl = "https://via.placeholder.com/150"; // Example
              onImageChanged(newUrl);
            },
            icon: const Icon(Icons.edit, size: 16),
            label: const Text('Change Profile Picture'),
          ),
        ],
      ),
    );
  }
}
