import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class BookmarkFolder {
  final String name;
  final Color color;
  final int duaCount;

  BookmarkFolder({
    required this.name,
    required this.color,
    required this.duaCount,
  });

  BookmarkFolder copyWith({
    String? name,
    Color? color,
    int? duaCount,
  }) {
    return BookmarkFolder(
      name: name ?? this.name,
      color: color ?? this.color,
      duaCount: duaCount ?? this.duaCount,
    );
  }
}

class BookmarkUiState extends BaseUiState {
  final List<String> bookmarkedDuas;
  final List<BookmarkFolder> bookmarkFolders;

  const BookmarkUiState({
    required this.bookmarkedDuas,
    required this.bookmarkFolders,
    required super.isLoading,
    required super.userMessage,
  });

  factory BookmarkUiState.initial() => BookmarkUiState(
        bookmarkedDuas: [],
        bookmarkFolders: [
          BookmarkFolder(
            name: 'Bookmark Name',
            color: Colors.blue,
            duaCount: 12,
          ),
          BookmarkFolder(
            name: 'Another Bookmark',
            color: Colors.green,
            duaCount: 5,
          ),
        ],
        isLoading: false,
        userMessage: null,
      );

  BookmarkUiState copyWith({
    List<String>? bookmarkedDuas,
    List<BookmarkFolder>? bookmarkFolders,
    bool? isLoading,
    String? userMessage,
  }) {
    return BookmarkUiState(
      bookmarkedDuas: bookmarkedDuas ?? this.bookmarkedDuas,
      bookmarkFolders: bookmarkFolders ?? this.bookmarkFolders,
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage,
    );
  }

  @override
  List<Object?> get props =>
      [bookmarkedDuas, bookmarkFolders, isLoading, userMessage];
}
