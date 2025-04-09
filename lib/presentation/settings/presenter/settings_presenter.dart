import 'package:dua/core/base/base_presenter.dart';
import 'package:get/get.dart';

import 'settings_ui_state.dart';

class SettingsPresenter extends BasePresenter<SettingsUiState> {
  // State as a reactive variable
  final Rx<SettingsUiState> _state = SettingsUiState.initial().obs;

  // Getter for the current state
  SettingsUiState get state => _state.value;

  @override
  Future<void> toggleLoading({required bool loading}) async {
    _state.value = state.copyWith(isLoading: loading);
  }

  @override
  Future<void> addUserMessage(String message) async {
    _state.value = state.copyWith(userMessage: message);
  }

  // Methods to update state properties
  void setShowArabic(bool value) {
    _state.value = state.copyWith(showArabic: value);
  }

  void setShowTranslation(bool value) {
    _state.value = state.copyWith(showTranslation: value);
  }

  void setShowReference(bool value) {
    _state.value = state.copyWith(showReference: value);
  }

  void setKeepScreenOn(bool value) {
    _state.value = state.copyWith(keepScreenOn: value);
  }

  void setArabicFontSize(double value) {
    _state.value = state.copyWith(arabicFontSize: value);
  }

  void setTranslationFontSize(double value) {
    _state.value = state.copyWith(translationFontSize: value);
  }

  void setSelectedAppearance(int value) {
    _state.value = state.copyWith(selectedAppearance: value);
  }
}
