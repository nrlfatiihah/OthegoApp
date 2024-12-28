import 'package:flutter/material.dart'; //provides UI components and theming
import 'package:image_picker/image_picker.dart'; //for capturing and choosing picture from device itself
import 'dart:io';
import 'roomlisting_screen.dart'; //navigation purposes

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
  XFile? _pickedImage; // store the images using ImagePicker
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
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.file_upload, color: Colors.red),
                              SizedBox(width: 8),
                              Text('Select File'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        try {
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.camera,
                            maxHeight: 800, // optional: Limit image resolution
                            maxWidth: 800,
                          );

                          if (image != null) {
                            setState(() {
                              _pickedImage = image; // store the captured image
                            });
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error opening camera: $e')),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Open Camera & Take Photo',
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                    if (_pickedImage != null) ...[
                      const SizedBox(height: 10),
                      Image.file(
                        File(_pickedImage!.path),
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSuccess = true;
                    });
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RoomListingScreen(),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button background color
                    foregroundColor: Colors.white, // Text color
                    minimumSize:
                        const Size.fromHeight(50), // Optional: Adjust size
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
