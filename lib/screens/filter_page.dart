import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Filter',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Dropdown
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8),
                Text('Location',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: [
                DropdownMenuItem(value: 'Batu 4', child: Text('Batu 4')),
                DropdownMenuItem(value: 'batu 9', child: Text('Batu 9')),
                DropdownMenuItem(value: 'Richmond', child: Text('Richmond')),
                DropdownMenuItem(value: 'Tun Zaidi ', child: Text('Tun Zaidi')),
                DropdownMenuItem(value: 'Batu 7', child: Text('batu 7')),
                DropdownMenuItem(value: 'Matang', child: Text('Matang')),
                DropdownMenuItem(value: 'Samarahan', child: Text('Samarahan')),
              ],
              onChanged: (value) {},
              hint: Text('Select'),
            ),
            SizedBox(height: 16),
            // Number of Occupants Dropdown
            Row(
              children: [
                Icon(Icons.person, color: Colors.black),
                SizedBox(width: 8),
                Text('Number of Occupants',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: [
                DropdownMenuItem(value: '1', child: Text('1')),
                DropdownMenuItem(value: '2', child: Text('2')),
                DropdownMenuItem(
                    value: 'more than 2', child: Text('more than 2')),
              ],
              onChanged: (value) {},
              hint: Text('Select'),
            ),
            SizedBox(height: 16),
            // Cost Checkbox
            Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.black),
                SizedBox(width: 8),
                Text('Cost',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text('RM 350 - RM 400'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text('RM 400 - RM 450'),
              ],
            ),
            Spacer(),
            // Filter Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
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

// navigate filterpage 
//Navigator.pushNamed(context, '/filter');
//engkah navigator ya dekat room listings page 

