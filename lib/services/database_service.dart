import 'package:mysql1/mysql1.dart';
import 'package:othego_project/models/room.dart';

class DatabaseService {
  static Future<MySqlConnection> _getConnection() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: '', 
      password: '', 
      db: 'othego_database',
    );
    return await MySqlConnection.connect(settings);
  }

  // Fetch a list of all rooms from the database
  static Future<List<Room>> getRooms() async {
    final conn = await _getConnection();
    try {
      var results = await conn.query('SELECT * FROM rooms');
      
      // Convert the result into a list of Room objects
      List<Room> rooms = [];
      for (var row in results) {
        rooms.add(Room.fromMap(row.fields));
      }

      return rooms;
    } finally {
      await conn.close();
    }
  }

  // Fetch details of a single room by ID
  static Future<Room> getRoomDetails(int roomId) async {
    final conn = await _getConnection();
    try {
      var results = await conn.query(
        'SELECT * FROM rooms WHERE id = ?',
        [roomId],
      );

      if (results.isNotEmpty) {
        return Room.fromMap(results.first.fields);
      }
      throw Exception('Room not found');
    } finally {
      await conn.close();
    }
  }
}
