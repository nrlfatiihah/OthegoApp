import 'package:flutter/material.dart';
import 'update_room_screen_admin.dart';
import 'add_room_branch_admin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room Listing',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const RoomListingScreen(),
    );
  }
}

class RoomListingScreen extends StatelessWidget {
  //display list of branches
  const RoomListingScreen({super.key});

  final List<Map<String, String>> branches = const [
    {"name": "Richmond", "image": "assets/R2.jpg"},
    {"name": "Batu 4", "image": "assets/B4.3.jpg"},
    {"name": "Tun Zaidi", "image": "assets/Tun_Zaidi_1.jpg"},
    {"name": "Matang", "image": "assets/M6.jpg"},
    {"name": "Batu 9, Kota Padawan", "image": "assets/B9.1.jpg"},
    {"name": "Batu 7", "image": "assets/B7.1.jpg"},
    {"name": "Uni-Central Samarahan", "image": "assets/S1.jpg"},
    {"name": "Chai Yi Building", "image": "assets/CY7.jpg"},
  ];

  void navigateToAddRoom(BuildContext context) {
    //if user clicked on add new room button, this function will be called
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddRoomScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Listings'), //screen title
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: branches.length,
              itemBuilder: (context, index) {
                return RepaintBoundary(
                  child: BranchCard(
                    branchName: branches[index]['name']!,
                    imagePath: branches[index]['image']!,
                    onUpdate: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateRoomScreen(
                            branchName: branches[index]['name']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.black,
            child: TextButton(
              onPressed: () => navigateToAddRoom(context),
              child: const Text(
                'Add New Room',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BranchCard extends StatelessWidget {
  //list of branch cards
  final String branchName;
  final String imagePath;
  final VoidCallback onUpdate;

  const BranchCard({
    super.key,
    required this.branchName,
    required this.imagePath,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Card(
        elevation: 2, // Reduced for performance
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 120,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 120, color: Colors.red);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Branch: $branchName',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text('Room Details'),
                    const Text('Amenities'),
                    const Text('Property Information'),
                    const Text('Featured Images'),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: onUpdate,
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
