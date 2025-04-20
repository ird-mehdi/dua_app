import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/presentation/common/widgets/dua_category_card.dart';
import 'package:dua/presentation/home/presenter/home_presenter.dart';
import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  const TabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePresenter presenter = locate<HomePresenter>();

    return PresentableWidgetBuilder(
        presenter: presenter,
        builder: () {
          return Padding(
            padding: padding16,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: presenter.currentUiState.categories?.length ?? 0,
              itemBuilder: (context, index) {
                final categoryId =
                    presenter.currentUiState.categories?[index].id ?? 0;
                final subcategoryCount = presenter.currentUiState
                        .subcategoryNamesByCategoryId?[categoryId]?.length ??
                    0;
                final subcategoryText = subcategoryCount == 1
                    ? '1 Subcategory'
                    : '$subcategoryCount Subcategories';

                return Padding(
                  padding: EdgeInsets.only(
                      bottom: index <
                              (presenter.currentUiState.categories?.length ??
                                      0) -
                                  1
                          ? 12
                          : 0),
                  child: DuaCategoryCard(
                    categoryId: categoryId,
                    categoryName:
                        presenter.currentUiState.categories?[index].name ?? '',
                    categoryIcon: AppImages.icPrayer,
                    categorySubtitle: subcategoryText,
                    categoryDuaCount: 50,
                    categoryBgColor: const Color(0x1AE08E15),
                  ),
                );
              },
            ),
          );
        });
  }
}
