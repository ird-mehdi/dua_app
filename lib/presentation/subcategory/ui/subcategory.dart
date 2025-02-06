import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/presentation/all_dua/widgets/custom_search_bar.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/subcategory/widget/dua_list_tile.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dua Importance',
        titleSpacing: eightPx,
        titleFontSize: eighteenPx,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(eightPx),
          child: Column(
            children: [
              CustomSearchBar(
                hintText: 'Search by Subcategories Name',
              ),
              // gapH10,
              Padding(
                padding: EdgeInsets.only(top: eightPx, left: tenPx),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return DuaListTile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
