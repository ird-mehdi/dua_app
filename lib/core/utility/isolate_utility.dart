// ignore_for_file: avoid_print

import 'package:dua/data/services/dua_database/database_service.dart';

/// Utility class for managing isolates in the application
class IsolateUtility {
  /// Closes all active isolates in the application
  /// Call this when a thread's work is complete to prevent memory leaks
  static Future<void> closeAllIsolatesWhenThreadCompletes() async {
    try {
      // Close all database isolates
      await DuaDatabase.closeAllIsolates();

      // Add other isolate cleanup here if needed in the future

      print('All isolates closed successfully when thread completed');
    } catch (e) {
      print('Error while closing isolates: $e');
    }
  }
}
