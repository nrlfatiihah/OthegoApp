import 'package:flutter/material.dart'; //provides UI components and theming
//import 'package:image_picker/image_picker.dart'; //for capturing and choosing picture from device itself
//import 'dart:io';
import 'roomlisting_screen.dart'; //navigation purposes
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddRoomScreen extends StatefulWidget {
  //allows user to add details of new room
  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() =>
      _AddRoomScreenState(); //widget initialization
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  String? selectedLocation; //hold dropdown states for location
  List<String> locations = [
    'Richmond',
    'Batu 4',
    'Tun Zaidi',
    'Chai Yi Building',
    'Uni-Central',
    'Batu 7',
    'Batu 9',
    'Metrocity Matang'
  ];
  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController amenitiesController = TextEditingController();
  bool isSuccess = false; //indication if room was successfully added

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Add New Room'),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            //action widget
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.red),
          ),
        ],
      ),
      body: Stack(
        //overlay widgets
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                TextField(
                  controller: roomNameController,
                  decoration: const InputDecoration(
                    labelText: 'Room Name',
                    border: OutlineInputBorder(), //red border
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(), //red border
                  ),
                  items: locations
                      .map((loc) => DropdownMenuItem<String>(
                            value: loc,
                            child: Text(loc),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedLocation = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: amenitiesController,
                  decoration: const InputDecoration(
                    labelText: 'Amenities',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (roomNameController.text.isEmpty ||
                        selectedLocation == null ||
                        priceController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill all required fields!')),
                      );
                      return;
                    }

                    try {
                      final response = await http.post(
                        Uri.parse(
                            'http://10.65.130.51/Othego_mobile/add_room.php'), // Update with your server URL
                        body: {
                          'roomName': roomNameController.text,
                          'roomLoc': selectedLocation,
                          'roomPrice': priceController.text,
                          'roomDesc': amenitiesController.text,
                          'roomAvailability':
                              '1', // Assuming '1' means available
                        },
                      );

                      if (response.statusCode == 200) {
                        final result = jsonDecode(response.body);
                        if (result['status'] == 'success') {
                          setState(() {
                            isSuccess = true;
                          });
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RoomListingScreen()),
                            );
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Error: ${result['message']}')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Failed to connect to the server')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
          if (isSuccess)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text(
                      'New Room Has Added!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Added Successfully!',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
