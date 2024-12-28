import 'package:flutter/material.dart';

void main() {
  runApp(const ReviewRatingScreen());
}

class ReviewRatingScreen extends StatelessWidget {
  const ReviewRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReviewRating(),
    );
  }
}

class ReviewRating extends StatefulWidget {
  const ReviewRating({super.key});

  @override
  State<ReviewRating> createState() => _ReviewRatingState();
}

class _ReviewRatingState extends State<ReviewRating> {
  List<Map<String, dynamic>> reviews = [
    {
      'branch': 'Richmond',
      'date': '28.11.2024',
      'rating': 5,
      'review': 'I like the view from my room, love it.',
    },
    {
      'branch': 'Uni-Central Samarahan',
      'date': '20.11.2024',
      'rating': 3,
      'review': 'The provided kitchenware is complete.',
    },
    {
      'branch': 'Matang',
      'date': '10.10.2024',
      'rating': 4,
      'review': 'This property does provide 2 bathrooms.',
    },
    {
      'branch': 'Tun Zaidi',
      'date': '01.10.2024',
      'rating': 2,
      'review': 'Why only have a bed frame but no mattress?',
    },
  ];

  String filterOption = 'Date';
  String? selectedMonth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review & Rating'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: filterOption,
              onChanged: (value) {
                setState(() {
                  filterOption = value!;
                  selectedMonth =
                      null; // Reset month selection when filter changes.
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Date',
                  child: Text('Date'),
                  onTap: () {
                    // Additional logic can go here.
                  },
                ),
                DropdownMenuItem(
                  value: 'Month',
                  child: DropdownButton<String>(
                    hint: const Text('Month'),
                    value: selectedMonth,
                    onChanged: (value) {
                      setState(() {
                        selectedMonth = value!;
                      });
                    },
                    items: [
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December',
                    ].map((month) {
                      return DropdownMenuItem(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                  ),
                ),
                DropdownMenuItem(
                  value: 'SortRatingAsc',
                  child: const Text('Sort by Rating (Asc)'),
                  onTap: () {
                    setState(() {
                      reviews
                          .sort((a, b) => a['rating'].compareTo(b['rating']));
                    });
                  },
                ),
                DropdownMenuItem(
                  value: 'SortRatingDesc',
                  child: const Text('Sort by Rating (Desc)'),
                  onTap: () {
                    setState(() {
                      reviews
                          .sort((a, b) => b['rating'].compareTo(a['rating']));
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(review['branch']),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(review: review),
                              ),
                            );
                          },
                          child: const Text('View'),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${review['date']}'),
                        Row(
                          children: List.generate(
                            review['rating'],
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                        ),
                        Text(review['review']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> review;

  const DetailPage({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Details'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Branch: ${review['branch']}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Date: ${review['date']}'),
            const SizedBox(height: 16),
            const Text('Ratings:', style: TextStyle(fontSize: 16)),
            Row(
              children: List.generate(
                review['rating'],
                (index) => const Icon(
                  Icons.star,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Review: ${review['review']}'),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Review Updated!')),
                    );
                  },
                  child: const Text('Update'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
