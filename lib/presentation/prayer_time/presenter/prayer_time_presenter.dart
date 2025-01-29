import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/prayer_time/presenter/prayer_time_ui_state.dart';

import 'package:flutter/widgets.dart';

class PrayerTimePresenter extends BasePresenter<PrayerTimeUiState> {
  PrayerTimePresenter();
  final Obs<PrayerTimeUiState> uiState = Obs(PrayerTimeUiState.empty());

  PrayerTimeUiState get currentUiState => uiState.value;

  void incrementCount() {
    uiState.value = currentUiState.copyWith(count: currentUiState.count + 1);
  }

  void toggleShowArabic() {
    uiState.value =
        currentUiState.copyWith(showArabic: !currentUiState.showArabic);
  }

  void toggleShowTranslation() {
    uiState.value = currentUiState.copyWith(
        showTranslation: !currentUiState.showTranslation);
  }

  void toggleShowReference() {
    uiState.value =
        currentUiState.copyWith(showReference: !currentUiState.showReference);
  }

  void updateTranslationFontSize(double value) {
    uiState.value = currentUiState.copyWith(translationFontSize: value);
  }

  void updateArabicFontSize(double value) {
    uiState.value = currentUiState.copyWith(arabicFontSize: value);
  }

  void updateSelectedFont(String value) {
    uiState.value = currentUiState.copyWith(selectedFont: value);
  }

  void decrementCount() {
    uiState.value = currentUiState.copyWith(count: currentUiState.count - 1);
  }

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
