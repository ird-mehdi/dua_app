import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/subcategory/presenter/sub_category_presenter.dart';
import 'package:dua/presentation/subcategory/widget/dua_list_tile.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  final SubCategoryPresenter presenter = locate<SubCategoryPresenter>();

  SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return DuaListTile(
                      index: index,
                      presenter: presenter,
                    );
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
