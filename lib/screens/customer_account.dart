import 'package:flutter/material.dart';
import 'package:othego_project/screens/admin_dashboard.dart';
import 'package:othego_project/screens/admin_viewComplain.dart';
import 'package:othego_project/screens/roomlisting_screen.dart';

class CustomerAccount extends StatefulWidget {
  const CustomerAccount({super.key});

  @override
  _CustomerAccountState createState() => _CustomerAccountState();
}

class _CustomerAccountState extends State<CustomerAccount> {
  final List<Map<String, String>> customers = [
    {
      'name': 'Kamal Adli',
      'email': 'kamaladli@gmail.com',
      'phone': '0123456789',
      'image': 'images/profile_picture.png',
    },
    {
      'name': 'Nur Liliana',
      'email': 'liliana009@gmail.com',
      'phone': '0137263527',
      'image': 'images/profile2.png',
    },
    {
      'name': 'Ryan Iskandar',
      'email': 'ryaniskandar@gmail.com',
      'phone': '0193726183',
      'image': 'images/profile3.png',
    },
    {
      'name': 'Vivy Sherry',
      'email': 'vivysherry@gmail.com',
      'phone': '0149273641',
      'image': 'images/profile4.png',
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
        title: const Text(
          'Customer Accounts',
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
          color: Colors.black,
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
      body: Container(
        color: Colors.red[300],
        child: ListView.builder(
          itemCount: customers.length,
          itemBuilder: (context, index) {
            final customer = customers[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(customer['image']!),
                  ),
                  title: Text(customer['name']!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(customer['email']!),
                      Text(customer['phone']!),
                    ],
                  ),
                  isThreeLine: true,
                ),
              ),
            );
          },
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
