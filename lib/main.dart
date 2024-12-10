import 'package:flutter/material.dart';
import 'welcomepage1.dart';
import 'welcomepage2.dart';
import 'package:othego_project/profile_settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcomepage1(),
        '/welcome2': (context) => Welcomepage2(),
        '/profile': (context) => const ProfileSettingsScreen(),
      },
    );
  }
}
