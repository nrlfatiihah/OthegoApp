import 'package:flutter/material.dart';
import 'package:othego_project/models/room.dart';
import 'package:othego_project/widgets/room_card.dart';

class RoomListScreen extends StatelessWidget {
  const RoomListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Show room page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RoomCard(
            room: Room(
              name: 'Metrocity Matang',
              description: 'Empty room with fan\nWashing machine\nAccess door system',
              pricePerMonth: 350,
              features: ['7 bedrooms', '3 baths', 'Washing Machine provided'],
              images: ['https://example.com/room-image.jpg'],
              location: 'Lot 183 corner lot Lot 182 (intermediate lot), Metro City, Q3059, Taman Fan Yah, 93050 Kuching, Sarawak',
              rating: 4.0,
              reviews: 70,
            ),
            onTap: () => Navigator.pushNamed(context, '/room-details'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}