import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/domain/entities/dua_entity.dart';
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
  final List<DuaEntity> bookmarkedDuas;
  final List<BookmarkFolder> bookmarkFolders;
  final Set<String> selectedBookmarkFolderNames;
  final String currentFolderName;

  const BookmarkUiState({
    required this.bookmarkedDuas,
    required this.bookmarkFolders,
    required this.selectedBookmarkFolderNames,
    required this.currentFolderName,
    required super.isLoading,
    required super.userMessage,
  });

  factory BookmarkUiState.initial() => BookmarkUiState(
        bookmarkedDuas: [],
        bookmarkFolders: [],
        selectedBookmarkFolderNames: {},
        currentFolderName: '',
        isLoading: false,
        userMessage: null,
      );

  BookmarkUiState copyWith({
    List<DuaEntity>? bookmarkedDuas,
    List<BookmarkFolder>? bookmarkFolders,
    Set<String>? selectedBookmarkFolderNames,
    String? currentFolderName,
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
        isLoading,
        userMessage
      ];
}
