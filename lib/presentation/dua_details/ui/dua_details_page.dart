import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:dua/presentation/bookmark/ui/collection_bottom_sheet.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DuaDetailsPage extends StatefulWidget {
  final DuaEntity dua;

  const DuaDetailsPage({
    super.key,
    required this.dua,
  });

  @override
  State<DuaDetailsPage> createState() => _DuaDetailsPageState();
}

class _DuaDetailsPageState extends State<DuaDetailsPage> {
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _checkIfBookmarked();
  }

  Future<void> _checkIfBookmarked() async {
    try {
      final bookmarkRepository = locate<DuaBookmarkRepository>();
      final bookmarks =
          await bookmarkRepository.getBookmarksByDuaID(widget.dua.id);

      if (mounted) {
        setState(() {
          _isBookmarked = bookmarks.isNotEmpty;
        });
      }
    } catch (e) {
      print('Error checking bookmark status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<Map<String, dynamic>> groupsList = widget.dua.parseGroups();

    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Dua Details',
              titleSpacing: eightPx,
              titleFontSize: eighteenPx,
              onLeadingPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: sixteenPx),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(twelvePx),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with icon and number
                        Container(
                          padding: EdgeInsets.all(sixteenPx),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: DuaColor.primaryColorLight100,
                                size: twentyFourPx,
                              ),
                              SizedBox(width: eightPx),
                              Expanded(
                                child: Text(
                                  "${widget.dua.id}. ${widget.dua.name}",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1E7167),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (groupsList.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: groupsList.length,
                            itemBuilder: (context, index) {
                              final group = groupsList[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (group['name'] != null)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sixteenPx,
                                          vertical: eightPx),
                                      child: Text(
                                        group['name'] as String,
                                        style: TextStyle(
                                          fontSize: sixteenPx,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  if (group['context'] != null)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sixteenPx,
                                          vertical: fourPx),
                                      child: Text(group['context'] as String),
                                    ),
                                  if (group['indopak'] != null)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sixteenPx,
                                          vertical: eightPx),
                                      child: Text(
                                        group['indopak'] as String,
                                        style: TextStyle(
                                          fontFamily: 'KFGQ',
                                          fontSize: twentyFourPx,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  if (group['transliteration'] != null)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sixteenPx,
                                          vertical: fourPx),
                                      child: Text(
                                        group['transliteration'] as String,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  if (group['translation'] != null)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sixteenPx,
                                          vertical: fourPx),
                                      child:
                                          Text(group['translation'] as String),
                                    ),
                                  if (group['reference'] != null)
                                    Padding(
                                      padding: EdgeInsets.all(sixteenPx),
                                      child: Text(
                                        group['reference'] as String,
                                        style: TextStyle(
                                          fontSize: thirteenPx,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  Divider(),
                                ],
                              );
                            },
                          ),
                        // Main content area
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: sixteenPx,
                            vertical: eightPx,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (widget.dua.context.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: sixteenPx,
                                    horizontal: eightPx,
                                  ),
                                  child: Text(widget.dua.context),
                                ),
                              // Indopak (Arabic text)
                              if (widget.dua.indopak.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: sixteenPx,
                                    horizontal: eightPx,
                                  ),
                                  child: Text(
                                    widget.dua.indopak,
                                    style: TextStyle(
                                      fontFamily: 'KFGQ',
                                      fontSize: twentyEightPx,
                                      height: 1.8,
                                      color: Colors.black87,
                                    ),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                  ),
                                ),

                              // Transliteration
                              if (widget.dua.transliteration.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: eightPx,
                                    bottom: sixteenPx,
                                  ),
                                  child: Text(
                                    widget.dua.transliteration,
                                    style: TextStyle(
                                      fontSize: sixteenPx,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black54,
                                      height: 1.5,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),

                              // Divider before translation
                              Divider(
                                  color: Color.fromRGBO(158, 158, 158, 0.3)),

                              // Translation
                              if (widget.dua.translation.isNotEmpty) ...[
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: sixteenPx,
                                    bottom: eightPx,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Translation",
                                      style: TextStyle(
                                        fontSize: sixteenPx,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: sixteenPx),
                                  child: Text(
                                    widget.dua.translation,
                                    style: TextStyle(
                                      fontSize: sixteenPx,
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],

                              // Context (if available)
                              if (widget.dua.context.isNotEmpty) ...[
                                Padding(
                                  padding: EdgeInsets.only(bottom: sixteenPx),
                                  child: Text(
                                    widget.dua.context,
                                    style: TextStyle(
                                      fontSize: fifteenPx,
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],

                              // Reference
                              if (widget.dua.reference.isNotEmpty)
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: eightPx,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Reference",
                                        style: TextStyle(
                                          fontSize: fourteenPx,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      SizedBox(height: fourPx),
                                      Text(
                                        widget.dua.reference,
                                        style: TextStyle(
                                          fontSize: thirteenPx,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),

                        // Footer with action buttons
                        Container(
                          padding: EdgeInsets.all(sixteenPx),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Color.fromRGBO(158, 158, 158, 0.2),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildActionButton(
                                icon: Icons.play_arrow_rounded,
                                color: DuaColor.primaryColorLight100,
                                onTap: () {},
                              ),
                              _buildActionButton(
                                icon: _isBookmarked
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                color: DuaColor.primaryColorLight100,
                                onTap: () {
                                  _onBookmarkTap(context);
                                },
                              ),
                              _buildActionButton(
                                icon: Icons.copy_rounded,
                                color: DuaColor.primaryColorLight100,
                                onTap: () {},
                              ),
                              _buildActionButton(
                                icon: Icons.share_rounded,
                                color: DuaColor.primaryColorLight100,
                                onTap: () {},
                              ),
                              _buildActionButton(
                                icon: Icons.more_vert,
                                color: DuaColor.primaryColorLight100,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(twentyFourPx),
      child: Container(
        padding: EdgeInsets.all(eightPx),
        child: Icon(
          icon,
          color: color,
          size: twentyFourPx,
        ),
      ),
    );
  }

  void _onBookmarkTap(BuildContext context) async {
    await CollectionBottomSheet.show(
      context: context,
      duaID: widget.dua.id,
      title: 'Add Bookmark',
      collectionType: CollectionType.bookmark,
      onBookmarkToggled: (count, {required bool isBookmarked}) {
        // Update the UI to reflect the bookmark state
        setState(() {
          _isBookmarked = isBookmarked;
        });

        final String message =
            isBookmarked ? "Dua bookmarked" : "Bookmark removed";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(message), duration: const Duration(seconds: 2)),
        );
      },
    );
  }
}
