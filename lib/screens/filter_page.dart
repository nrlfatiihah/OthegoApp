import 'package:flutter/material.dart';
import 'package:othego_project/screens/homepage.dart'; // Import the HomePage

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Filter',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Dropdown
            const Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8),
                Text('Location',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: const [
                DropdownMenuItem(value: 'Batu 4', child: Text('Batu 4')),
                DropdownMenuItem(value: 'batu 9', child: Text('Batu 9')),
                DropdownMenuItem(value: 'Richmond', child: Text('Richmond')),
                DropdownMenuItem(value: 'Tun Zaidi ', child: Text('Tun Zaidi')),
                DropdownMenuItem(value: 'Batu 7', child: Text('batu 7')),
                DropdownMenuItem(value: 'Matang', child: Text('Matang')),
                DropdownMenuItem(value: 'Samarahan', child: Text('Samarahan')),
              ],
              onChanged: (value) {},
              hint: const Text('Select'),
            ),
            const SizedBox(height: 16),
            // Number of Occupants Dropdown
            const Row(
              children: [
                Icon(Icons.person, color: Colors.black),
                SizedBox(width: 8),
                Text('Number of Occupants',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: const [
                DropdownMenuItem(value: '1', child: Text('1')),
                DropdownMenuItem(value: '2', child: Text('2')),
                DropdownMenuItem(
                    value: 'more than 2', child: Text('more than 2')),
              ],
              onChanged: (value) {},
              hint: const Text('Select'),
            ),
            const SizedBox(height: 16),
            // Cost Checkbox
            const Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.black),
                SizedBox(width: 8),
                Text('Cost',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text('RM 350 - RM 400'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text('RM 400 - RM 450'),
              ],
            ),
            const Spacer(),
            // Filter Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to HomePage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'FILTER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
