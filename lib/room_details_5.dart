import 'package:flutter/material.dart';

class RoomDetails5 extends StatelessWidget {
  const RoomDetails5({super.key, required Map<String, dynamic> roomData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chai Yi Building Details'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/CY2.jpg', height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text(
              'Chai Yi Building, BDC',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Have 2 rooms completed with bedframe and wardrobe\n• Spacious layout\n• Kitchen access with balcony\n• Near to Excellence Delight, Few minutes to Saradise',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tags:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('8 bedrooms')),
                Chip(label: Text('2 bath')),
                Chip(label: Text('Near Excellence Delight')),
                Chip(label: Text('5 minutes to Saradise')),
                Chip(
                    label:
                        Text('5-8 minutes to Kuching International Airport')),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'RM 750/month',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Book Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
