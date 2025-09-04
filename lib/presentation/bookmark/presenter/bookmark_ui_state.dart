import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:flutter/material.dart';

// Define sort options
enum BookmarkSortOption {
  recent, // Recently added
  alphabetical, // A-Z
}

class BookmarkFolder {
  final String name;
  final Color color;
  final int duaCount;
  final DateTime? createdAt; // Add createdAt for sorting by recent

  BookmarkFolder({
    required this.name,
    required this.color,
    required this.duaCount,
    this.createdAt,
  });

  BookmarkFolder copyWith({
    String? name,
    Color? color,
    int? duaCount,
    DateTime? createdAt,
  }) {
    return BookmarkFolder(
      name: name ?? this.name,
      color: color ?? this.color,
      duaCount: duaCount ?? this.duaCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class BookmarkUiState extends BaseUiState {
  final List<DuaEntity> bookmarkedDuas;
  final List<BookmarkFolder> bookmarkFolders;
  final Set<String> selectedBookmarkFolderNames;
  final String currentFolderName;
  final String searchQuery;
  final BookmarkSortOption sortOption;

  const BookmarkUiState({
    required this.bookmarkedDuas,
    required this.bookmarkFolders,
    required this.selectedBookmarkFolderNames,
    required this.currentFolderName,
    required this.searchQuery,
    required this.sortOption,
    required super.isLoading,
    required super.userMessage,
  });

  factory BookmarkUiState.initial() => BookmarkUiState(
        bookmarkedDuas: [],
        bookmarkFolders: [],
        selectedBookmarkFolderNames: {},
        currentFolderName: '',
        searchQuery: '',
        sortOption: BookmarkSortOption.recent,
        isLoading: false,
        userMessage: null,
      );

  BookmarkUiState copyWith({
    List<DuaEntity>? bookmarkedDuas,
    List<BookmarkFolder>? bookmarkFolders,
    Set<String>? selectedBookmarkFolderNames,
    String? currentFolderName,
    String? searchQuery,
    BookmarkSortOption? sortOption,
    bool? isLoading,
    String? userMessage,
    bool? isBookmarkChanged,
  }) {
    return BookmarkUiState(
      bookmarkedDuas: bookmarkedDuas ?? this.bookmarkedDuas,
      bookmarkFolders: bookmarkFolders ?? this.bookmarkFolders,
      selectedBookmarkFolderNames:
          selectedBookmarkFolderNames ?? this.selectedBookmarkFolderNames,
      currentFolderName: currentFolderName ?? this.currentFolderName,
      searchQuery: searchQuery ?? this.searchQuery,
      sortOption: sortOption ?? this.sortOption,
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage,
    );
  }

  @override
  List<Object?> get props => [
        bookmarkedDuas,
        bookmarkFolders,
        selectedBookmarkFolderNames,
        currentFolderName,
        searchQuery,
        sortOption,
        isLoading,
        userMessage
      ];
}
