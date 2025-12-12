import 'package:flutter/material.dart';
import 'package:othego_project/screens/homepage.dart';
import 'package:othego_project/screens/welcome_page.dart';

//main widget class to create an instance of the state using _ReviewRatingCustomer class
class ReviewRatingCustomer extends StatefulWidget {
  const ReviewRatingCustomer({super.key});

  @override
  _ReviewRatingCustomer createState() {
    return _ReviewRatingCustomer();
  }
}

class _ReviewRatingCustomer extends State<ReviewRatingCustomer> {
  final _formKey = GlobalKey<FormState>(); // Form Key for validation
  List<List<bool>> starRatings = List.generate(6, (_) => List.filled(5, false));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your review'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const WelcomePage()),
            );
          },
        ),
        backgroundColor: Colors.red.shade100,
      ),
      body: Form(
        key: _formKey, // Wrap the form with the form key
        child: Container(
          color: Colors.red.shade100,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/M6.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16.0),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('01 Jan 2024 - 01 Jan 2025',
                                    style: TextStyle(fontSize: 14)),
                                SizedBox(height: 4.0),
                                Text('Room 3, Double Bed',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: Colors.red, size: 16),
                                    Text('Metrocity Matang',
                                        style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text('How long were you as a tenant?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      hintText: 'Enter the duration',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter how long you stayed as a tenant.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text("Let's rate your room",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRatingRow('Rent Price', 0),
                      const SizedBox(height: 4.0),
                      _buildRatingRow('Amenities Provided', 1),
                      const SizedBox(height: 4.0),
                      _buildRatingRow('Cleanliness, Comfort & Safety', 2),
                      const SizedBox(height: 4.0),
                      _buildRatingRow('Noise', 3),
                      const SizedBox(height: 4.0),
                      _buildRatingRow('Parking', 4),
                      const SizedBox(height: 4.0),
                      _buildRatingRow('Would you recommend property?', 5),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text('What should we improve?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'State your review here...',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a review for improvement.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Check if the form is valid
                        if (_formKey.currentState!.validate()) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0)),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.0)),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.check_circle,
                                        color: Colors.red, size: 80),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Thank you for your review!',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 24),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Homepage()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 12),
                                      ),
                                      child: const Text('Review Submitted',
                                          style: TextStyle(fontSize: 16)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                      child: const Text('Submit Your Review',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRatingRow(String label, int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(label)),
        Row(
          children: List.generate(5, (index) => _buildStar(rowIndex, index)),
        ),
      ],
    );
  }

  Widget _buildStar(int rowIndex, int index) {
    return IconButton(
      icon: Icon(
        starRatings[rowIndex][index] ? Icons.star : Icons.star_border,
        color: starRatings[rowIndex][index] ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          for (int i = 0; i < 5; i++) {
            starRatings[rowIndex][i] = i <= index;
          }
        });
      },
    );
  }
}
