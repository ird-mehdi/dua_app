import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:flutter/material.dart';

class LecturePlaylistItem extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const LecturePlaylistItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: padding16,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: radius12,
      ),
      child: Row(
        children: [
          Container(
            width: fortyEightPx,
            height: fortyEightPx,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: radius8,
            ),
            child: Center(
              child: Text(
                icon,
                style: TextStyle(fontSize: twentyFourPx),
              ),
            ),
          ),
          gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: sixteenPx,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                gapH4,
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: fourteenPx,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
