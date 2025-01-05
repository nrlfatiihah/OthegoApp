import 'package:flutter/material.dart';
import 'package:othego_project/widgets/image_carousel.dart';
import 'package:othego_project/widgets/room_info.dart';
import 'package:othego_project/widgets/location_info.dart';
import 'package:othego_project/widgets/booking_bar.dart';

class RoomDetailsScreen extends StatelessWidget {
  final int roomId;
  const RoomDetailsScreen({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const ImageCarousel(),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const RoomInfo(),
                const LocationInfo(),
                const SizedBox(height: 80), // Space for booking bar
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BookingBar(),
          ),
        ],
      ),
    );
  }
}