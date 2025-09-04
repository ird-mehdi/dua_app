import 'package:dua/domain/entities/dua_bookmark_entity.dart';
import 'package:dua/domain/entities/dua_bookmark_folder_entity.dart';

abstract class DuaBookmarkRepository {
  // Get all bookmark folders
  Future<List<DuaBookmarkFolderEntity>> getAllBookmarkFolders();

  // Get all bookmarks
  Future<List<DuaBookmarkEntity>> getAllBookmarks();

  // Get bookmarks by dua ID
  Future<List<DuaBookmarkEntity>> getBookmarksByDuaID(int duaID);

  // Save bookmarks to a dua
  Future<void> saveBookmarksToDua({
    required int duaID,
    required List<DuaBookmarkEntity> bookmarks,
  });

  // Create a bookmark folder
  Future<void> createBookmarkFolder({
    required String name,
    required int colorValue,
  });

  // Update a bookmark folder
  Future<void> updateBookmarkFolder({
    required String folderName,
    required String newFolderName,
    required int colorValue,
  });

  // Delete a bookmark folder
  Future<void> deleteBookmarkFolder({
    required DuaBookmarkFolderEntity folder,
  });

  // Search bookmarks by query
  Future<List<DuaBookmarkFolderEntity>> searchBookmarks({
    required String query,
    required List<DuaBookmarkFolderEntity> allFolders,
  });

  // Sync bookmarks with remote (if needed)
  Future<void> syncBookmarksWithRemote();
}
