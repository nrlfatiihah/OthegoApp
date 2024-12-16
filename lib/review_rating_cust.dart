import 'package:flutter/material.dart';

//main widget class to create an instance of the state using _ReviewRatingCustomer class
class ReviewRatingCustomer extends StatefulWidget {
  const ReviewRatingCustomer(
      {super.key}); //const keyword is to help to instantiated during compile
  //super.key allows passing a key to the parent class

  @override
  _ReviewRatingCustomer createState() =>
      _ReviewRatingCustomer(); //create an instance to hold the state of the widget
}

class _ReviewRatingCustomer extends State<ReviewRatingCustomer> {
  //initialize 2D list starRatings by holding boolean values
  //each star contain true(color star) or false(no color star)
  List<List<bool>> starRatings = List.generate(6, (_) => List.filled(5, false));

  @override
  //called whenever the state changes
  Widget build(BuildContext context) {
    //constructs the UI using Scaffold
    return Scaffold(
      appBar: AppBar(
        //create an app bar with title and a button
        //display the title with back button
        title: Text('Add your review'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.red.shade100,
      ),
      body: Container(
        //
        color: Colors.red.shade100,
        child: SingleChildScrollView(
          //allows content to be scrollable if it is exceeds the screen height
          child: Padding(
            //add spaces around the content
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //main content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //set it in vertical array by aligning to the left
                Card(
                  //display the property details with image, date , room type and location
                  //separate the review section from other content
                  shape: RoundedRectangleBorder(
                    //card created with rounded corners to display the details of the property
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    //adding spaces of the property details in the card
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      //first row
                      children: [
                        Image.asset(
                          'assets/M6.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            //second column of the property cards
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //display booking details
                              Text(
                                  '01 Jan 2024 - 01 Jan 2025', //display booking date
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(height: 4.0),
                              Text('Room 3, Double Bed', //display room type
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
                  ), //end property details card
                ),
                SizedBox(height: 16.0),
                Text(
                  //label prompts
                  'How long were you as a tenant?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  //allow user to enter how long they stayed as tenants
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    hintText: ' ',
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  //rating section
                  "Let's rate your room",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //calling the rating method to creates a row with stars
                    _buildRatingRow('Rent Price', 0),
                    SizedBox(height: 4.0),
                    _buildRatingRow('Amenities Provided', 1),
                    SizedBox(height: 4.0),
                    _buildRatingRow('Cleanliness, Comfort & Safety', 2),
                    SizedBox(height: 4.0),
                    _buildRatingRow('Noise', 3),
                    SizedBox(height: 4.0),
                    _buildRatingRow('Parking', 4),
                    SizedBox(height: 4.0),
                    _buildRatingRow('Would you recommend property?', 5),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  //allow user to type in by providing a multi-line text
                  'What should we improve?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'State your review here...',
                  ),
                ),
                SizedBox(height: 24.0),
                Center(
                  //submit button
                  child: ElevatedButton(
                    onPressed: () {
                      // Bottom Sheet to appear full width and full control
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20.0)),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                            //display a bottom modal sheet with a thank you message and a confirmation button after clicked on submit button
                            height: MediaQuery.of(context).size.height *
                                0.35, // 35% of screen height
                            width: double.infinity, // Full width
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0)),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.red,
                                  size: 80, // Large check icon
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Thank you for your review!',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 12),
                                  ),
                                  child: Text(
                                    'Review Submitted',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: Text(
                      'Submit Your Review',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ), //end of submit button
              ],
            ), //end column ; end main content
          ),
        ),
      ),
    );
  }

  //building rating row by build each rating row with a label and stars
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

  //building stars for rating
  Widget _buildStar(int rowIndex, int index) {
    //create star icons that can change apperance
    return IconButton(
      icon: Icon(
        starRatings[rowIndex][index] ? Icons.star : Icons.star_border,
        color: starRatings[rowIndex][index] ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        //by allowing user interaction
        setState(() {
          //updates the state when stars got tapped
          for (int i = 0; i < 5; i++) {
            starRatings[rowIndex][i] = i <= index;
          }
        });
      },
    );
  }
}
