import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final List<Widget>? actions;
  final double? titleSpacing;
  final bool? centerTitle;
  final String? icon;
  final Color? backgroundColor;
  final Widget? leading;
  const CustomAppBar({
    super.key,
    required this.title,
    this.onLeadingPressed,
    this.actions,
    this.titleSpacing = 0,
    this.centerTitle = false,
    this.icon,
    this.backgroundColor,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      titleSpacing: titleSpacing,
      title: Text(
        title,
      ),
      centerTitle: centerTitle,
      leading: leading,
      automaticallyImplyLeading: false,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
