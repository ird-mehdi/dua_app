import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class DuaCollectionPreview extends StatelessWidget {
  final String title;
  final String subtitle;
  const DuaCollectionPreview({
    super.key,
    required this.theme,
    required this.title,
    required this.subtitle,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: sixteenPx, vertical: eighteenPx),
        decoration: BoxDecoration(
          color: context.color.shadeColor,
          borderRadius: BorderRadius.circular(twelvePx),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.color.primaryColor100,
                fontSize: fourteenPx,
              ),
            ),
            Text(
              subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: elevenPx,
                color: context.color.subtitleColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
