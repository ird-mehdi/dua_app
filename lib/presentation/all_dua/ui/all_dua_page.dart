import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:dua/presentation/all_dua/widgets/dua_list_item.dart';
import 'package:dua/presentation/all_dua/widgets/alphabet_scroll_bar.dart';
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
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          physics: const ClampingScrollPhysics(),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(eightPx),
            child: Column(
              children: [
                CustomAppBar(
                  title: 'All Duas',
                  icon: AppImages.icCategory2,
                  titleSpacing: eightPx,
                  titleFontSize: eighteenPx,
                  actions: [
                    TextButton(
                      onPressed: () {
                        presenter.toggleLanguage();
                      },
                      child: Text(presenter.uiState.value.selectedLanguage == 'bn' ? 'En' : 'Ba'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: eightPx),
                  child: CustomSearchBar(
                    hintText: 'Search by dua\'s name',
                    onChanged: _debounce((query) {
                      presenter.updateSearchQuery(query);
                    }),
                  ),
                ),
                Expanded(
                  child: PresentableWidgetBuilder(
                    presenter: presenter,
                    builder: () {
                      if (presenter.uiState.value.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final duas = presenter.uiState.value.duas ?? [];
                      if (duas.isEmpty) {
                        return const Center(child: Text('No duas found'));
                      }

                      return RepaintBoundary(
                        child: Row(
                          children: [
                            Expanded(
                              child: DuaListItem(
                                number: 1,
                                text: duas[0].name,
                                theme: theme,
                              ),
                            ),
                            RepaintBoundary(
                              child: AlphabetScrollBar(
                                letters: presenter.uiState.value.alphabetLetters ?? [],
                                selectedLetter: presenter.uiState.value.selectedCharacter ?? 'A',
                                onLetterSelected: (letter) {
                                  presenter.selectCharacter(letter);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Function(String) _debounce(Function(String) callback, [Duration delay = const Duration(milliseconds: 300)]) {
    DateTime? lastCallTime;
    
    return (String query) {
      final now = DateTime.now();
      if (lastCallTime == null || now.difference(lastCallTime!) > delay) {
        callback(query);
        lastCallTime = now;
      }
    };
  }
}
