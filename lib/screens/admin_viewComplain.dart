import 'package:flutter/material.dart';
import 'package:othego_project/screens/admin_viewComplain2.dart';

void main() {
  runApp(AdminViewComplain());
}

class AdminViewComplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminViewComplainScreen(),
    );
  }
}

class AdminViewComplainScreen extends StatelessWidget {
  final List<Map<String, dynamic>> complaints = [
    {
      'name': 'Kamal',
      'date': '27.11.2024',
      'description': 'The toilet is leaking, and it needs repair.',
      'status': 'New',
      'statusColor': Colors.green
    },
    {
      'name': 'Mia',
      'date': '25.11.2024',
      'description':
          'The front door lock is broken and poses a security concern.',
      'status': 'In Progress',
      'statusColor': Colors.red
    },
    {
      'name': 'Robin',
      'date': '01.11.2024',
      'description': 'The air conditioning unit is not working.',
      'status': 'Completed',
      'statusColor': Colors.blue
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Customer Complaint',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
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
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          final complaint = complaints[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    complaint['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    complaint['date'],
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    complaint['description'],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminViewComplain2()),
                          );
                        },
                        child: Text('View Complaint'),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: complaint['statusColor'],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          complaint['status'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
