import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/services/bookmark_sync_service.dart';
import 'package:dua/domain/entities/dua_bookmark_folder_entity.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:dua/domain/use_cases/bookmark/create_bookmark_folder_use_case.dart';
import 'package:dua/domain/use_cases/bookmark/get_all_bookmark_folders_use_case.dart';
import 'package:dua/domain/use_cases/bookmark/save_bookmarks_to_dua_use_case.dart';
import 'package:dua/presentation/bookmark/presenter/bookmark_ui_state.dart';
import 'package:dua/presentation/bookmark/widgets/edit_bookmark_bottom_sheet.dart';
import 'package:dua/presentation/bookmark/widgets/create_bookmark_folder_sheet.dart';
import 'package:dua/presentation/dua_details/ui/dua_details_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkPresenter extends BasePresenter<BookmarkUiState> {
  final _state = BookmarkUiState.initial().obs;
  final List<BookmarkFolder> _allBookmarkFolders = [];
  bool _wasBookmarkJustAdded = false;
  final TextEditingController searchController = TextEditingController();

  // Default folder name constant
  static const String defaultFolderName = "Favorites";

  // Use cases
  late final SaveBookmarksToDuaUseCase _saveBookmarksToDuaUseCase;
  late final CreateBookmarkFolderUseCase _createBookmarkFolderUseCase;
  late final GetAllBookmarkFoldersUseCase _getAllBookmarkFoldersUseCase;

  // Repositories
  late final DuaBookmarkRepository _duaBookmarkRepository;
  late final DuaRepository _duaRepository;

  // Memory caches for better performance
  static final Map<String, List<DuaEntity>> _folderDuasCache = {};
  static List<DuaEntity>? _allDuasCache;
  static final Map<int, List<BookmarkFolder>> _duaBookmarkFoldersCache = {};

  late final BookmarkSyncService _bookmarkSyncService;

  BookmarkUiState get currentUiState => _state.value;

  @override
  void onInit() {
    super.onInit();
    _initUseCases();
    loadBookmarkFolders();
    // Listen to search controller changes
    searchController.addListener(_onSearchChanged);
  }

  @override
  void onClose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.onClose();
  }

  void _onSearchChanged() {
    _state.value = currentUiState.copyWith(searchQuery: searchController.text);
    _filterBookmarksBySearch();
    update();
  }

  void _filterBookmarksBySearch() {
    final query = currentUiState.searchQuery.toLowerCase().trim();

    if (query.isEmpty) {
      // If search is empty, restore all folders with sorting
      final sortedFolders = _sortFolders(List.from(_allBookmarkFolders));

      _state.value = currentUiState.copyWith(
        bookmarkFolders: sortedFolders,
      );

      // If in folder view, also reset bookmarked duas with sorting
      if (currentUiState.currentFolderName.isNotEmpty) {
        loadDuasFromFolder(currentUiState.currentFolderName);
      }
    } else {
      if (currentUiState.currentFolderName.isEmpty) {
        // Filter folders
        final filteredFolders = _allBookmarkFolders
            .where((folder) => folder.name.toLowerCase().contains(query))
            .toList();

        // Sort filtered folders
        final sortedFilteredFolders = _sortFolders(filteredFolders);

        _state.value = currentUiState.copyWith(
          bookmarkFolders: sortedFilteredFolders,
        );
      } else {
        // We're in a folder, filter duas
        final unfilteredDuas =
            _folderDuasCache[currentUiState.currentFolderName] ?? [];
        final filteredDuas = unfilteredDuas
            .where((dua) =>
                dua.name.toLowerCase().contains(query) ||
                dua.context.toLowerCase().contains(query) ||
                dua.translation.toLowerCase().contains(query) ||
                dua.reference.toLowerCase().contains(query))
            .toList();

        // Sort filtered duas
        final sortedFilteredDuas = _sortDuas(filteredDuas);

        _state.value = currentUiState.copyWith(
          bookmarkedDuas: sortedFilteredDuas,
        );
      }
    }
    update();
  }

  // Clear search
  void clearSearch() {
    searchController.clear();
    _state.value = currentUiState.copyWith(searchQuery: '');
    _filterBookmarksBySearch();
    update();
  }

  void _initUseCases() {
    // Initialize use cases and repositories
    try {
      _saveBookmarksToDuaUseCase = locate<SaveBookmarksToDuaUseCase>();
      _createBookmarkFolderUseCase = locate<CreateBookmarkFolderUseCase>();
      _getAllBookmarkFoldersUseCase = locate<GetAllBookmarkFoldersUseCase>();
      _duaBookmarkRepository = locate<DuaBookmarkRepository>();
      _duaRepository = locate<DuaRepository>();
      _bookmarkSyncService = locate<BookmarkSyncService>();
    } catch (e) {}
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
                  createdAt: folder.createdAt,
                ))
            .toList();

        _allBookmarkFolders.clear();
        _allBookmarkFolders.addAll(bookmarkFolders);

        // Apply any current search filter and sorting
        if (currentUiState.searchQuery.isNotEmpty) {
          _filterBookmarksBySearch();
        } else {
          // Apply sorting
          final sortedFolders = _sortFolders(List.from(bookmarkFolders));

          _state.value = currentUiState.copyWith(
            bookmarkFolders: sortedFolders,
            currentFolderName: '',
          );
        }
      },
    );

    await toggleLoading(loading: false);
    update();
  }

  Future<List<BookmarkFolder>> getBookmarkFoldersForDua(int duaID) async {
    // Check cache first
    if (_duaBookmarkFoldersCache.containsKey(duaID)) {
      return _duaBookmarkFoldersCache[duaID]!;
    }

    final bookmarks = await _duaBookmarkRepository.getBookmarksByDuaID(duaID);
    if (bookmarks.isEmpty) {
      _duaBookmarkFoldersCache[duaID] = [];
      return [];
    }

    // Get folder names from bookmarks
    final folderNames =
        bookmarks.map((bookmark) => bookmark.folderName).toSet();

    // Find matching folders in all bookmark folders
    final matchingFolders = _allBookmarkFolders
        .where((folder) => folderNames.contains(folder.name))
        .toList();

    // Cache the result
    _duaBookmarkFoldersCache[duaID] = matchingFolders;

    return matchingFolders;
  }

  // Get the default Favorites folder
  BookmarkFolder? getDefaultFolder() {
    return _allBookmarkFolders
        .firstWhereOrNull((folder) => folder.name == defaultFolderName);
  }

  // Add a bookmark directly to Favorites folder
  Future<void> addToFavorites({
    required int duaID,
    required void Function(int, {required bool isBookmarked}) onSaved,
    required BuildContext context,
  }) async {
    // Find the Favorites folder
    final favoritesFolder = getDefaultFolder();

    if (favoritesFolder == null) {
      addUserMessage("Error: Favorites folder not found");
      return;
    }

    // Create a set with just the Favorites folder
    final Set<String> folderNames = {defaultFolderName};

    // Use the existing saveBookmarksForDua method with this folder
    await saveBookmarksForDua(
      duaID: duaID,
      onSaved: onSaved,
      context: context,
      selectedFolderNames: folderNames,
    );
  }

  // Toggle a bookmark in the Favorites folder
  Future<void> toggleFavorite({
    required int duaID,
    required void Function(int, {required bool isBookmarked}) onSaved,
    required BuildContext context,
  }) async {
    // Check if dua is already in Favorites
    final folders = await getBookmarkFoldersForDua(duaID);
    final isAlreadyInFavorites =
        folders.any((f) => f.name == defaultFolderName);

    // Check if context is still valid before proceeding
    if (context.mounted) {
      if (isAlreadyInFavorites) {
        // Remove from favorites by saving with empty folders list
        await saveBookmarksForDua(
          duaID: duaID,
          onSaved: onSaved,
          context: context,
          selectedFolderNames: {},
        );
      } else {
        // Add to favorites
        await addToFavorites(
          duaID: duaID,
          onSaved: onSaved,
          context: context,
        );
      }
    }
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
      colorValue: color.toARGB32(),
    );

    _state.value = currentUiState.copyWith(
      bookmarkFolders: updatedFolders,
    );

    // Clear caches after updating folder
    _folderDuasCache.clear();
    _duaBookmarkFoldersCache.clear();

    update();
  }

  Future<bool> createBookmarkFolder({
    required String name,
    required Color color,
    required int duaID,
  }) async {
    bool isSuccess = false;
    final DateTime createdAt = DateTime.now();

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

        // Find the folder that was just created and update its creation date
        final folderIndex =
            _allBookmarkFolders.indexWhere((folder) => folder.name == name);
        if (folderIndex != -1) {
          _allBookmarkFolders[folderIndex] =
              _allBookmarkFolders[folderIndex].copyWith(
            createdAt: createdAt,
          );

          // Update the folders list in UI state
          _state.value = currentUiState.copyWith(
            selectedBookmarkFolderNames: updatedSelected,
            bookmarkFolders: List.from(_allBookmarkFolders),
          );
        } else {
          _state.value = currentUiState.copyWith(
            selectedBookmarkFolderNames: updatedSelected,
          );
        }

        // Clear caches after creating folder
        _folderDuasCache.clear();
        _duaBookmarkFoldersCache.clear();
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

        // Clear caches after saving bookmarks
        _folderDuasCache.clear();
        _duaBookmarkFoldersCache.remove(duaID);
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

  Future<bool> showCreateBookmarkFolderSheet(
    BuildContext context, {
    required int duaID,
  }) async {
    final result = await CreateBookmarkFolderSheet.show(
      context: context,
    );

    if (result != null) {
      final String name = result['name'];
      final Color color = result['color'];

      return await createBookmarkFolder(
        name: name,
        color: color,
        duaID: duaID,
      );
    }

    return false;
  }

  Future<void> loadDuasFromFolder(String folderName) async {
    await toggleLoading(loading: true);

    try {
      // Check cache first
      List<DuaEntity> bookmarkedDuas;

      if (_folderDuasCache.containsKey(folderName)) {
        bookmarkedDuas = _folderDuasCache[folderName]!;
      } else {
        // Get bookmarks for this folder
        final bookmarks = await (_duaBookmarkRepository as dynamic)
            .getBookmarksByFolderName(folderName);

        if (bookmarks.isEmpty) {
          _folderDuasCache[folderName] = [];
          _state.value = currentUiState.copyWith(
            bookmarkedDuas: [],
            currentFolderName: folderName,
          );
          await toggleLoading(loading: false);
          return;
        }

        // Get all duas (use cache if available)
        final List<DuaEntity> allDuas;
        if (_allDuasCache != null) {
          allDuas = _allDuasCache!;
        } else {
          // Get bookmarked duas individually with light data
          final List<DuaEntity> fetchedDuas = [];

          // For each bookmarked dua ID, fetch light data and convert to DuaEntity
          for (final bookmark in bookmarks) {
            final duaId = bookmark.duaID;
            final lightDua = await _duaRepository.getDuaLightById(duaId);

            if (lightDua != null) {
              // Convert light dua to DuaEntity
              fetchedDuas.add(DuaEntity(
                id: lightDua['id'] as int,
                languageId: '',
                groups: '[]',
                name: lightDua['title'] as String? ?? '',
                context: '',
                source: '',
                indopak: '',
                clean: lightDua['arabic_text'] as String? ?? '',
                transliteration: '',
                translation: '',
                note: '',
                reference: '',
                audio: 0,
                categoryId: 0,
                subcategoryId: 0,
              ));
            }
          }

          allDuas = fetchedDuas;
          _allDuasCache = allDuas;
        }

        // Filter duas that match the bookmarked dua IDs and ensure no duplicates
        final bookmarkedDuaIds = bookmarks.map((b) => b.duaID).toSet();

        // Use a map to ensure each dua only appears once based on its ID
        final Map<int, DuaEntity> uniqueDuas = {};
        for (var dua in allDuas) {
          if (bookmarkedDuaIds.contains(dua.id) &&
              !uniqueDuas.containsKey(dua.id)) {
            uniqueDuas[dua.id] = dua;
          }
        }

        bookmarkedDuas = uniqueDuas.values.toList();

        // Cache the results
        _folderDuasCache[folderName] = bookmarkedDuas;
      }

      // Apply search filter if needed
      if (currentUiState.searchQuery.isNotEmpty) {
        final query = currentUiState.searchQuery.toLowerCase();
        bookmarkedDuas = bookmarkedDuas
            .where((dua) =>
                dua.name.toLowerCase().contains(query) ||
                dua.context.toLowerCase().contains(query) ||
                dua.translation.toLowerCase().contains(query) ||
                dua.reference.toLowerCase().contains(query))
            .toList();
      }

      // Apply sorting
      final sortedDuas = _sortDuas(bookmarkedDuas);

      _state.value = currentUiState.copyWith(
        bookmarkedDuas: sortedDuas,
        currentFolderName: folderName,
      );
    } catch (e) {
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
    // Don't allow deleting the Favorites folder
    if (folder.name == defaultFolderName) {
      addUserMessage("The Favorites folder cannot be deleted");
      return;
    }

    // Store necessary information before showing dialog
    final String folderName = folder.name;
    final Color folderColor = folder.color;
    final int folderCount = folder.duaCount;

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

    // If user confirmed deletion, proceed regardless of context
    if (confirm == true) {
      await toggleLoading(loading: true);

      try {
        final folderEntity = DuaBookmarkFolderEntity(
          id: -1,
          name: folderName,
          color: folderColor,
          count: folderCount,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await _duaBookmarkRepository.deleteBookmarkFolder(folder: folderEntity);

        // Clear caches after deleting folder
        _folderDuasCache.remove(folderName);
        _duaBookmarkFoldersCache.clear();

        // Refresh folders
        await loadBookmarkFolders();

        // Clear current folder if it was deleted
        if (currentUiState.currentFolderName == folderName) {
          _state.value = currentUiState.copyWith(
            bookmarkedDuas: [],
            currentFolderName: '',
          );
        }

        addUserMessage('Folder deleted');
      } catch (e) {
        addUserMessage('Failed to delete folder: $e');
      } finally {
        await toggleLoading(loading: false);
        update();
      }
    } else {}
  }

  void resetCurrentFolder() {
    _state.value = currentUiState.copyWith(
      currentFolderName: '',
      bookmarkedDuas: [],
    );
    update();
  }

  // Clear all in-memory caches (call this when memory needs to be freed)
  void clearMemoryCaches() {
    _folderDuasCache.clear();
    _allDuasCache = null;
    _duaBookmarkFoldersCache.clear();
  }

  // Replace the setCurrentFolder method with this one
  void setCurrentFolder(String folderName) {
    loadDuasFromFolder(folderName);
  }

  // Method to change sort option
  void setSortOption(BookmarkSortOption option) {
    _state.value = currentUiState.copyWith(sortOption: option);
    _applySorting();
    update();
  }

  // Apply current sorting to both folders and duas
  void _applySorting() {
    if (currentUiState.currentFolderName.isEmpty) {
      // Sort folders
      final sortedFolders =
          _sortFolders(List.from(currentUiState.bookmarkFolders));
      _state.value = currentUiState.copyWith(bookmarkFolders: sortedFolders);
    } else {
      // Sort duas in current folder
      final sortedDuas = _sortDuas(List.from(currentUiState.bookmarkedDuas));
      _state.value = currentUiState.copyWith(bookmarkedDuas: sortedDuas);
    }
  }

  // Sort folders based on current sort option
  List<BookmarkFolder> _sortFolders(List<BookmarkFolder> folders) {
    switch (currentUiState.sortOption) {
      case BookmarkSortOption.recent:
        // Sort by created date (newest first)
        folders.sort((a, b) {
          if (a.createdAt == null && b.createdAt == null) return 0;
          if (a.createdAt == null) return 1;
          if (b.createdAt == null) return -1;
          return b.createdAt!.compareTo(a.createdAt!);
        });
        break;
      case BookmarkSortOption.alphabetical:
        // Sort alphabetically
        folders.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        break;
    }
    return folders;
  }

  // Sort duas based on current sort option
  List<DuaEntity> _sortDuas(List<DuaEntity> duas) {
    switch (currentUiState.sortOption) {
      case BookmarkSortOption.recent:
        // For duas, we might not have created date directly,
        // so we'll use ID as a proxy (assuming higher IDs are newer)
        duas.sort((a, b) => b.id.compareTo(a.id));
        break;
      case BookmarkSortOption.alphabetical:
        // Sort alphabetically by name
        duas.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        break;
    }
    return duas;
  }

  // Export bookmarks to JSON file
  Future<String> exportBookmarksToJson() async {
    toggleLoading(loading: true);
    try {
      final filePath = await _bookmarkSyncService.exportBookmarksToJson();

      // Extract just the filename from the path
      final fileName = filePath.split('/').last;

      // Check if the file is in the Download folder
      final isInDownloads =
          filePath.contains('/Download/') || filePath.contains('/Downloads/');

      if (isInDownloads) {
        addUserMessage(
            'Bookmarks exported successfully to Downloads folder as "$fileName"');
      } else {
        addUserMessage('Bookmarks exported successfully as "$fileName"');
      }

      toggleLoading(loading: false);
      update();
      return filePath;
    } catch (e) {
      addUserMessage('Failed to export bookmarks: $e');
      toggleLoading(loading: false);
      update();
      rethrow;
    }
  }

  // Import bookmarks from JSON file
  Future<bool> importBookmarksFromJson(String filePath) async {
    toggleLoading(loading: true);
    try {
      final result =
          await _bookmarkSyncService.importBookmarksFromJson(filePath);
      if (result) {
        addUserMessage('Bookmarks imported successfully');
        await loadBookmarkFolders(); // Refresh the folders
      } else {
        addUserMessage('Failed to import bookmarks');
      }
      toggleLoading(loading: false);
      update();
      return result;
    } catch (e) {
      addUserMessage('Failed to import bookmarks: $e');
      toggleLoading(loading: false);
      update();
      return false;
    }
  }

  // Show import file picker
  void showImportFilePicker(BuildContext context) async {
    toggleLoading(loading: true);
    try {
      // Remove the explanation dialog and directly open the file picker

      // Allow all file types but with .json extension filter
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any, // Changed from FileType.custom to FileType.any
        // allowedExtensions: ['json'], // Removed this restriction
        allowMultiple: false,
        dialogTitle: 'Select a JSON bookmark file',
      );

      if (result != null && result.files.isNotEmpty) {
        final String? filePath = result.files.first.path;
        if (filePath != null) {
          // Verify if it's actually a JSON file
          if (!filePath.toLowerCase().endsWith('.json')) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select a JSON file')),
              );
            }
            toggleLoading(loading: false);
            update();
            return;
          }

          final success = await importBookmarksFromJson(filePath);
          if (success && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bookmarks imported successfully')),
            );
          } else if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to import bookmarks')),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error selecting file: $e')),
        );
      }
    } finally {
      toggleLoading(loading: false);
      update();
    }
  }

  // Show backup options menu
  void showBackupOptionsMenu(BuildContext context) {
    // Store a reference to the BuildContext
    final scaffoldContext = context;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.file_upload),
            title: const Text('Export Bookmarks'),
            subtitle: const Text(
                'Save your bookmarks as a JSON file to Downloads folder'),
            onTap: () async {
              Navigator.pop(context);
              try {
                final filePath = await exportBookmarksToJson();

                // Extract the filename and folder information
                final fileName = filePath.split('/').last;
                final isInDownloads = filePath.contains('/Download/') ||
                    filePath.contains('/Downloads/');
                final locationMessage =
                    isInDownloads ? 'in Downloads folder' : 'in app storage';

                // Use the stored context instead of trying to get a new one
                if (scaffoldContext.mounted) {
                  ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Bookmarks exported as "$fileName" $locationMessage'),
                      duration: const Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          ScaffoldMessenger.of(scaffoldContext)
                              .hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                }
              } catch (e) {
                if (scaffoldContext.mounted) {
                  ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                    SnackBar(content: Text('Error exporting bookmarks: $e')),
                  );
                }
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_download),
            title: const Text('Import Bookmarks'),
            subtitle: const Text('Import bookmarks from a JSON file (.json)'),
            onTap: () {
              Navigator.pop(context);
              showImportFilePicker(scaffoldContext);
            },
          ),
        ],
      ),
    );
  }
}
