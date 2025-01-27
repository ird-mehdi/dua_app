import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/last_read/presenter/last_read_ui_state.dart';
import 'package:flutter/widgets.dart';

class LastReadPresenter extends BasePresenter<LastReadUiState> {
  LastReadPresenter();
  final Obs<LastReadUiState> uiState = Obs(LastReadUiState.empty());

  LastReadUiState get currentUiState => uiState.value;

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
