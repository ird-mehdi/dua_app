import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  final String title;
  final String iconPath;
  const IconTextRow({
    super.key,
    required this.theme,
    required this.title,
    required this.iconPath,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgImage(
          assetName: iconPath,
          width: twentyTwoPx,
          height: twentyTwoPx,
          color: context.color.primaryColor100,
        ),
        gapW18,
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: fifteenPx,
            fontWeight: FontWeight.w500,
            color: context.color.titleColor,
          ),
        ),
      ],
    );
  }
}
