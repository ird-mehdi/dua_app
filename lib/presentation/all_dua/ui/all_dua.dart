import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/all_dua/widgets/dua_sorting_bottom_sheet.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  return DuaListTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DuaListTile extends StatelessWidget {
  const DuaListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ExpansionTile(
      tilePadding:
          EdgeInsets.symmetric(horizontal: tenPx, vertical: eighteenPx),
      backgroundColor: context.color.primaryColor10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(thirtyPx),
      ),
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFE8F5E9),
        child: Text(
          '2',
          style: TextStyle(
            color: Colors.green[500],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      showTrailingIcon: false,
      title: Text(
        'The most important thing to ask Allah for',
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: fifteenPx,
        ),
      ),
      subtitle: Text(
        'Total 15 Duas',
        style: theme.textTheme.titleSmall?.copyWith(
          fontSize: tenPx,
          color: context.color.subtitleColor,
        ),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.check, color: Colors.green),
                ),
                title: const Text('Sincerity'),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.check, color: Colors.green),
                ),
                title: const Text('Eating Lawful Food'),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.check, color: Colors.green),
                ),
                title: const Text("The Consciousness of One's Heart"),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.check, color: Colors.green),
                ),
                title: const Text('Supplicate for Good Only'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
