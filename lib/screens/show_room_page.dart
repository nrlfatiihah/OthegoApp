import 'package:flutter/material.dart';
import 'package:othego_project/widgets/room_card.dart';

class ShowRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Room'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoomCard(
              title: 'Metrocity Matang',
              details: '3 Bedrooms | 2 Baths',
              extraInfo: 'Washing machine included',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add navigation to another page if needed
              },
              child: Text('View All Locations'),
            ),
          ],
        ),
      ),
    );
  }
}
