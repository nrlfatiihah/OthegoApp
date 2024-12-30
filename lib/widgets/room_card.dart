import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String title;
  final String details;
  final String extraInfo;

  RoomCard({
    required this.title,
    required this.details,
    required this.extraInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Container(
        width: 300,
        height: 150,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(details),
            SizedBox(height: 8),
            Text(
              extraInfo,
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
