import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:othego_project/review_rating_cust.dart';
import 'package:othego_project/select_check_in_date_cust.dart';

class RoomDetails2 extends StatelessWidget {
  final Map<String, dynamic> roomData;

  const RoomDetails2({super.key, required this.roomData});

  @override
  Widget build(BuildContext context) {
    // List of image asset paths
    final List<String> imagePaths = [
      'images/R1.jpg',
      'images/R2.jpg',
      'images/R3.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Carousel
          CarouselSlider(
            items: imagePaths.map((path) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    path,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),

          // Property Info
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Royal Richmond',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Icon(Icons.star_border, color: Colors.orange, size: 16),
                    SizedBox(width: 8),
                    Text('4.0 (70)', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Othego @ Richmond offers empty rooms equipped with a fan and shared access to a washing machine. The property features an access door system for added security. Conveniently located near Green Height Mall and Saradise.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '3rd Floor Lot 13003 [SL.19] Royal Richmond PH2, Jalan Datuk Bandar Mustapha Kuching, Sarawak',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Add Review Link
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewRatingCustomer()),
                    );
                  },
                  child: const Text(
                    'Reviews',
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(), // Bottom Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RM 350/month',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See all prices',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
