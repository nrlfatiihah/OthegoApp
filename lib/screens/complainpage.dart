import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:othego_project/screens/homepage.dart';
import 'package:othego_project/screens/profile.dart';
import 'package:othego_project/screens/successfulcomplain.dart';
import 'package:othego_project/screens/transactionhistory1.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

void main() {
  runApp(const HelpContactPageApp());
}

//Future<void> _registerUser() async {
// if (_formSignUpKey.currentState!.validate()) {
//try {
//final response = await http.post(
// Uri.parse('http://10.65.132.21/Othego_mobile/signup.php'),
//body: jsonEncode({
//'fullName': _fullNameController.text,
//'email': _emailController.text,
// 'password': _passwordController.text,
// }),
// );

//if (response.statusCode == 200) {
// final responseData = jsonDecode(response.body);
//ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text(responseData['message'])),
// );

//if (responseData['status'] == 'success') {
// Navigate or clear fields upon successful signup
// _fullNameController.clear();
// _emailController.clear();
//_passwordController.clear();
//}
// } else {
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text('Failed to connect to the server')),
// );
// }
//} catch (e) {
// ScaffoldMessenger.of(context).showSnackBar(
//  SnackBar(content: Text('Error: $e')),
// );
// }
//  }
// }

class HelpContactPageApp extends StatelessWidget {
  const HelpContactPageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelpContactPage(),
    );
  }
}

class HelpContactPage extends StatefulWidget {
  const HelpContactPage({super.key});

  @override
  State<HelpContactPage> createState() => _HelpContactPageState();
}

class _HelpContactPageState extends State<HelpContactPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EAE2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "DO U NEED HELP? CONTACT US",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "If you have any issue with your room, please fill in this form",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your full name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Complain here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4747),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.phone, color: Colors.black),
                    SizedBox(height: 5),
                    Text("Phone"),
                    Text("111 111 111"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.email, color: Colors.black),
                    SizedBox(height: 5),
                    Text("E-MAIL"),
                    Text("info@company.com"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
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
            // Navigate to search room
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TransactionHistoryPage()),
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
              MaterialPageRoute(builder: (context) => HelpContactPageApp()),
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
