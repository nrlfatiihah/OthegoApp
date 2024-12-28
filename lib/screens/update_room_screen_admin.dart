import 'package:flutter/material.dart';

class UpdateRoomScreen extends StatefulWidget {
  //represent room details and other information which can be updated
  final String branchName;

  const UpdateRoomScreen({super.key, required this.branchName});

  @override
  _UpdateRoomScreenState createState() =>
      _UpdateRoomScreenState(); //to manage the state of the widget
}

class _UpdateRoomScreenState extends State<UpdateRoomScreen> {
  // Room details to track
  int availableRooms = 0;
  int washrooms = 0;
  int wallFans = 0;
  int exhaustFans = 0;
  int airConditioners = 0;
  int wardrobes = 0;

  // Amenities to track
  bool diningSpace = false;
  bool deskAndChair = false;
  bool washingMachine = false;
  bool bathroomSupplies = false;
  bool kitchenAccess = false;
  bool wifiAccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Room'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        //allowing vertical scrolling
        child: Padding(
          //add padding using column
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Room Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              _buildNumberInputRow("Number of Available Room", () {
                //display label, decrement & increment button with value
                setState(() {
                  if (availableRooms > 0) availableRooms--;
                });
              }, () {
                setState(() {
                  availableRooms++;
                });
              }, availableRooms),
              _buildNumberInputRow("Number of Washroom", () {
                setState(() {
                  if (washrooms > 0) washrooms--;
                });
              }, () {
                setState(() {
                  washrooms++;
                });
              }, washrooms),
              _buildNumberInputRow("Number of Wall Fan", () {
                setState(() {
                  if (wallFans > 0) wallFans--;
                });
              }, () {
                setState(() {
                  wallFans++;
                });
              }, wallFans),
              _buildNumberInputRow("Number of Exhaust Fan", () {
                setState(() {
                  if (exhaustFans > 0) exhaustFans--;
                });
              }, () {
                setState(() {
                  exhaustFans++;
                });
              }, exhaustFans),
              _buildNumberInputRow("Number of Air-Conditioner", () {
                setState(() {
                  if (airConditioners > 0) airConditioners--;
                });
              }, () {
                setState(() {
                  airConditioners++;
                });
              }, airConditioners),
              _buildNumberInputRow("Number of Wardrobe", () {
                setState(() {
                  if (wardrobes > 0) wardrobes--;
                });
              }, () {
                setState(() {
                  wardrobes++;
                });
              }, wardrobes),
              const SizedBox(height: 16),
              const Text(
                "Amenities",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              _buildAmenityToggle("Dining Space", diningSpace, (value) {
                //toggle for dining space
                setState(() {
                  diningSpace = value; //call boolean to update
                });
              }),
              _buildAmenityToggle("Desk and Chair", deskAndChair, (value) {
                //toggle for desk and chair
                setState(() {
                  deskAndChair = value; //call boolean to update
                });
              }),
              _buildAmenityToggle("Washing Machine", washingMachine, (value) {
                //toogle for washing machine
                setState(() {
                  washingMachine = value; //call boolean to update
                });
              }),
              _buildAmenityToggle("Bathroom Supplies", bathroomSupplies,
                  (value) {
                //toggle for bathroom supplies
                setState(() {
                  bathroomSupplies = value; //call bolean to update
                });
              }),
              _buildAmenityToggle("Kitchen Access", kitchenAccess, (value) {
                //toogle for kitchen access
                setState(() {
                  kitchenAccess = value; //call boolean to update
                });
              }),
              _buildAmenityToggle("Wi-Fi Access", wifiAccess, (value) {
                //toggle for wifi access
                setState(() {
                  wifiAccess = value; //call boolean to update
                });
              }),
              const SizedBox(height: 16),
              const Text(
                //allow user to fill in details for property information == description
                "Property Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Write full description of the room rental",
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              const Text(
                "Featured Images",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.upload),
                  label: const Text(
                    //allow user to upload image
                    "Upload Photo",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 64),
                  ),
                  child: const Text(
                    "Update", //update when got clicked and return to the room listing screen
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberInputRow(
    String label,
    VoidCallback onDecrease,
    VoidCallback onIncrease,
    int value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: onDecrease,
              ),
              Text(
                value.toString(),
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.red),
                onPressed: onIncrease,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityToggle(
    String label,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.red,
    );
  }
}
