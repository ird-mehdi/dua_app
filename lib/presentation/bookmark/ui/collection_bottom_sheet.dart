// ignore_for_file: use_build_context_synchronously

import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/bookmark/presenter/bookmark_presenter.dart';
import 'package:flutter/material.dart';

enum CollectionType { bookmark }

class CollectionBottomSheet {
  static Future<void> show({
    required BuildContext context,
    required int duaID,
    required String title,
    required CollectionType collectionType,
    required void Function(int, {required bool isBookmarked}) onBookmarkToggled,
  }) async {
    final BookmarkPresenter bookmarkPresenter = locate<BookmarkPresenter>();
    await bookmarkPresenter.loadBookmarkFolders();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(twentyPx)),
      ),
      builder: (context) {
        return BookmarkCollectionContent(
          duaID: duaID,
          title: title,
          onBookmarkToggled: onBookmarkToggled,
        );
      },
    );
  }
}

class BookmarkCollectionContent extends StatefulWidget {
  final int duaID;
  final String title;
  final void Function(int, {required bool isBookmarked}) onBookmarkToggled;

  const BookmarkCollectionContent({
    super.key,
    required this.duaID,
    required this.title,
    required this.onBookmarkToggled,
  });

  @override
  State<BookmarkCollectionContent> createState() =>
      _BookmarkCollectionContentState();
}

class _BookmarkCollectionContentState extends State<BookmarkCollectionContent> {
  final BookmarkPresenter presenter = locate<BookmarkPresenter>();
  Set<String> selectedFolderNames = {};
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _initSelectedFolders();
  }

  Future<void> _initSelectedFolders() async {
    final bookmarkedFolders =
        await presenter.getBookmarkFoldersForDua(widget.duaID);
    setState(() {
      selectedFolderNames =
          bookmarkedFolders.map((folder) => folder.name).toSet();
    });
  }

  List<BookmarkFolder> _getFilteredFolders() {
    if (searchQuery.isEmpty) {
      return presenter.currentUiState.bookmarkFolders;
    }

    return presenter.currentUiState.bookmarkFolders
        .where((folder) =>
            folder.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: presenter,
      builder: (context, child) {
        final filteredFolders = _getFilteredFolders();

        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sixteenPx,
                  vertical: twentyPx,
                ),
                child: Text(
                  'Bookmark',
                  style: TextStyle(
                    fontSize: twentyPx,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Search box
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sixteenPx, vertical: eightPx),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search by folder name',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),

              // Folders list
              if (presenter.currentUiState.isLoading)
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ))
              else if (filteredFolders.isEmpty && searchQuery.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Text("No folders matching your search"),
                  ),
                )
              else
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                        horizontal: sixteenPx, vertical: eightPx),
                    itemCount: filteredFolders.length,
                    itemBuilder: (context, index) {
                      final folder = filteredFolders[index];
                      final isSelected =
                          selectedFolderNames.contains(folder.name);

                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedFolderNames.remove(folder.name);
                              } else {
                                selectedFolderNames.add(folder.name);
                              }
                            });
                          },
                          child: Row(
                            children: [
                              // Checkbox
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: isSelected,
                                  activeColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == true) {
                                        selectedFolderNames.add(folder.name);
                                      } else {
                                        selectedFolderNames.remove(folder.name);
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: sixteenPx),

                              // Folder icon
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.folder,
                                  color: folder.color,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: twelvePx),

                              // Folder name
                              Expanded(
                                child: Text(
                                  folder.name,
                                  style: TextStyle(
                                    fontSize: sixteenPx,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

              // Buttons
              Padding(
                padding: EdgeInsets.all(sixteenPx),
                child: Row(
                  children: [
                    // Create New button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _showCreateFolderDialog(context),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text('Create New'),
                      ),
                    ),
                    SizedBox(width: twelvePx),

                    // Done button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveBookmarks,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text('Done'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showCreateFolderDialog(BuildContext context) async {
    final isCreated = await presenter.showCreateBookmarkFolderSheet(
      context,
      duaID: widget.duaID,
    );

    if (isCreated && mounted) {
      // Refresh the list of folders
      await presenter.loadBookmarkFolders();

      // Update the UI
      setState(() {});
    }
  }

  Future<void> _saveBookmarks() async {
    // Save bookmarks directly with our selected folder names
    await presenter.saveBookmarksForDua(
      duaID: widget.duaID,
      onSaved: widget.onBookmarkToggled,
      context: context,
      selectedFolderNames: selectedFolderNames,
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
