import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:dua/presentation/all_dua/widgets/dua_list_item.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/custom_search_bar.dart';

class AllDuaPage extends StatelessWidget {
  const AllDuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    locate<AllDuaPresenter>();

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
            Expanded(
              child: GetBuilder<AllDuaPresenter>(
                builder: (controller) {
                  return DuaListItem(
                    number: 1,
                    text: controller.duaItems.value['A']?[0] ?? '',
                    theme: theme,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
