import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const CustomSearchBar({super.key, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sixteenPx,
      ),
      child: TextField(
        // controller: controller ?? null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: context.color.titleColor.withOpacityInt(0.6),
            fontSize: fourteenPx,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: sixteenPx),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgImage(
                  assetName: AppImages.icSearch,
                  width: eighteenPx,
                  height: eighteenPx,
                  color: context.color.primaryColor100,
                ),
                gapH10,
              ],
            ),
          ),
          filled: true,
          fillColor: context.color.shadeColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: fourteenPx,
            horizontal: sixteenPx,
          ),
          border: _buildInputBorder(context),
          enabledBorder: _buildInputBorder(context),
          focusedBorder: _buildInputBorder(context),
        ),
      ),
    );
  }
}

OutlineInputBorder _buildInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: radius24,
    borderSide: BorderSide(
      color: context.color.primaryColor20, // Adjust the color as needed
      width: 2.0, // 2px border width
    ),
  );
}
