import 'package:flutter/material.dart';

class RoomInfo extends StatelessWidget {
  const RoomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Metrocity Matang',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red, size: 20),
              Text(
                '4',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' (70)',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Othego @ Metrocity offers empty rooms equipped with a fan and shared access to a washing machine. The property features an access door system for added security. Conveniently located near Metrocity Mall and Pizza Hut Matang.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}