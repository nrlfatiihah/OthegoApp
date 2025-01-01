import 'package:flutter/material.dart';
import 'package:othego_project/widgets/room_card.dart';
import 'package:othego_project/screens/homepage.dart';
import 'package:othego_project/screens/profile.dart';
import 'package:othego_project/screens/transactionhistory1.dart';
import 'package:othego_project/screens/complainpage.dart';

class ShowRoomPage extends StatefulWidget {
  const ShowRoomPage({super.key});

  @override
  _ShowRoomPageState createState() => _ShowRoomPageState();
}

class _ShowRoomPageState extends State<ShowRoomPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Room'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RoomCard(
              title: 'Metrocity Matang',
              details: '3 Bedrooms | 2 Baths',
              extraInfo: 'Washing machine included',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to another page or perform an action
              },
              child: const Text('View All Locations'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        iconSize: 30.0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            // Stay on the current page or implement search navigation
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransactionHistoryPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpContactPageApp()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transaction History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
