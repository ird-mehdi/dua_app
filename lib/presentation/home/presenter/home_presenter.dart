import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/home/presenter/home_ui_state.dart';

import 'package:flutter/widgets.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  HomePresenter();
  final Obs<HomeUiState> uiState = Obs(HomeUiState.empty());

  HomeUiState get currentUiState => uiState.value;

  updateContext(BuildContext context) {
    uiState.value = currentUiState.copyWith(context: context);
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
