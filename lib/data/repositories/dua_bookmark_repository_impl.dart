import 'package:dua/domain/entities/dua_bookmark_entity.dart';
import 'package:dua/domain/entities/dua_bookmark_folder_entity.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DuaBookmarkRepositoryImpl implements DuaBookmarkRepository {
  static const String _bookmarksKey = 'dua_bookmarks';
  static const String _foldersKey = 'dua_bookmark_folders';

  // Cache of bookmarks and folders
  List<DuaBookmarkEntity>? _cachedBookmarks;
  List<DuaBookmarkFolderEntity>? _cachedFolders;

  // Default folder constants
  static const String _defaultFolderName = "Favorites";
  static const int _defaultFolderColor = 0xFFF44336; // Red color

  DuaBookmarkRepositoryImpl();

  @override
  Future<void> createBookmarkFolder({
    required String name,
    required int colorValue,
  }) async {
    final folders = await getAllBookmarkFolders();

    // Check if folder already exists
    if (folders.any((folder) => folder.name == name)) {
      return;
    }

    // Create new folder
    final newFolder = DuaBookmarkFolderEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      color: Color(colorValue),
      count: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Add to folders list
    folders.add(newFolder);
    _cachedFolders = folders;

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final folderMaps = folders.map((folder) => folder.toMap()).toList();
    await prefs.setString(_foldersKey, jsonEncode(folderMaps));
  }

  @override
  Future<void> deleteBookmarkFolder({
    required DuaBookmarkFolderEntity folder,
  }) async {
    // Get all folders
    final folders = await getAllBookmarkFolders();
    final bookmarks = await getAllBookmarks();

    // Can't delete default Favorites folder
    if (folder.name == _defaultFolderName) {
      return;
    }

    // Remove folder
    _cachedFolders = folders.where((f) => f.name != folder.name).toList();

    // Remove all bookmarks in that folder
    _cachedBookmarks =
        bookmarks.where((b) => b.folderName != folder.name).toList();

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    final folderMaps = _cachedFolders!.map((folder) => folder.toMap()).toList();
    await prefs.setString(_foldersKey, jsonEncode(folderMaps));

    final bookmarkMaps =
        _cachedBookmarks!.map((bookmark) => bookmark.toMap()).toList();
    await prefs.setString(_bookmarksKey, jsonEncode(bookmarkMaps));
  }

  @override
  Future<List<DuaBookmarkEntity>> getAllBookmarks() async {
    if (_cachedBookmarks != null) {
      return _cachedBookmarks!;
    }

    final prefs = await SharedPreferences.getInstance();
    final bookmarksJson = prefs.getString(_bookmarksKey);

    if (bookmarksJson == null || bookmarksJson.isEmpty) {
      _cachedBookmarks = [];
      return [];
    }

    try {
      final List<dynamic> decodedList = jsonDecode(bookmarksJson);
      _cachedBookmarks =
          decodedList.map((json) => DuaBookmarkEntity.fromMap(json)).toList();
      return _cachedBookmarks!;
    } catch (e) {
      print('Error loading bookmarks: $e');
      _cachedBookmarks = [];
      return [];
    }
  }

  @override
  Future<List<DuaBookmarkFolderEntity>> getAllBookmarkFolders() async {
    if (_cachedFolders != null) {
      return _cachedFolders!;
    }

    final prefs = await SharedPreferences.getInstance();
    final foldersJson = prefs.getString(_foldersKey);

    if (foldersJson == null || foldersJson.isEmpty) {
      // Create just the default Favorites folder
      _cachedFolders = [
        _createDefaultFavoriteFolder(),
      ];

      // Save default folders
      final folderMaps =
          _cachedFolders!.map((folder) => folder.toMap()).toList();
      await prefs.setString(_foldersKey, jsonEncode(folderMaps));

      return _cachedFolders!;
    }

    try {
      final List<dynamic> decodedList = jsonDecode(foldersJson);
      _cachedFolders = decodedList
          .map((json) => DuaBookmarkFolderEntity.fromMap(json))
          .toList();

      // Ensure default Favorites folder exists
      if (!_cachedFolders!.any((f) => f.name == _defaultFolderName)) {
        _cachedFolders!.add(_createDefaultFavoriteFolder());

        // Save updated folders with the Favorites folder
        final folderMaps =
            _cachedFolders!.map((folder) => folder.toMap()).toList();
        await prefs.setString(_foldersKey, jsonEncode(folderMaps));
      }

      // Update folder counts
      await _updateFolderCounts();

      return _cachedFolders!;
    } catch (e) {
      print('Error loading folders: $e');

      // Create default Favorites folder on error
      _cachedFolders = [_createDefaultFavoriteFolder()];
      return _cachedFolders!;
    }
  }

  // Helper method to create the default Favorites folder
  DuaBookmarkFolderEntity _createDefaultFavoriteFolder() {
    return DuaBookmarkFolderEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      name: _defaultFolderName,
      color: const Color(_defaultFolderColor),
      count: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<List<DuaBookmarkEntity>> getBookmarksByDuaID(int duaID) async {
    final allBookmarks = await getAllBookmarks();
    return allBookmarks.where((bookmark) => bookmark.duaID == duaID).toList();
  }

  // Get bookmarks by folder name
  Future<List<DuaBookmarkEntity>> getBookmarksByFolderName(
      String folderName) async {
    final allBookmarks = await getAllBookmarks();
    return allBookmarks
        .where((bookmark) => bookmark.folderName == folderName)
        .toList();
  }

  @override
  Future<void> saveBookmarksToDua({
    required int duaID,
    required List<DuaBookmarkEntity> bookmarks,
  }) async {
    // Get all existing bookmarks
    final allBookmarks = await getAllBookmarks();

    // Remove any existing bookmarks for this dua
    final filteredBookmarks =
        allBookmarks.where((b) => b.duaID != duaID).toList();

    // Add new bookmarks
    filteredBookmarks.addAll(bookmarks);
    _cachedBookmarks = filteredBookmarks;

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final bookmarkMaps =
        filteredBookmarks.map((bookmark) => bookmark.toMap()).toList();
    await prefs.setString(_bookmarksKey, jsonEncode(bookmarkMaps));

    // Update folder counts
    await _updateFolderCounts();
  }

  Future<void> _updateFolderCounts() async {
    if (_cachedFolders == null) return;

    final allBookmarks = await getAllBookmarks();
    final Map<String, int> folderCounts = {};

    // Count bookmarks for each folder
    for (final bookmark in allBookmarks) {
      folderCounts[bookmark.folderName] =
          (folderCounts[bookmark.folderName] ?? 0) + 1;
    }

    // Update the folder counts in cached folders
    _cachedFolders = _cachedFolders!.map((folder) {
      return folder.copyWith(
        count: folderCounts[folder.name] ?? 0,
      );
    }).toList();

    // Save updated folders to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final folderMaps = _cachedFolders!.map((folder) => folder.toMap()).toList();
    await prefs.setString(_foldersKey, jsonEncode(folderMaps));
  }

  @override
  Future<List<DuaBookmarkFolderEntity>> searchBookmarks({
    required String query,
    required List<DuaBookmarkFolderEntity> allFolders,
  }) async {
    // Filter folders by name
    final lowercaseQuery = query.toLowerCase();
    final filteredFolders = allFolders
        .where((folder) => folder.name.toLowerCase().contains(lowercaseQuery))
        .toList();

    return filteredFolders;
  }

  @override
  Future<void> syncBookmarksWithRemote() async {
    // In a real app, this would sync with a remote server
    // For now, no implementation needed for local storage only
  }

  @override
  Future<void> updateBookmarkFolder({
    required String folderName,
    required String newFolderName,
    required int colorValue,
  }) async {
    final folders = await getAllBookmarkFolders();
    final bookmarks = await getAllBookmarks();

    // Prevent renaming the default Favorites folder
    if (folderName == _defaultFolderName) {
      // Allow changing color but not the name
      final updatedFolders = folders.map((folder) {
        if (folder.name == _defaultFolderName) {
          return folder.copyWith(
            color: Color(colorValue),
            updatedAt: DateTime.now(),
          );
        }
        return folder;
      }).toList();

      _cachedFolders = updatedFolders;

      // Save updated folders
      final prefs = await SharedPreferences.getInstance();
      final folderMaps =
          _cachedFolders!.map((folder) => folder.toMap()).toList();
      await prefs.setString(_foldersKey, jsonEncode(folderMaps));
      return;
    }

    // Update folder
    _cachedFolders = folders.map((folder) {
      if (folder.name == folderName) {
        return folder.copyWith(
          name: newFolderName,
          color: Color(colorValue),
          updatedAt: DateTime.now(),
        );
      }
      return folder;
    }).toList();

    // Update bookmark folder names
    if (folderName != newFolderName) {
      _cachedBookmarks = bookmarks.map((bookmark) {
        if (bookmark.folderName == folderName) {
          return bookmark.copyWith(
            folderName: newFolderName,
            color: Color(colorValue),
            updatedAt: DateTime.now(),
          );
        }
        return bookmark;
      }).toList();

      // Save updated bookmarks
      final prefs = await SharedPreferences.getInstance();
      final bookmarkMaps =
          _cachedBookmarks!.map((bookmark) => bookmark.toMap()).toList();
      await prefs.setString(_bookmarksKey, jsonEncode(bookmarkMaps));
    }

    // Save updated folders
    final prefs = await SharedPreferences.getInstance();
    final folderMaps = _cachedFolders!.map((folder) => folder.toMap()).toList();
    await prefs.setString(_foldersKey, jsonEncode(folderMaps));
  }
}
