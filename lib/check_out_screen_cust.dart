import 'package:flutter/material.dart';
import 'package:othego_project/check_out_second_process.dart';
import 'package:othego_project/screens/complainpage.dart';
import 'package:othego_project/show_room_screen_google.dart';

class CheckoutScreen extends StatefulWidget {
  final DateTime? startDate;

  const CheckoutScreen({super.key, this.startDate});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentIndex = 0; // For BottomNavigationBar

  // Method to format the date nicely
  String _formatDate(DateTime date) {
    return "${_getDayOfWeek(date)} ${date.day} ${_getMonthName(date)} ${date.year}";
  }

  String _getDayOfWeek(DateTime date) {
    const days = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    return days[date.weekday - 1];
  }

  String _getMonthName(DateTime date) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[date.month - 1];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Add navigation logic based on selected index
    if (index == 0) {
      // Stay on the current page or implement search navigation
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransactionHistoryPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HelpContactPageApp()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    }
  }

  // function to show the bottom sheet with the price and checkout option
  void _showCheckoutBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Payment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "RM 350",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to SecProcessCheckoutScreen
                      Navigator.pop(context); // Close the bottom sheet
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SecProcessCheckoutScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Check out",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
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
          children: [
            // Step progress bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStep("1", "Apply for lease", true),
                  _buildStep("2", "The owner agreed", false),
                  _buildStep("3", "Pay rent first", false),
                  _buildStep("4", "Success Check-in", false),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade300, thickness: 1),
            // Room details section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'images/B7.7.jpg', // Replace with the actual image path.
                      width: 95,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Woman",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                            height:
                                8), // Add space between Woman container and room label
                        const Text(
                          "Room 3, Double Bed",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Metrocity Matang",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "WiFi - AC - Attached bath",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade300, thickness: 1),
            // Boarding start date section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top pink accent line
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 4), // space between line and text
                    child: const Divider(
                      color: Colors.redAccent,
                      thickness: 3, // Make the line thicker
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Boarding start date",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.startDate != null
                                ? _formatDate(widget.startDate!)
                                : "Not selected",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle edit action
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                  // Bottom pink accent line
                  Container(
                    margin: const EdgeInsets.only(
                        top: 4), // space between text and line
                    child: const Divider(
                      color: Colors.redAccent,
                      thickness: 3, // Make the line thicker
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade300, thickness: 1),
            // First payment details section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "First payment details",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Paid after the boarding house owner approves the rental application.",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dormitory rental fees"),
                      Text("RM 340"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Services fees"),
                      Text("RM 10"),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total payment",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "RM 350",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Voucher"),
                      Text("Select or enter a voucher"),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Bottom payment button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity, // Makes the button full width
                child: ElevatedButton(
                  onPressed: _showCheckoutBottomSheet, // Show the bottom sheet
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Show Price",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
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
              MaterialPageRoute(builder: (context) => const ShowRoomScreen()),
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
          backgroundColor: isActive ? Colors.redAccent : Colors.grey,
          child: Text(
            stepNumber,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
              color: isActive ? Colors.redAccent : Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction History")),
      body: const Center(child: Text("Transaction History Page")),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Homepage")),
      body: const Center(child: Text("Home Page")),
    );
  }
}

class HelpContactPageApp extends StatelessWidget {
  const HelpContactPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Contact")),
      body: const Center(child: Text("Help & Contact Page")),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Center(child: Text("Profile Page")),
    );
  }
}
