import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final List<Widget>? actions;
  final double? titleSpacing;
  final bool? centerTitle;
  final String? icon;
  final Color? backgroundColor;
  final bool? showLeading;
  final double? titleFontSize;
  final double? iconSize;
  final double? paddingLeft;
  final double? paddingRight;
  const CustomAppBar({
    super.key,
    required this.title,
    this.onLeadingPressed,
    this.actions,
    this.titleSpacing = 0,
    this.centerTitle = false,
    this.icon,
    this.backgroundColor,
    this.showLeading = true,
    this.titleFontSize,
    this.iconSize,
    this.paddingLeft,
    this.paddingRight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: paddingLeft ?? twelvePx,
        right: paddingRight ?? tenPx,
      ),
      child: AppBar(
        backgroundColor: backgroundColor,
        titleSpacing: titleSpacing,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: titleFontSize ?? twentyPx,
                fontWeight: FontWeight.w600,
                color: DuaColor.headingTextColorLight,
              ),
        ),
        centerTitle: centerTitle,
        leading: showLeading!
            ? IconButton(
                icon: SvgPicture.asset(icon ?? SvgPath.icArrowBack),
                iconSize: iconSize ?? twentyFourPx,
                onPressed: onLeadingPressed,
              )
            : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
