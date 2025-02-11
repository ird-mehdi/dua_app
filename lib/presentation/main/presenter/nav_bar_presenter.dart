import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/all_dua/ui/all_dua.dart';
import 'package:dua/presentation/home/ui/home_page.dart';
import 'package:dua/presentation/main/presenter/nav_bar_ui_state.dart';
import 'package:dua/presentation/memorization/ui/memorization_page.dart';
import 'package:dua/presentation/scheduale/ui/schedule_page.dart';

import 'package:flutter/widgets.dart';

class NavBarPresenter extends BasePresenter<NavBarUiState> {
  NavBarPresenter();
  final Obs<NavBarUiState> uiState = Obs(NavBarUiState.empty());

  NavBarUiState get currentUiState => uiState.value;

  // List of widget pages corresponding to each bottom navigation item
  final List<Widget> pages = [
    HomePage(),
    AllDuaPage(),
    HomePage(),
    SchedulePage(),
    MemorizationPage(),
  ];

  // Update selected index
  void onItemTapped(int index) {
    uiState.value = currentUiState.copyWith(selectedIndex: index);
  }

  @override
  Future<void> addUserMessage(String message) {
    return showMessage(message: message, context: currentUiState.context);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
