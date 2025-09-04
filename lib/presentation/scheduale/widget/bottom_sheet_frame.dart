import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/scheduale/widget/icon_text_row.dart';
import 'package:flutter/material.dart';

class BottomSheetFrame extends StatelessWidget {
  final String headerTitle;
  const BottomSheetFrame({
    super.key,
    required this.theme,
    required this.headerTitle,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(thirtyPx),
          topRight: Radius.circular(thirtyPx),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: sixteenPx, vertical: eightPx),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(twentyPx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        headerTitle,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: eighteenPx,
                          fontWeight: FontWeight.w600,
                          color: context.color.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                IconTextRow(
                    theme: theme,
                    title: 'Edit Memorization',
                    iconPath: SvgPath.icEdit),
                gapH30,
                IconTextRow(
                    theme: theme, title: 'Delete', iconPath: SvgPath.icTrash),
                gapH25,
              ],
            ),
          ),
          // Add your bottom sheet content here
        ],
      ),
    );
  }
}
