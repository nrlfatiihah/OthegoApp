import 'package:flutter/material.dart';
import 'package:othego_project/screens/admin_dashboard.dart';
import 'package:othego_project/screens/admin_viewComplain.dart';
import 'package:othego_project/screens/customer_account.dart';
import 'package:othego_project/screens/review_rating_admin_screen.dart';
import 'package:othego_project/screens/roomlisting_screen.dart';
import 'package:othego_project/screens/transaction_record.dart';

class TransactionDetailsPage extends StatelessWidget {
  final Map<String, String> transaction;

  TransactionDetailsPage({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Transaction Records',
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
            children: [
              const SidebarItem(
                title: 'Dashboard',
                destination: DashboardScreen(),
              ),
              const SidebarItem(
                title: 'Room Listings',
                destination: RoomListingScreen(),
              ),
              const SidebarItem(
                title: 'Customer Account',
                destination: CustomerAccount(),
              ),
              const SidebarItem(
                title: 'Review & Rating',
                destination: ReviewRating(),
              ),
              SidebarItem(
                title: 'Transaction Records',
                destination: TransactionRecordsPage(),
              ),
              const SidebarItem(
                title: 'Customer Complaint',
                destination: AdminViewComplain(),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.red[100],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction['name']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Room Details:'),
                    Text('Branch: Richmond'),
                    Text('Check-in Date: 16.08.2024'),
                    Text('Amount: ${transaction['amount']}'),
                    Text(transaction['paymentMethod']!),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction['date']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            transaction['status']!,
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
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: TextStyle(color: Colors.white),
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
