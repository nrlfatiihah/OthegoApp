import 'package:flutter/material.dart';

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

  void removeReview(int index) {
    setState(() {
      reviews.removeAt(index);
    });
  }

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
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 'Date',
                  child: Text('Date'),
                ),
                DropdownMenuItem(
                  value: 'Branch',
                  child: Text('Branch'),
                ),
                DropdownMenuItem(
                  value: 'Rating',
                  child: Text('Rating'),
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
                    title: Text(review['branch']),
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
                        Text('Review: ${review['review']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                        TextButton(
                          onPressed: () => removeReview(index),
                          child: const Text('Remove'),
                        ),
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
  //display details and ratings for selected review card
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
