import 'package:flutter/material.dart';
import 'package:othego_project/screens/complainpage.dart';
import 'package:othego_project/screens/homepage.dart';
import 'package:othego_project/screens/profile.dart';
import 'package:othego_project/screens/room_list_screen.dart';
import 'package:othego_project/screens/transactionhistory1.dart';

class ThirdProcessCheckoutScreen extends StatefulWidget {
  const ThirdProcessCheckoutScreen({super.key});

  @override
  _ThirdProcessCheckoutScreenState createState() =>
      _ThirdProcessCheckoutScreenState();
}

class _ThirdProcessCheckoutScreenState
    extends State<ThirdProcessCheckoutScreen> {
  int _currentIndex = 2; // Set to 2 (Home) to match default index

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.pink.shade50,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.pink.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStep("1", "Apply for lease", true),
                  _buildStep("2", "The owner agreed", true),
                  _buildStep("3", "Pay rent first", true),
                  _buildStep("4", "Success Check-in", false),
                ],
              ),
            ),
            const Divider(color: Colors.red, thickness: 1),

            // Invoice details
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No. Invoice",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Text(
                    "1234567890987654321",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.red, thickness: 1),

            // Payment details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Type of Payment",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Dormitory check-in for 1 month",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const Divider(color: Colors.red, thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Payment Method",
                        style: TextStyle(fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Online Banking",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const Divider(color: Colors.red, thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Voucher",
                        style: TextStyle(fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Insert",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "New User Voucher",
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                  const Divider(color: Colors.red, thickness: 1),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Paid",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "RM350",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See details",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Pay Now button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccessPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red, // Active item color
        unselectedItemColor: Colors.black, // Inactive items color
        backgroundColor: Colors.white,
        iconSize: 30.0,
        currentIndex: _currentIndex, // Update the current index dynamically
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the active index
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RoomListScreen()),
            );
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
              MaterialPageRoute(builder: (context) => const HelpContactPage()),
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

  Widget _buildStep(String stepNumber, String label, bool isActive) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: isActive ? Colors.red : Colors.grey,
          child: Text(
            stepNumber,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.red : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Progress Steps
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStep('1', 'Apply for\nlease', true),
                  _buildStep('2', 'The owner\nagreed', true),
                  _buildStep('3', 'Pay rent\nfirst', true),
                  _buildStep('4', 'Success\nCheck-in', true),
                ],
              ),
            ),
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFFFF4444),
                      radius: 40,
                      child: Icon(
                        Icons.check,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Thank You!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Payment done successfully',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'You will be redirected to home page shortly\nor click the button below.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xFFFF4444)),
                  ),
                ),
                child: const Text('Back to Home Page',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String number, String label, bool completed) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: completed ? const Color(0xFFFF4444) : Colors.grey,
            child: Text(
              number,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: completed ? const Color(0xFFFF4444) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
