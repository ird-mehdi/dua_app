import 'package:dua/core/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final List<Widget>? actions;
  final double? titleSpacing;
  final bool? centerTitle;
  final String? icon;
  const CustomAppBar({
    super.key,
    required this.title,
    this.onLeadingPressed,
    this.actions,
    this.titleSpacing = 0,
    this.centerTitle = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: titleSpacing,
      title: Text(
        title,
      ),
      centerTitle: centerTitle,
      leading: IconButton(
        icon: SvgPicture.asset(icon ?? AppImages.icSearch),
        onPressed: onLeadingPressed ?? () => Navigator.of(context).pop(),
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
