import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/domain/entities/dua_bookmark_folder_entity.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:dua/domain/use_cases/bookmark/create_bookmark_folder_use_case.dart';
import 'package:dua/domain/use_cases/bookmark/get_all_bookmark_folders_use_case.dart';
import 'package:dua/domain/use_cases/bookmark/save_bookmarks_to_dua_use_case.dart';
import 'package:dua/presentation/bookmark/ui/edit_bookmark_bottom_sheet.dart';
import 'package:dua/presentation/dua_details/ui/dua_details_page.dart';
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

class BookmarkPresenter extends BasePresenter<BookmarkUiState> {
  final _state = BookmarkUiState.initial().obs;
  final List<BookmarkFolder> _allBookmarkFolders = [];
  bool _wasBookmarkJustAdded = false;

  // Use cases
  late final SaveBookmarksToDuaUseCase _saveBookmarksToDuaUseCase;
  late final CreateBookmarkFolderUseCase _createBookmarkFolderUseCase;
  late final GetAllBookmarkFoldersUseCase _getAllBookmarkFoldersUseCase;

  // Repositories
  late final DuaBookmarkRepository _duaBookmarkRepository;
  late final DuaRepository _duaRepository;

  BookmarkUiState get currentUiState => _state.value;

  @override
  void onInit() {
    super.onInit();
    _initUseCases();
    loadBookmarkFolders();
  }

  void _initUseCases() {
    // Initialize use cases and repositories
    try {
      _saveBookmarksToDuaUseCase = locate<SaveBookmarksToDuaUseCase>();
      _createBookmarkFolderUseCase = locate<CreateBookmarkFolderUseCase>();
      _getAllBookmarkFoldersUseCase = locate<GetAllBookmarkFoldersUseCase>();
      _duaBookmarkRepository = locate<DuaBookmarkRepository>();
      _duaRepository = locate<DuaRepository>();
    } catch (e) {
      print('Error initializing use cases or repositories: $e');
    }
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    _state.value = currentUiState.copyWith(isLoading: loading);
  }

  @override
  Future<void> addUserMessage(String message) async {
    _state.value = currentUiState.copyWith(userMessage: message);
  }

  Future<void> loadBookmarkFolders() async {
    await toggleLoading(loading: true);

    await parseDataFromEitherWithUserMessage(
      task: () => _getAllBookmarkFoldersUseCase.execute(),
      onDataLoaded: (folders) {
        final List<BookmarkFolder> bookmarkFolders = folders
            .map((folder) => BookmarkFolder(
                  name: folder.name,
                  color: folder.color,
                  duaCount: folder.count,
                ))
            .toList();

        _allBookmarkFolders.clear();
        _allBookmarkFolders.addAll(bookmarkFolders);

        _state.value = currentUiState.copyWith(
          bookmarkFolders: bookmarkFolders,
        );
      },
    );

    await toggleLoading(loading: false);
    update();
  }

  Future<List<BookmarkFolder>> getBookmarkFoldersForDua(int duaID) async {
    final bookmarks = await _duaBookmarkRepository.getBookmarksByDuaID(duaID);
    if (bookmarks.isEmpty) {
      return [];
    }

    // Get folder names from bookmarks
    final folderNames =
        bookmarks.map((bookmark) => bookmark.folderName).toSet();

    // Find matching folders in all bookmark folders
    final matchingFolders = _allBookmarkFolders
        .where((folder) => folderNames.contains(folder.name))
        .toList();

    return matchingFolders;
  }

  Future<void> updateBookmarkFolder(int index, String name, Color color) async {
    final List<BookmarkFolder> updatedFolders =
        List.from(currentUiState.bookmarkFolders);

    final oldName = updatedFolders[index].name;
    updatedFolders[index] = updatedFolders[index].copyWith(
      name: name,
      color: color,
    );

    await _duaBookmarkRepository.updateBookmarkFolder(
      folderName: oldName,
      newFolderName: name,
      colorValue: color.value,
    );

    _state.value = currentUiState.copyWith(
      bookmarkFolders: updatedFolders,
    );
    update();
  }

  Future<bool> createBookmarkFolder({
    required String name,
    required Color color,
    required int duaID,
  }) async {
    bool isSuccess = false;

    await executeMessageOnlyUseCase(
      () async => _createBookmarkFolderUseCase.execute(
        name: name,
        color: color,
        duaID: duaID,
      ),
      onSuccess: () async {
        isSuccess = true;
        _wasBookmarkJustAdded = true;
        await loadBookmarkFolders();

        // Add to selected folders
        final Set<String> updatedSelected =
            Set.from(currentUiState.selectedBookmarkFolderNames);
        updatedSelected.add(name);
        _state.value = currentUiState.copyWith(
          selectedBookmarkFolderNames: updatedSelected,
        );
      },
    );

    return isSuccess;
  }

  Future<void> saveBookmarksForDua({
    required int duaID,
    required void Function(int, {required bool isBookmarked}) onSaved,
    required BuildContext context,
    Set<String>? selectedFolderNames,
  }) async {
    final Set<String> folderNamesToUse =
        selectedFolderNames ?? currentUiState.selectedBookmarkFolderNames;

    final String bookmarkSavedMessage = "Bookmark saved";
    final String bookmarkRemovedMessage = "Bookmark removed";

    final List<DuaBookmarkFolderEntity> bookmarkFolders = _allBookmarkFolders
        .where((f) => folderNamesToUse.contains(f.name))
        .map((f) => DuaBookmarkFolderEntity(
              id: -1, // Placeholder ID
              name: f.name,
              color: f.color,
              count: f.duaCount,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ))
        .toList();

    await executeMessageOnlyUseCase(
      () async => _saveBookmarksToDuaUseCase.execute(
        duaID: duaID,
        savingFolders: bookmarkFolders,
      ),
      onSuccess: () async {
        await loadBookmarkFolders();

        onSaved(
          bookmarkFolders.length,
          isBookmarked: bookmarkFolders.isNotEmpty,
        );

        if (bookmarkFolders.isEmpty) {
          addUserMessage(bookmarkRemovedMessage);
        } else if (!_wasBookmarkJustAdded || folderNamesToUse.length > 1) {
          addUserMessage(bookmarkSavedMessage);
        }
      },
      showMessage: false,
    );

    _wasBookmarkJustAdded = false;
    await _clearSelection();
  }

  Future<void> _clearSelection() async {
    _state.value = currentUiState.copyWith(
      selectedBookmarkFolderNames: {},
    );
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

  Future<void> loadDuasFromFolder(String folderName) async {
    await toggleLoading(loading: true);

    try {
      // Get bookmarks for this folder
      final bookmarks = await (_duaBookmarkRepository as dynamic)
          .getBookmarksByFolderName(folderName);

      if (bookmarks.isEmpty) {
        _state.value = currentUiState.copyWith(
          bookmarkedDuas: [],
          currentFolderName: folderName,
        );
        await toggleLoading(loading: false);
        return;
      }

      // Get all duas
      final allDuas = await _duaRepository.getAllDua();

      // Filter duas that match the bookmarked dua IDs
      final bookmarkedDuaIds = bookmarks.map((b) => b.duaID).toSet();
      final bookmarkedDuas =
          allDuas.where((dua) => bookmarkedDuaIds.contains(dua.id)).toList();

      _state.value = currentUiState.copyWith(
        bookmarkedDuas: bookmarkedDuas,
        currentFolderName: folderName,
      );
    } catch (e) {
      print('Error loading duas from folder: $e');
      addUserMessage('Failed to load duas: $e');
    } finally {
      await toggleLoading(loading: false);
      update();
    }
  }

  void navigateToDuaDetails(BuildContext context, DuaEntity dua) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DuaDetailsPage(dua: dua),
      ),
    );
  }

  Future<void> deleteFolder(BuildContext context, BookmarkFolder folder) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${folder.name}?'),
        content: Text(
            'This will remove all bookmarked duas in this folder. This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await toggleLoading(loading: true);

      try {
        final folderEntity = DuaBookmarkFolderEntity(
          id: -1,
          name: folder.name,
          color: folder.color,
          count: folder.duaCount,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await _duaBookmarkRepository.deleteBookmarkFolder(folder: folderEntity);

        // Refresh folders
        await loadBookmarkFolders();

        // Clear current folder if it was deleted
        if (currentUiState.currentFolderName == folder.name) {
          _state.value = currentUiState.copyWith(
            bookmarkedDuas: [],
            currentFolderName: '',
          );
        }

        addUserMessage('Folder deleted');
      } catch (e) {
        print('Error deleting folder: $e');
        addUserMessage('Failed to delete folder: $e');
      } finally {
        await toggleLoading(loading: false);
        update();
      }
    }
  }
}
