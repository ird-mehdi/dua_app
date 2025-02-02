import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllDuaPage extends StatelessWidget {
  const AllDuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'All Dua',
          icon: AppImages.icCategory2,
        ),
        body: Column(
          children: [
            CustomSearchBar(),
          ],
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by dua\'s name',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: context.color.titleColor.withOpacityInt(0.6),
            fontSize: fourteenPx,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(tenPx),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppImages.icSearch,
                  width: eighteenPx,
                  height: eighteenPx,
                ),
                gapH10,
              ],
            ),
          ),
          filled: true,
          fillColor: context.color.shadeColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: sixteenPx,
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
    borderSide: BorderSide.none,
  );
}
