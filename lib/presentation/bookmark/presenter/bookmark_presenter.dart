import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/presentation/bookmark/ui/edit_bookmark_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkUiState extends BaseUiState {
  final List<String> bookmarkedDuas;

  const BookmarkUiState({
    required this.bookmarkedDuas,
    required super.isLoading,
    required super.userMessage,
  });

  factory BookmarkUiState.initial() => const BookmarkUiState(
        bookmarkedDuas: [],
        isLoading: false,
        userMessage: null,
      );

  BookmarkUiState copyWith({
    List<String>? bookmarkedDuas,
    bool? isLoading,
    String? userMessage,
  }) {
    return BookmarkUiState(
      bookmarkedDuas: bookmarkedDuas ?? this.bookmarkedDuas,
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage,
    );
  }

  @override
  List<Object?> get props => [bookmarkedDuas, isLoading, userMessage];
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

  Future<void> showEditBookmarkBottomSheet(BuildContext context,
      {String? folderName, Color? folderColor}) async {
    await EditBookmarkBottomSheet.show(
      context: context,
      folderName: folderName ?? 'Example Folder Name',
      folderColor: folderColor ?? Colors.blue,
      onSave: (String name, Color color) {
        // TODO: Implement save bookmark folder logic
        update();
      },
    );
  }
}
