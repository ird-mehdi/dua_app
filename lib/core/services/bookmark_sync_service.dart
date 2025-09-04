import 'dart:convert';
import 'dart:io';

import 'package:dua/domain/entities/dua_bookmark_entity.dart';
import 'package:dua/domain/entities/dua_bookmark_folder_entity.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BookmarkSyncService {
  final DuaBookmarkRepository _bookmarkRepository;

  BookmarkSyncService(this._bookmarkRepository);

  // Export bookmarks to a JSON file
  Future<String> exportBookmarksToJson() async {
    try {
      // Request storage permission
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
        if (!status.isGranted) {
          // Try alternative permissions for Android 11+
          if (await Permission.manageExternalStorage.request().isGranted ||
              await Permission.mediaLibrary.request().isGranted) {
            // Permissions granted, continue
          } else {
            throw Exception(
                'Storage permission is required to export bookmarks');
          }
        }
      }

      // Get all bookmarks and folders
      final List<DuaBookmarkEntity> bookmarks =
          await _bookmarkRepository.getAllBookmarks();
      final List<DuaBookmarkFolderEntity> folders =
          await _bookmarkRepository.getAllBookmarkFolders();

      // Create JSON structure
      final Map<String, dynamic> exportData = {
        'bookmarks': bookmarks.map((bookmark) => bookmark.toMap()).toList(),
        'folders': folders.map((folder) => folder.toMap()).toList(),
        'exportDate': DateTime.now().toIso8601String(),
        'version': 1, // For future compatibility
      };

      // Convert to JSON string
      final String jsonData = jsonEncode(exportData);

      // Generate a unique filename
      final String fileName =
          'dua_bookmarks_${DateTime.now().millisecondsSinceEpoch}.json';
      String filePath;

      // Determine the best storage option based on Android version
      if (Platform.isAndroid) {
        // Try several locations
        final List<Directory> potentialDirs = [
          // Try standard Downloads directory
          Directory('/storage/emulated/0/Download'),
          // Try newer Android shared storage location
          Directory('/storage/emulated/0/Downloads'),
          // Try alternate paths that might work on some devices
          Directory('/sdcard/Download'),
          Directory('/sdcard/Downloads'),
        ];

        bool saved = false;

        for (final dir in potentialDirs) {
          try {
            if (await dir.exists()) {
              filePath = '${dir.path}/$fileName';
              final File file = File(filePath);
              await file.writeAsString(jsonData);
              debugPrint('Bookmarks saved to: $filePath');
              saved = true;
              return filePath;
            }
          } catch (e) {
            debugPrint('Failed to save to ${dir.path}: $e');
            continue; // Try next directory
          }
        }

        if (!saved) {
          // Fallback to app's documents directory
          final Directory appDir = await getApplicationDocumentsDirectory();
          filePath = '${appDir.path}/$fileName';
          final File file = File(filePath);
          await file.writeAsString(jsonData);
          debugPrint('Bookmarks saved to app directory: $filePath');
          return filePath;
        }

        return ''; // Should never reach here, but needed for compilation
      } else {
        // For non-Android platforms, use the app's documents directory
        final Directory directory = await getApplicationDocumentsDirectory();
        filePath = '${directory.path}/$fileName';
        final File file = File(filePath);
        await file.writeAsString(jsonData);
        debugPrint('Bookmarks saved to app directory: $filePath');
        return filePath;
      }
    } catch (e) {
      debugPrint('Error exporting bookmarks: $e');
      throw Exception('Failed to export bookmarks: $e');
    }
  }

  // Share bookmarks JSON file
  Future<void> shareBookmarksFile() async {
    try {
      final String filePath = await exportBookmarksToJson();
      final File file = File(filePath);

      // Share the file
      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'Dua App Bookmarks',
        text: 'Here are my Dua App bookmarks',
      );
    } catch (e) {
      debugPrint('Error sharing bookmarks: $e');
      throw Exception('Failed to share bookmarks: $e');
    }
  }

  // Import bookmarks from a JSON file
  Future<bool> importBookmarksFromJson(String filePath) async {
    try {
      final File file = File(filePath);

      // Check if file exists
      if (!await file.exists()) {
        debugPrint('File does not exist: $filePath');
        return false;
      }

      // Check file size to avoid parsing very large files
      final fileSize = await file.length();
      if (fileSize > 10 * 1024 * 1024) {
        // 10MB limit
        debugPrint('File too large: $fileSize bytes');
        return false;
      }

      // Read file content
      String jsonContent;
      try {
        jsonContent = await file.readAsString();
      } catch (e) {
        debugPrint('Error reading file content: $e');
        return false;
      }

      // Validate JSON format
      Map<String, dynamic> importData;
      try {
        importData = jsonDecode(jsonContent);
      } catch (e) {
        debugPrint('Invalid JSON format: $e');
        return false;
      }

      // Validate structure
      if (!importData.containsKey('bookmarks') ||
          !importData.containsKey('folders')) {
        debugPrint('Invalid bookmark file structure');
        return false;
      }

      // Convert to entities
      final List<dynamic> bookmarksJson = importData['bookmarks'];
      final List<dynamic> foldersJson = importData['folders'];

      if (bookmarksJson.isEmpty && foldersJson.isEmpty) {
        debugPrint('No bookmarks or folders found in the file');
        return false;
      }

      try {
        final List<DuaBookmarkEntity> bookmarks = bookmarksJson
            .map((json) => DuaBookmarkEntity.fromMap(json))
            .toList();

        final List<DuaBookmarkFolderEntity> folders = foldersJson
            .map((json) => DuaBookmarkFolderEntity.fromMap(json))
            .toList();

        // Import each folder
        for (final folder in folders) {
          await _bookmarkRepository.createBookmarkFolder(
            name: folder.name,
            colorValue: folder.color.value,
          );
        }

        // Import each bookmark
        for (final bookmark in bookmarks) {
          await _bookmarkRepository.saveBookmarksToDua(
            duaID: bookmark.duaID,
            bookmarks: [bookmark],
          );
        }

        debugPrint(
            'Successfully imported ${bookmarks.length} bookmarks and ${folders.length} folders');
        return true;
      } catch (e) {
        debugPrint('Error converting JSON data to entities: $e');
        return false;
      }
    } catch (e) {
      debugPrint('Error importing bookmarks: $e');
      return false;
    }
  }
}
