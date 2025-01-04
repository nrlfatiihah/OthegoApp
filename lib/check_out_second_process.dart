import 'package:flutter/material.dart';
import 'booking_invoice.dart';

class SecProcessCheckoutScreen extends StatelessWidget {
  const SecProcessCheckoutScreen({super.key});

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
            color: isActive ? Colors.redAccent : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text(
            'Checkout',
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.pink.shade50,
          foregroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.pink.shade50, // Set background color here
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
                    _buildStep("2", "The owner agreed", true),
                    _buildStep("3", "Pay rent first", false),
                    _buildStep("4", "Success Check-in", false),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade300, thickness: 1),

              // Success Message Container
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.pink.shade50, // Keep the background color here
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF4444),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Rental application submitted successfully',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Rental application has been approved by\nthe owner successfully.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Payment Button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to ThirdProcessCheckoutScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ThirdProcessCheckoutScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Payment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Navigation Bar
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: 2,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.article), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_outline), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: ''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStepperItem(int number, String text, bool isCompleted) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCompleted ? Colors.red : Colors.grey[300],
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: isCompleted ? Colors.white : Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: isCompleted ? Colors.red : Colors.grey,
        ),
      ),
    ],
  );
}

Widget _buildStepperLine(bool isCompleted) {
  return Container(
    width: 30,
    height: 1,
    color: isCompleted ? Colors.red : Colors.grey[300],
  );
}
