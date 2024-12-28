import 'package:flutter/material.dart';
import 'package:othego_project/screens/admin_viewComplain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dashboard UI',
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Dashboard',
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
                destination: DashboardScreen(),
              ),
              SidebarItem(
                title: 'Customer Account',
                destination: DashboardScreen(),
              ),
              SidebarItem(
                title: 'Review & Rating',
                destination: DashboardScreen(),
              ),
              SidebarItem(
                title: 'Transaction Records',
                destination: DashboardScreen(),
              ),
              SidebarItem(
                title: 'Customer Complaint',
                destination: AdminViewComplain(),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomerReviewSection(),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: const [
                  InfoCard(title: "Transaction Records", isBold: true),
                  InfoCard(title: "Customer Complaint", isBold: true),
                  CustomerAccountsCard(),
                ],
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

class CustomerReviewSection extends StatelessWidget {
  const CustomerReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red[100],
                radius: 30,
                child: Icon(Icons.person, size: 40, color: Colors.red[800]),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Customer Review',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
            ),
            child: const Text('View Customer Review'),
          )
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final bool isBold;
  final String? percentage;
  final String? secondaryPercentage;
  final Color? chartColor;

  const InfoCard({
    super.key,
    required this.title,
    this.isBold = false,
    this.percentage,
    this.secondaryPercentage,
    this.chartColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: isBold ? 25 : 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerAccountsCard extends StatelessWidget {
  const CustomerAccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customer Accounts',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8, // Horizontal spacing between items
            runSpacing: 8, // Vertical spacing between rows
            children: List.generate(
              4,
              (index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red[200],
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(
                      height: 4), // Space between the icon and the username
                  Text(
                    'User ${index + 1}', // User name
                    style: const TextStyle(fontSize: 12, color: Colors.black),
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
