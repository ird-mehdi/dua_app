import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllDuaPage extends StatelessWidget {
  const AllDuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(eightPx),
        child: Column(
          children: [
            CustomAppBar(
              title: 'All Dua',
              icon: AppImages.icCategory2,
              titleSpacing: eightPx,
              titleFontSize: eighteenPx,
            ),
            CustomSearchBar(),
            Padding(
              padding: EdgeInsets.only(left: eightPx),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Sorting Type',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: twelvePx,
                      color: context.color.titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 200,
                            child: SortingWidget(),
                          );
                        },
                      );
                    },
                    icon: SvgPicture.asset(
                      SvgPath.icSort,
                      width: fourteenPx,
                      height: fourteenPx,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 20, // Replace with actual data length
                itemBuilder: (BuildContext context, int index) {
                  return Text('data');
                },
              ),
            ),
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: eightPx,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by dua\'s name',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: context.color.titleColor.withOpacityInt(0.6),
            fontSize: fourteenPx,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: sixteenPx),
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

class SortingWidget extends StatelessWidget {
  const SortingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: context.color.backgroundColor,
        borderRadius: radius30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Text(
              'Sorting',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RadioListTile(
            title: Text(
              'by Number (1-100)',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fifteenPx,
                color: context.color.titleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            groupValue: null,
            onChanged: (value) => null,
            value: null,
            activeColor: context.color.titleColor,
          ),
          RadioListTile(
            title: Text(
              'by Alphabets (A - Z)',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fifteenPx,
                color: context.color.titleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            groupValue: null,
            onChanged: (value) => null,
            value: null,
            activeColor: context.color.titleColor,
          ),
        ],
      ),
    );
  }
}
