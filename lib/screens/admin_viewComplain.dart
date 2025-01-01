import 'package:flutter/material.dart';
import 'package:othego_project/screens/admin_dashboard.dart';
import 'package:othego_project/screens/admin_viewComplain2.dart';
import 'package:othego_project/screens/customer_account.dart';
import 'package:othego_project/screens/review_rating_admin_screen.dart';
import 'package:othego_project/screens/roomlisting_screen.dart';
import 'package:othego_project/screens/transaction_record.dart';

class AdminViewComplain extends StatefulWidget {
  const AdminViewComplain({super.key});

  @override
  _AdminViewComplainState createState() => _AdminViewComplainState();
}

class _AdminViewComplainState extends State<AdminViewComplain> {
  final List<Map<String, dynamic>> complaints = [
    {
      'name': 'Kamal',
      'date': '27.11.2024',
      'description': 'The toilet is leaking, and it needs repair.',
      'status': 'New',
      'statusColor': Colors.green,
      'image': 'images/Tun_Zaidi_11.jpg'
    },
    {
      'name': 'Mia',
      'date': '25.11.2024',
      'description':
          'The front door lock is broken and poses a security concern.',
      'status': 'In Progress',
      'statusColor': Colors.orange,
      'image': 'images/door_access.jpg'
    },
    {
      'name': 'Robin',
      'date': '01.11.2024',
      'description': 'The washing machine unit is not working.',
      'status': 'Completed',
      'statusColor': Colors.blue,
      'image': 'images/washing_machine.jpg'
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'New':
        return Colors.green;
      case 'In Progress':
        return Colors.orange;
      case 'Completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

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
              SidebarItem(
                title: 'Dashboard',
                destination: DashboardScreen(),
              ),
              SidebarItem(
                title: 'Room Listings',
                destination: RoomListingScreen(),
              ),
              SidebarItem(
                title: 'Customer Account',
                destination: CustomerAccount(),
              ),
              SidebarItem(
                title: 'Review & Rating',
                destination: ReviewRating(),
              ),
              SidebarItem(
                title: 'Transaction Records',
                destination: TransactionRecordsPage(),
              ),
              SidebarItem(
                title: 'Customer Complaint',
                destination: AdminViewComplain(),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          final complaint = complaints[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
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
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminViewComplain2(
                                complaint: complaint,
                                onUpdateStatus: (newStatus) {
                                  setState(() {
                                    complaints[index]['status'] = newStatus;
                                    complaints[index]['statusColor'] =
                                        _getStatusColor(newStatus);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                        child: const Text('View Complaint'),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: complaint['statusColor'],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          complaint['status'],
                          style: const TextStyle(
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
  final Widget destination;

  const SidebarItem({
    super.key,
    required this.title,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
