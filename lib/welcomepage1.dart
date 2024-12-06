import 'package:flutter/material.dart';

class Welcomepage1 extends StatefulWidget {
  @override
  _Welcomepage1State createState() => _Welcomepage1State();
}

class _Welcomepage1State extends State<Welcomepage1> {
  @override
  void initState() {
    super.initState();
    // Navigate to Welcomepage2 after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, '/welcome2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Text(
                  "Property Management | Room Rental | Cleaning Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'images/welcome_image.jpg',
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
