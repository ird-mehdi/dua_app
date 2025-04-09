import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DuaDetailsPage extends StatelessWidget {
  final DuaEntity dua;

  const DuaDetailsPage({
    super.key,
    required this.dua,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
                                  "${dua.id}. ${dua.name}",
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

                        // Main content area
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: sixteenPx,
                            vertical: eightPx,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Indopak (Arabic text)
                              if (dua.indopak.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: sixteenPx,
                                    horizontal: eightPx,
                                  ),
                                  child: Text(
                                    dua.indopak,
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
                              if (dua.transliteration.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: eightPx,
                                    bottom: sixteenPx,
                                  ),
                                  child: Text(
                                    dua.transliteration,
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
                              Divider(color: Color.fromRGBO(158, 158, 158, 0.3)),

                              // Translation
                              if (dua.translation.isNotEmpty) ...[
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
                                    dua.translation,
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
                              if (dua.context.isNotEmpty) ...[
                                Padding(
                                  padding: EdgeInsets.only(bottom: sixteenPx),
                                  child: Text(
                                    dua.context,
                                    style: TextStyle(
                                      fontSize: fifteenPx,
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],

                              // Reference
                              if (dua.reference.isNotEmpty)
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
                                        dua.reference,
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
                                icon: Icons.bookmark_outline,
                                color: DuaColor.primaryColorLight100,
                                onTap: () {},
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
}
