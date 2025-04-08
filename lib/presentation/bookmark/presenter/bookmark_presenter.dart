import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/presentation/bookmark/ui/edit_bookmark_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class BookmarkPresenter extends BasePresenter<BookmarkUiState> {
  final _state = BookmarkUiState.initial().obs;

  BookmarkUiState get currentUiState => _state.value;

  @override
  void onInit() {
    super.onInit();
    loadBookmarkedDuas();
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    _state.value = currentUiState.copyWith(isLoading: loading);
  }

  @override
  Future<void> addUserMessage(String message) async {
    _state.value = currentUiState.copyWith(userMessage: message);
  }

  Future<void> loadBookmarkedDuas() async {
    await toggleLoading(loading: true);
    // TODO: Implement loading bookmarked duas
    _state.value = currentUiState.copyWith(
      bookmarkedDuas: ['Dua 1', 'Dua 2', 'Dua 3'], // Dummy data
    );
    await toggleLoading(loading: false);
    update();
  }

  Future<void> updateBookmarkFolder(int index, String name, Color color) async {
    final List<BookmarkFolder> updatedFolders =
        List.from(currentUiState.bookmarkFolders);
    updatedFolders[index] = updatedFolders[index].copyWith(
      name: name,
      color: color,
    );

    _state.value = currentUiState.copyWith(
      bookmarkFolders: updatedFolders,
    );
    update();
  }

  Future<void> showEditBookmarkBottomSheet(
    BuildContext context, {
    required String folderName,
    required Color folderColor,
    required int folderIndex,
  }) async {
    await EditBookmarkBottomSheet.show(
      context: context,
      folderName: folderName,
      folderColor: folderColor,
      onSave: (String name, Color color) {
        updateBookmarkFolder(folderIndex, name, color);
      },
    );
  }
}
