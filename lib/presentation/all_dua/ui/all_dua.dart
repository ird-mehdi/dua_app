import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/all_dua/widgets/dua_sorting_bottom_sheet.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_search_bar.dart';

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
            CustomSearchBar(
              hintText: 'Search by dua\'s name',
            ),
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
                            child: DuaSortingBottomSheet(),
                          );
                        },
                      );
                    },
                    icon: SvgImage(
                      assetName: SvgPath.icSort,
                      width: fourteenPx,
                      height: fourteenPx,
                    ),

                  ),
                ],
              ),
            ),
            // gapH10,
            // Expanded(
            //   child: ListView.builder(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),

            //     itemCount: 20, // Replace with actual data length
            //     itemBuilder: (BuildContext context, int index) {
            //       return DuaListTile();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

