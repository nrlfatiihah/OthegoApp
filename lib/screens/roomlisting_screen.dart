import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:othego_project/screens/add_room_branch_admin_screen.dart';
import 'package:othego_project/screens/update_room_screen_admin.dart';

class RoomListingScreen extends StatefulWidget {
  const RoomListingScreen({super.key});

  @override
  _RoomListingScreenState createState() => _RoomListingScreenState();
}

class _RoomListingScreenState extends State<RoomListingScreen> {
  List<Map<String, dynamic>> rooms = []; // To store room data
  bool isLoading = true; // To show a loading indicator

  // Function to fetch room data from PHP API
  Future<void> fetchRooms() async {
    try {
      final response = await http
          .get(Uri.parse('http://10.65.130.51/Othego_mobile/get_room.php'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          rooms = data
              .map((room) => {
                    "roomID": int.parse(room['roomID']),
                    "roomName": room['roomName'],
                    "roomLoc": room['roomLoc'],
                    "roomPrice": room['roomPrice'],
                    "roomDesc": room['roomDesc'],
                  })
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load rooms');
      }
    } catch (e) {
      print('Error fetching rooms: $e');
      setState(() {
        isLoading = false; // Stop loading if an error occurs
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Listings'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: rooms.length,
                    itemBuilder: (context, index) {
                      return RoomCard(
                        roomID: rooms[index]
                            ['roomID'], // Ensure roomID is passed
                        roomName: rooms[index]['roomName'] ?? 'Unknown',
                        roomLoc: rooms[index]['roomLoc'] ?? 'Unknown',
                        roomPrice: rooms[index]['roomPrice']?.toString() ?? '0',
                        roomDesc: rooms[index]['roomDesc'] ?? 'No description',
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddRoomScreen()),
                      );
                    },
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

class RoomCard extends StatelessWidget {
  final int roomID;
  final String roomName;
  final String roomLoc;
  final String roomPrice;
  final String roomDesc;

  const RoomCard({
    super.key,
    required this.roomID,
    required this.roomName,
    required this.roomLoc,
    required this.roomPrice,
    required this.roomDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Room: $roomName',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text('Location: $roomLoc'),
                    Text('Price: \$${roomPrice}'),
                    Text('Amenities: $roomDesc'),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                // Push to update room screen and wait for result
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateRoomScreen(
                      roomID: roomID,
                      roomName: roomName,
                      roomDesc: roomDesc,
                      roomLoc: roomLoc,
                      roomPrice: double.parse(roomPrice),
                      roomAvailability: 1, // Replace with actual data
                    ),
                  ),
                );
              },
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
