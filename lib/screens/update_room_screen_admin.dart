import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateRoomScreen extends StatefulWidget {
  final int roomID;
  final String roomName;
  final String roomDesc;
  final String roomLoc;
  final double roomPrice;
  final int roomAvailability;

  const UpdateRoomScreen({
    Key? key,
    required this.roomID,
    required this.roomName,
    required this.roomDesc,
    required this.roomLoc,
    required this.roomPrice,
    required this.roomAvailability,
  }) : super(key: key);

  @override
  _UpdateRoomScreenState createState() => _UpdateRoomScreenState();
}

class _UpdateRoomScreenState extends State<UpdateRoomScreen> {
  final _formKey = GlobalKey<FormState>();

  late String roomName;
  late String roomDesc;
  late String roomLoc;
  late double roomPrice;
  late int roomAvailability;

  @override
  void initState() {
    super.initState();
    roomName = widget.roomName;
    roomDesc = widget.roomDesc;
    roomLoc = widget.roomLoc;
    roomPrice = widget.roomPrice;
    roomAvailability = widget.roomAvailability;
  }

  // Inside UpdateRoomScreen
  Future<void> updateRoomDetails() async {
    final url = Uri.parse('http://10.0.2.2:8080/Othego_mobile/update_room.php');

    final response = await http.post(url, body: {
      'roomID': widget.roomID.toString(),
      'roomName': roomName,
      'roomDesc': roomDesc,
      'roomLoc': roomLoc,
      'roomPrice': roomPrice.toString(),
      'roomAvailability': roomAvailability.toString(),
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Room updated successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to update room: ${responseData['message']}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Server error: ${response.statusCode}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Room'),
        backgroundColor: Colors.red,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: roomName,
                  decoration: const InputDecoration(labelText: 'Room Name'),
                  onChanged: (value) => roomName = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Room name is required' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: roomDesc,
                  decoration:
                      const InputDecoration(labelText: 'Room Description'),
                  onChanged: (value) => roomDesc = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Room description is required' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: roomLoc,
                  decoration: const InputDecoration(labelText: 'Room Location'),
                  onChanged: (value) => roomLoc = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Room location is required' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: roomPrice.toString(),
                  decoration: const InputDecoration(labelText: 'Room Price'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      roomPrice = double.tryParse(value) ?? 0.0,
                  validator: (value) =>
                      value!.isEmpty ? 'Room price is required' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: roomAvailability.toString(),
                  decoration:
                      const InputDecoration(labelText: 'Room Availability'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      roomAvailability = int.tryParse(value) ?? 0,
                  validator: (value) =>
                      value!.isEmpty ? 'Room availability is required' : null,
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updateRoomDetails();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                    ),
                    child: const Text(
                      'Update Room',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
