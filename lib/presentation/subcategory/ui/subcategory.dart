import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/subcategory/presenter/sub_category_presenter.dart';
import 'package:dua/presentation/subcategory/widget/dua_list_tile.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  final int categoryId;

  const SubCategory({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final SubCategoryPresenter presenter = locate<SubCategoryPresenter>();

    // Fetch subcategories based on categoryId

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dua Importance',
        titleSpacing: eightPx,
        titleFontSize: eighteenPx,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: PresentableWidgetBuilder(
          presenter: presenter,
          builder: () {
            final subcategories = presenter
                    .currentUiState.subcategoryNamesByCategoryId?[categoryId] ??
                [];
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(sixteenPx),
                child: Column(
                  children: [
                    CustomSearchBar(
                      hintText: 'Search by Subcategories Name',
                      onChanged: (value) {
                        presenter.searchSubcategories(value);
                      },
                    ),
                    gapH10,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: subcategories.length,
                      itemBuilder: (context, index) {
                        final subcategoryName = subcategories[index];
                        return subcategoryName.isEmpty
                            ? CircularProgressIndicator()
                            : DuaListTile(
                                index: index,
                                presenter: presenter,
                                title: subcategoryName,
                                totalDuas: presenter
                                    .getDuaCountForSubcategory(subcategoryName),
                                subcategories: presenter
                                    .getNestedSubcategories(subcategoryName),
                              );
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
