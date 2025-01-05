import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:othego_project/check_out_screen_cust.dart';
import 'package:othego_project/screens/complainpage.dart';
import 'package:othego_project/screens/room_list_screen.dart';

void main() {
  //main function
  runApp(const ShowRoomApp());
}

class ShowRoomScreen extends StatefulWidget {
  //display list of available rooms
  const ShowRoomScreen({super.key});

  @override
  State<ShowRoomScreen> createState() => _ShowRoomScreenState();
}

class ShowRoomApp extends StatelessWidget {
  //manages route navigation
  const ShowRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //disable debug banner
      initialRoute: '/', //default screen
      routes: {
        //navigation paths
        '/': (context) => const ShowRoomScreen(),
        '/map': (context) => const MapScreen(),
      },
    );
  }
}

class _ShowRoomScreenState extends State<ShowRoomScreen> {
  int _currentIndex =
      0; //indicates index of current tab to be selected for bottom navigation bar

  final List<Map<String, dynamic>> boxData = const [
    //boxData to store information of title, description, image, tags
    {
      "title": "Metrocity Matang",
      "description":
          "• Empty room with fan\n• Washing machine\n• Access door system",
      "image": "assets/M6.jpg",
      "tags": ["7 bedrooms", "2 bath", "Washing Machine provided"]
    },
    {
      "title": "Richmond",
      "description":
          "• Fully furnished\n• High-speed internet\n• Access door system",
      "image": "assets/R2.jpg",
      "tags": ["4 bedrooms", "3 bath", "Internet provided"]
    },
    {
      "title": "Tun Zaidi",
      "description":
          "• Complete with WiFi\n• Nearby shopping mall\n• Access door system\n•Kitchen Access",
      "image": "assets/Tun_Zaidi_1.jpg",
      "tags": ["7 bedrooms", "2 bath", "Near AEON Mall"]
    },
    {
      "title": "Uni-Central, Kota Samarahan",
      "description":
          "• 3 large rooms\n• Sunset & Sunrise view\n• Access door system",
      "image": "assets/S1.jpg",
      "tags": ["6 bedrooms", "4 bath", "City View"]
    },
    {
      "title": "Chai Yi Building, BDC",
      "description":
          "• Have 2 rooms completed with bedframe and wardrobe\n• Spacious layout\n• Kitchen access with balcony\n• Near to Excellence Delight, Few minutes to Saradise",
      "image": "assets/CY2.jpg",
      "tags": [
        "8 bedrooms",
        "2 bath",
        "Near Excellence Delight",
        "5 minutes to Saradise",
        "5-8 minutes to Kuching International Airport"
      ]
    },
  ];

  void _onTabTapped(int index) {
    //this function is to updates the current tab when it got tapped
    setState(() {
      //and trigger this state for updation
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F3),
      appBar: AppBar(
        //containing the back arrow and the search bar
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          //back button
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const TextField(
          //search bar for user to input
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              //generates list of cards displaying the properties from boxData
              padding: const EdgeInsets.all(16.0),
              itemCount: boxData.length,
              itemBuilder: (context, index) {
                final box = boxData[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              box['image'], //image of property
                              height: 180,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  box['title'], //title of property
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  box['description'], //description of property
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: box['tags'] //tags of property
                                      .map<Widget>(
                                        (tag) => _buildTag(
                                            tag), //build tag by calling the buildTag function widget
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            //provide spacing around its child widget
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0), //16px on left and right; 8px on top and right
            child: ElevatedButton(
              //if user click on View All Location button
              onPressed: () {
                //navigate to the MapScreen
                Navigator.pushNamed(context, '/map');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, //button's background color to red
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(
                    double.infinity, 50), //length width of the button
              ),
              child: const Text(
                'View All Location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red, // Active item color
        unselectedItemColor: Colors.black, // Inactive items color
        backgroundColor: Colors.white,
        iconSize: 30.0,
        currentIndex: _currentIndex, // Update the current index dynamically
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the active index
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RoomListScreen()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TransactionHistoryPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpContactPage()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transaction History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, {Color color = Colors.redAccent}) {
    //takes two parameters which are for text and color
    return Container(
      //control the tag's appearance and display
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController
      _controller; //allows user to control the map from any direction of views
  final double _currentZoom = 13.0; //holds the current zoom level for the map

  //list of locations including title, address, and location of each location
  final List<Map<String, dynamic>> places = [
    {
      'title': 'Metrocity Matang',
      'address':
          '2nd Floor, Lot 14209 [SL.76], Metrocity, Jalan Matang, Kuching, Sarawak',
      'location': const LatLng(1.5662474933108108,
          110.30765998448784), //the latitude and longitude for Metrocity Matang
    },
    {
      'title': 'Richmond',
      'address':
          '3rd Floor Lot 13003 [SL.19] Royal Richmond PH2, Jalan Datuk Bandar Mustapha Kuching, Sarawak',
      'location': const LatLng(
          1.500401, 110.341219), //the latitude and longitude for Richmond
    },
    {
      'title': 'Tun Zaidi',
      'address':
          '3rd Floor, Lot 3121, Jalan Tun Ahmad Zaidi Edruce Kuching, Sarawak',
      'location': const LatLng(1.538081894164923,
          110.33718600721313), //the latitude and longitude for Tun Zaidi
    },
    {
      'title': 'Uni-Central Kota Samarahan',
      'address':
          '2nd Floor, Lot 6863 [SL.11], Central City PH.5, Kuching/Samarahan Expressway, Sarawak',
      'location': const LatLng(1.4721200180152176,
          110.4153967598185), //the latitude and longitude for Uni-Central Kota Samarahan
    },
    {
      'title': 'Chai Yi Building, BDC',
      'address':
          '3rd Floor, Lot 12616 [SL.4], Chai Yi Goldland, Jalan Tun Jugah/Stutong, Kuching, Sarawak',
      'location': const LatLng(1.5099393873808946,
          110.34971728788756), //the latitude and longitude for Chai Yi Building
    },
  ];

  //list that store the filtered list of places based on the search
  List<Map<String, dynamic>> filteredPlaces = [];

  @override
  void initState() {
    //initializes filteredPlaces
    super.initState();
    filteredPlaces = places; //filteredPlaces to places
  }

  void _navigateToLocation(LatLng location) {
    //this function representing the target location and moves the map
    _controller //to be zoomed to the location using _currentZoom
        .animateCamera(CameraUpdate.newLatLngZoom(location, _currentZoom));
  }

  // search function to filter places based on search input
  void _searchLocations(String query) {
    setState(() {
      filteredPlaces = places.where((place) {
        //filtering the places based on the search entered by the user
        return place['title'].toLowerCase().contains(query
            .toLowerCase()); //compares the search entered with the title of each place
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          onChanged: _searchLocations, //trigger search when typing
          decoration: const InputDecoration(
            hintText: 'Search Locations',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            //displays the actual map
            onMapCreated: (controller) {
              //set up the map controller
              _controller = controller;
            },
            initialCameraPosition: CameraPosition(
              target: filteredPlaces
                      .isEmpty //target is the first parameter - shows based on the latitude and longitude
                  ? places[0]['location']
                  : filteredPlaces[0][
                      'location'], //if it is empty, the map will set to the original place
              zoom:
                  _currentZoom, //zoom is second parameter - for user to zoom in and zoom out of the location on the map
            ),
            markers: filteredPlaces.map((place) {
              //each marker created for each location
              return Marker(
                markerId: MarkerId(
                    place['title']), //markerId based on the title pf the place
                position: place['location'], //latitude and longitude
                infoWindow: InfoWindow(
                  //display the information of title, address and if user click on the card
                  title: place['title'],
                  snippet: place['address'],
                  onTap: () => _navigateToLocation(place[
                      'location']), //it navigate user to the location pinned in the map
                ),
              );
            }).toSet(),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: SingleChildScrollView(
              scrollDirection: Axis
                  .horizontal, //the location card is set to scroll horizontally
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: filteredPlaces.map((place) {
                  return GestureDetector(
                    onTap: () => _navigateToLocation(place['location']),
                    child: Card(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              place['address'],
                              style: const TextStyle(fontSize: 12),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on GoogleMapController {
  //extensions for GoogleMapController class without modifying the existing class and does not perform any function
  get cameraPosition => null; //return the current position of the map to null

  getCameraPosition() {} //empty method but it return the current position of latitude and longitude including zoom function
}

class LocationCard extends StatefulWidget {
  //accepts two parameters which are title and address
  final String title;
  final String address;

  const LocationCard({
    required this.title,
    required this.address,
    super.key,
  });

  @override
  _LocationCardState createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  bool _isExpanded = false;

  void _toggleCard() {
    //help to keeps track of the expandation card
    setState(() {
      _isExpanded =
          !_isExpanded; //if it is not false, meaning the card is not yet display
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //detects gesture from user
      onTap: _toggleCard, //changing expand state
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              if (_isExpanded)
                Text(
                  widget.address,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
