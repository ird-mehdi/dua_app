import 'package:dua/core/config/dua_custom_text_theme.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH8,
      child: Opacity(
        opacity: 0.70,
        child: Text(
          title,
          style:
              Theme.of(context).extension<DuaCustomTextTheme>()?.sectionTitle,
        ),
      ),
    );
  }
}
