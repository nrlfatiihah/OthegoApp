import 'package:flutter/material.dart';

class ReviewRating extends StatefulWidget {
  //this class manage list of review, filtered list, sorting & selecting reviews by month, ascending in rating and descending in rating
  const ReviewRating({super.key});

  @override
  State<ReviewRating> createState() => _ReviewRatingState();
}

class _ReviewRatingState extends State<ReviewRating> {
  //contin list of reviews that represented by map
  List<Map<String, dynamic>> reviews = [
    //hold information of the branch
    {
      'branch': 'Richmond',
      'date': '28.11.2024',
      'rating': 5,
      'review': 'I like the view from my room, love it.',
      'reviewer': 'Kamal Adli',
      'image': 'images/B4.1.jpg',
      'reply': ''
    },
    {
      'branch': 'Uni-Central Samarahan',
      'date': '20.11.2024',
      'rating': 3,
      'review': 'The provided kitchenware is complete.',
      'reviewer': 'Sarah Lee',
      'image': 'images/B7.1.jpg',
      'reply': ''
    },
    {
      'branch': 'Matang',
      'date': '10.10.2024',
      'rating': 4,
      'review': 'This property does provide 2 bathrooms.',
      'reviewer': 'John Doe',
      'image': 'images/B9.1.jpg',
      'reply': ''
    },
    {
      'branch': 'Tun Zaidi',
      'date': '01.03.2024',
      'rating': 2,
      'review': 'Why only have a bed frame but no mattress?',
      'reviewer': 'Ahmad Ali',
      'image': 'images/CY7.jpg',
      'reply': ''
    },
  ];

  List<Map<String, dynamic>> filteredReviews =
      []; //holds list of reviews after filtering it
  String filterOption = 'Date'; //tracks the selected filter
  String? selectedMonth; //tracks the selected month

  @override
  void initState() {
    //copies the review before initiallize
    super.initState();
    filteredReviews = List.from(reviews); // initialize the filtered list
  }

  String maskName(String name) {
    //mask up the name of client
    List<String> parts = name.split(' ');
    return parts
        .map((part) =>
            part[0] +
            '*' * (part.length - 2) +
            part.substring(part.length - 1)) //to maintain privacy in the middle
        .join(' ');
  }

  void filterByMonth(String month) {
    //comparing the month using date
    int monthIndex = [
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
          'December'
        ].indexOf(month) +
        1;

    setState(() {
      filteredReviews = reviews
          .where(
              (review) => int.parse(review['date'].split('.')[1]) == monthIndex)
          .toList(); //eg: if user click on January, it will check is it match with the month in digit, 1
    }); //if it is matches, then it will output only that particularly of the month
  }

  void removeReview(int index) {
    setState(() {
      filteredReviews
          .removeAt(index); //remove the selected review from displaying
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //provide structure with app bar and body
      appBar: AppBar(
        title: const Text('Review & Rating'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              //user click on date, it will show list of months to be chose
              value: filterOption, //either Date, Month, or Sort by Rating
              onChanged: (value) {
                setState(() {
                  filterOption = value!;
                  selectedMonth = null; // reset month selection
                  if (filterOption == 'SortRatingAsc') {
                    //sort the review by rating in ascending
                    filteredReviews
                        .sort((a, b) => a['rating'].compareTo(b['rating']));
                  } else if (filterOption == 'SortRatingDesc') {
                    //sort the review by rating in descending
                    filteredReviews
                        .sort((a, b) => b['rating'].compareTo(a['rating']));
                  } else {
                    filteredReviews =
                        List.from(reviews); // reset filter for other options
                  }
                });
              },
              items: const [
                DropdownMenuItem(
                  //dropdown date
                  value: 'Date',
                  child: Text('Date'),
                ),
                DropdownMenuItem(
                  value: 'Month', //dropdown months
                  child: Text('Month'),
                ),
                DropdownMenuItem(
                  value: 'SortRatingAsc',
                  child: Text('Sort by Rating (Asc)'),
                ),
                DropdownMenuItem(
                  value: 'SortRatingDesc',
                  child: Text('Sort by Rating (Desc)'),
                ),
              ],
            ),
          ),
          if (filterOption == 'Month')
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                hint: const Text('Select Month'),
                value: selectedMonth,
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                    if (selectedMonth != null) {
                      filterByMonth(selectedMonth!);
                    }
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
          Expanded(
            child: ListView.builder(
              itemCount: filteredReviews.length,
              itemBuilder: (context, index) {
                final review = filteredReviews[index];
                return Card(
                  //displaying review individually
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          review['image'],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                maskName(review['reviewer']),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text('Branch: ${review['branch']}'),
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
                              const SizedBox(height: 4),
                              Text(
                                review['review'],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        //navigates to the DetailPage
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage(review: review),
                                          ),
                                        );
                                      },
                                      child: const Text('View Details'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        removeReview(index);
                                      },
                                      child: const Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

class DetailPage extends StatefulWidget {
  //this class will be called if user choose the review
  final Map<String, dynamic> review;

  const DetailPage({super.key, required this.review});

  @override
  _DetailPageState createState() {
    //displays selected review and allows user to reply into the reply box
    return _DetailPageState(); //allow user to submit
  }
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _replyController = TextEditingController();

  void _submitReply(BuildContext context) {
    //this function will update the reply made
    setState(() {
      widget.review['reply'] = _replyController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
              'Reply successfully sent!')), //and show the confirmation message
    );

    //navigate back to the ReviewRating page
    Navigator.pop(context);
  }

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
            Image.asset(
              widget.review['image'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'Branch: ${widget.review['branch']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Date: ${widget.review['date']}'),
            const SizedBox(height: 16),
            const Text('Ratings:', style: TextStyle(fontSize: 16)),
            Row(
              children: List.generate(
                widget.review['rating'],
                (index) => const Icon(
                  Icons.star,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Review: ${widget.review['review']}'),
            const SizedBox(height: 16),
            Text('Reviewer: ${maskName(widget.review['reviewer'])}'),
            const SizedBox(height: 16),
            // Display the current reply
            if (widget.review['reply'] != '')
              Text(
                'Reply: ${widget.review['reply']}',
                style:
                    const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            const SizedBox(height: 16),
            // Reply text field
            TextField(
              controller: _replyController,
              decoration: const InputDecoration(
                labelText: 'Your reply',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _submitReply(context),
              child: const Text('Submit Reply'),
            ),
          ],
        ),
      ),
    );
  }

  String maskName(String name) {
    List<String> parts = name.split(' ');
    return parts
        .map((part) =>
            part[0] + '*' * (part.length - 2) + part.substring(part.length - 1))
        .join(' ');
  }
}
