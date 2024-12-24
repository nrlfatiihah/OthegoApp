import 'package:flutter/material.dart';
import '../models/room.dart';
import 'package:othego_project/services/database_service.dart';

class RoomDetailsScreen extends StatelessWidget {
  final int roomId;

  const RoomDetailsScreen({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Room>(
        future: DatabaseService.getRoomDetails(roomId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final room = snapshot.data!;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Image.network(
                        room.images
                        ,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text('${room.rating} (${room.reviewCount})'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.grey),
                          const SizedBox(width: 4),
                          Expanded(child: Text(room.location)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(room.description),
                      const SizedBox(height: 24),
                      Text(
                        'Amenities',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: room.amenities.split(',')
                            .map((amenities) => Chip(
                                  label: Text(amenities.trim()),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
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
}