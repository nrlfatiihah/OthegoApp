import 'package:flutter/material.dart';
import 'package:othego_project/screens/intro_page.dart';
import 'package:othego_project/show_room_screen_google.dart'; // Import your MapScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Othego App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Starting route
      routes: {
        '/': (context) => const IntroPage(),
        '/map': (context) => const MapScreen(), // Define the /map route
        // Add other routes here if needed
      },
    );
  }
}
