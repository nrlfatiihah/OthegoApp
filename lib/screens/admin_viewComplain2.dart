import 'package:flutter/material.dart';

void main() {
  runApp(const AdminViewComplain2());
}

class AdminViewComplain2 extends StatelessWidget {
  const AdminViewComplain2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminViewComplain2Screen(),
    );
  }
}

class AdminViewComplain2Screen extends StatefulWidget {
  const AdminViewComplain2Screen({super.key});

  @override
  _AdminViewComplain2ScreenState createState() =>
      _AdminViewComplain2ScreenState();
}

class _AdminViewComplain2ScreenState extends State<AdminViewComplain2Screen> {
  String selectedStatus = 'New';

  final Map<String, dynamic> complaint = {
    'name': 'Kamal',
    'date': '27.11.2024',
    'description': 'The toilet is leaking, and it needs repair.',
    'image': 'images/Tun_Zaidi_11.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Customer Complaint',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
          )
        ],
      ),
      drawer: Drawer(
        //SideBar
        child: Container(
          color: Colors.black, // Background color for sidebar
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: const [
              SidebarItem(title: 'Dashboard'),
              SidebarItem(title: 'Room Listings'),
              SidebarItem(title: 'Customer Account'),
              SidebarItem(title: 'Review & Rating'),
              SidebarItem(title: 'Transaction Records'),
              SidebarItem(title: 'Customer Complaint'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      'images/Tun_Zaidi_11.jpg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          complaint['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          complaint['date'],
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          complaint['description'],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: selectedStatus,
                          decoration: InputDecoration(
                            labelText: 'Status',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: ['New', 'In Progress', 'Completed']
                              .map((status) => DropdownMenuItem(
                                    value: status,
                                    child: Text(status),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedStatus = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle update logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'UPDATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;

  const SidebarItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
