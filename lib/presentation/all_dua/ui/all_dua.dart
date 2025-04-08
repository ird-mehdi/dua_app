import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:dua/presentation/all_dua/widgets/dua_list_item.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_search_bar.dart';

class AllDuaPage extends StatelessWidget {
  const AllDuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AllDuasPresenter presenter = locate<AllDuasPresenter>();

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
              child: PresentableWidgetBuilder(
                presenter: presenter,
                builder: () {
                  final duas = presenter.uiState.value.duas ?? [];
                  if (duas.isEmpty) {
                    return const Center(child: Text('No duas found'));
                  }
                  return DuaListItem(
                    number: 1,
                    text: duas[0].name,
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
