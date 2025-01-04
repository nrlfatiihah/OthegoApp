import 'package:flutter/material.dart';
import 'check_out_screen_cust.dart'; // Assuming the file for CheckoutScreen exists

void main() {
  runApp(const CalendarApp());
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  int _currentIndex = 2; // Set to 2 (Home) to match default index

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade50,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        color: Colors.pink.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Select Check-In Dates",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "The following are the available dates",
              style: TextStyle(color: Colors.black54, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            _buildCalendar(),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (startDate != null) {
                  // Only navigate if startDate is selected
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CheckoutScreen(startDate: startDate),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Align to the right
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent, // Background color
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        iconSize: 30.0,
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

  String formatMonthYear(DateTime date) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    String monthName = months[date.month - 1];
    return "$monthName ${date.year}";
  }

  Widget _buildCalendar() {
    const weekdays = ["S", "M", "T", "W", "T", "F", "S"];
    int daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
    int startDayOffset =
        DateTime(currentMonth.year, currentMonth.month, 1).weekday % 7;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.chevron_left, color: Colors.redAccent),
                    onPressed: () {
                      setState(() {
                        currentMonth = DateTime(
                          currentMonth.year,
                          currentMonth.month - 1,
                          1,
                        );
                      });
                    },
                  ),
                  Text(
                    formatMonthYear(currentMonth),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right,
                        color: Colors.redAccent),
                    onPressed: () {
                      setState(() {
                        currentMonth = DateTime(
                          currentMonth.year,
                          currentMonth.month + 1,
                          1,
                        );
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: weekdays.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      weekdays[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: daysInMonth + startDayOffset,
                itemBuilder: (context, index) {
                  if (index < startDayOffset) {
                    return const SizedBox.shrink();
                  }

                  final day = index - startDayOffset + 1;
                  final date =
                      DateTime(currentMonth.year, currentMonth.month, day);

                  bool isInRange = (startDate != null &&
                      endDate != null &&
                      date.isAfter(startDate!) &&
                      date.isBefore(endDate!));

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (startDate == null ||
                            (startDate != null && endDate != null)) {
                          startDate = date;
                          endDate = null;
                        } else {
                          endDate = date.isAfter(startDate!) ? date : startDate;
                          startDate = startDate?.isBefore(date) ?? false
                              ? startDate
                              : date;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: startDate == date
                            ? Colors.red
                            : endDate == date
                                ? Colors.red
                                : isInRange
                                    ? Colors.greenAccent
                                    : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        day.toString(),
                        style: TextStyle(
                          color: (startDate == date || endDate == date)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
