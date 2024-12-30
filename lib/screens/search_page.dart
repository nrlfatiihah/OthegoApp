import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the ShowRoomPage
            Navigator.pushNamed(context, '/show-room');
          },
          child: Text('Search'),
        ),
      ),
    );
  }
}
