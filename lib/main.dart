import 'package:dua/core/di/service_locator.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:dua/presentation/dua_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator
  await ServiceLocator.setUp();

  // Initialize default Favorites folder
  _initializeDefaultFavorites();

  runApp(const DuaApp());
}

// Initialize the default Favorites folder
Future<void> _initializeDefaultFavorites() async {
  // Execute this in a microtask to avoid blocking the UI
  Future.microtask(() async {
    try {
      // Access the bookmark repository
      final bookmarkRepo = locate<DuaBookmarkRepository>();

      // Just getting all folders will ensure the default Favorites folder exists
      await bookmarkRepo.getAllBookmarkFolders();

      print('Default Favorites folder initialized');
    } catch (e) {
      print('Error initializing Favorites folder: $e');
    }
  });
}
