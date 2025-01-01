import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final ValueChanged<String> onImageChanged;

  const ProfileHeader({
    super.key,
    required this.imageUrl,
    required this.onImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFDECEC), // Light pink background to match profile.dart
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile Picture',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Implement image change functionality
                  },
                  child: const Text(
                    'Change Picture',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
