import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/presentation/bookmark/presenter/bookmark_presenter.dart';
import 'package:flutter/material.dart';

class BookmarkFolderDetailPage extends StatefulWidget {
  final BookmarkFolder folder;

  const BookmarkFolderDetailPage({
    super.key,
    required this.folder,
  });

  @override
  State<BookmarkFolderDetailPage> createState() =>
      _BookmarkFolderDetailPageState();
}

class _BookmarkFolderDetailPageState extends State<BookmarkFolderDetailPage> {
  final BookmarkPresenter presenter = locate<BookmarkPresenter>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFolderData();
  }

  Future<void> _loadFolderData() async {
    setState(() {
      isLoading = true;
    });
    await presenter.loadDuasFromFolder(widget.folder.name);
    setState(() {
      isLoading = false;
    });
  }

  void _showSettingsBottomSheet() {
    final int folderIndex = presenter.currentUiState.bookmarkFolders
        .indexWhere((f) => f.name == widget.folder.name);

    if (folderIndex != -1) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(twentyPx)),
        ),
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Folder'),
              onTap: () {
                Navigator.pop(context);
                presenter.showEditBookmarkBottomSheet(
                  context,
                  folderName: widget.folder.name,
                  folderColor: widget.folder.color,
                  folderIndex: folderIndex,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Delete Folder', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _deleteFolder();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green.shade800),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.folder.name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.green.shade800),
            onPressed: _showSettingsBottomSheet,
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Folder info card
                Padding(
                  padding: EdgeInsets.all(sixteenPx),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(sixteenPx),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(twelvePx),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.folder.name,
                          style: TextStyle(
                            fontSize: eighteenPx,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade800,
                          ),
                        ),
                        SizedBox(height: fourPx),
                        Text(
                          'Total Duas: ${presenter.currentUiState.bookmarkedDuas.length}',
                          style: TextStyle(
                            fontSize: fourteenPx,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Duas List
                Expanded(
                  child: _buildDuasList(),
                ),
              ],
            ),
    );
  }

  Widget _buildDuasList() {
    final List<DuaEntity> duas = presenter.currentUiState.bookmarkedDuas;

    if (duas.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border,
              size: 64,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 16),
            Text(
              'No duas in this folder',
              style: TextStyle(
                fontSize: sixteenPx,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: sixteenPx),
      itemCount: duas.length,
      itemBuilder: (context, index) => _buildDuaItem(duas[index]),
    );
  }

  Widget _buildDuaItem(DuaEntity dua) {
    return Card(
      margin: EdgeInsets.only(bottom: twelvePx),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(twelvePx),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () => presenter.navigateToDuaDetails(context, dua),
        borderRadius: BorderRadius.circular(twelvePx),
        child: Padding(
          padding: EdgeInsets.all(sixteenPx),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with number
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${dua.id}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: twelvePx),
                  Expanded(
                    child: Text(
                      dua.name,
                      style: TextStyle(
                        fontSize: sixteenPx,
                        fontWeight: FontWeight.w600,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: sixteenPx),

              // Arabic text
              if (dua.indopak.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: twelvePx),
                  child: Text(
                    dua.indopak,
                    style: TextStyle(
                      fontFamily: 'KFGQ',
                      fontSize: twentyFourPx,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),

              // Transliteration
              if (dua.transliteration.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: twelvePx),
                  child: Text(
                    dua.transliteration,
                    style: TextStyle(
                      fontSize: fourteenPx,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),

              // Translation
              if (dua.translation.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: twelvePx),
                  child: Text(
                    dua.translation,
                    style: TextStyle(
                      fontSize: fourteenPx,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),

              // Reference
              if (dua.reference.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reference:',
                      style: TextStyle(
                        fontSize: twelvePx,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: fourPx),
                    Text(
                      dua.reference,
                      style: TextStyle(
                        fontSize: twelvePx,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),

              // Action buttons
              SizedBox(height: sixteenPx),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(Icons.bookmark, 'Bookmark'),
                  _buildActionButton(Icons.lightbulb_outline, 'Memorize'),
                  _buildActionButton(Icons.play_arrow, 'Play'),
                  _buildActionButton(Icons.calendar_today, 'Schedule'),
                  _buildActionButton(Icons.more_horiz, 'More'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fourPx),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(twentyFourPx),
        child: Icon(
          icon,
          color: Colors.grey.shade600,
          size: twentyPx,
        ),
      ),
    );
  }

  void _deleteFolder() async {
    final bool result = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Delete ${widget.folder.name}?'),
            content: Text(
              'This will remove all bookmarked duas in this folder. This action cannot be undone.',
            ),
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
        ) ??
        false;

    if (result) {
      await presenter.deleteFolder(context, widget.folder);
      if (mounted) {
        Navigator.pop(context); // Return to bookmark list
      }
    }
  }
}
