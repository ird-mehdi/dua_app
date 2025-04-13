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
import 'dart:async'; // Import for Timer

class AllDuaPage extends StatefulWidget {
  const AllDuaPage({super.key});

  @override
  State<AllDuaPage> createState() => _AllDuaPageState();
}

class _AllDuaPageState extends State<AllDuaPage> {
  final AllDuasPresenter presenter = locate<AllDuasPresenter>();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      presenter.updateSearchQuery(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(eightPx),
          child: Column(
            children: [
              PresentableWidgetBuilder(
                presenter: presenter, // Listen to presenter for language state
                builder: () => CustomAppBar(
                  title: 'All Duas',
                  icon: AppImages.icCategory2,
                  titleSpacing: eightPx,
                  titleFontSize: eighteenPx,
                  actions: [
                    TextButton(
                      onPressed: () {
                        presenter.toggleLanguage();
                      },
                      // Update button text based on presenter state
                      child: Text(
                        presenter.currentUiState.selectedLanguage == 'bn'
                            ? 'EN' // Show EN to switch to English
                            : 'BN', // Show BN to switch to Bangla
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: eightPx),
                child: CustomSearchBar(
                  hintText: 'Search by dua\'s name',
                  onChanged: _onSearchChanged, // Use debounced handler
                ),
              ),
              Expanded(
                child: PresentableWidgetBuilder(
                  presenter: presenter,
                  builder: () {
                    final uiState = presenter.currentUiState;

                    // Handle overall loading state (initial fetch)
                    if (uiState.isLoading && uiState.duas.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Handle network/fetch errors shown via userMessage
                    if (uiState.userMessage != null &&
                        uiState.userMessage!.isNotEmpty &&
                        uiState.duas.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error_outline,
                                  size: 48, color: Colors.redAccent),
                              const SizedBox(height: 16),
                              Text(
                                uiState.userMessage!,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton.icon(
                                icon: const Icon(Icons.refresh),
                                label: const Text('Retry'),
                                onPressed: () => presenter.refresh(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    // Handle empty state (after loading, no results or filtered out)
                    // Check grouped data in presenter as UI depends on it
                    if (!uiState.isLoading &&
                        presenter.groupedListSections.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off,
                                size: 48, color: Colors.grey),
                            const SizedBox(height: 16),
                            Text(
                              uiState.searchQuery.isNotEmpty
                                  ? 'No duas found matching "${uiState.searchQuery}"'
                                  : 'No duas available',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      );
                    }

                    // Display the list and scrollbar
                    return Row(
                      children: [
                        Expanded(
                          child: DuaListItem(
                            presenter: presenter,
                            theme: theme,
                          ),
                        ),
                        AlphabetScrollBar(
                          presenter: presenter, // Pass presenter
                          letters: uiState.alphabetLetters,
                          // selectedLetter can be driven by presenter state
                          // Use currentDragLetter if dragging, otherwise selectedCharacter
                          selectedLetter: uiState.currentDragLetter ??
                              uiState.selectedCharacter ??
                              '',
                        ),
                      ],
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
