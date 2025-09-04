import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/presentation/scheduale/widget/edit_schedule_bottom_sheet.dart';
import 'package:dua/presentation/scheduale/presenter/schedule_ui_state.dart';
import 'package:flutter/material.dart';

class SchedulePresenter extends BasePresenter<ScheduleUiState> {
  final Obs<ScheduleUiState> uiState = Obs(ScheduleUiState.empty());
  ScheduleUiState get currentUiState => uiState.value;

  // ... existing code ...

  void showJuristicMethodBottomSheet(BuildContext context) {
    EditScheduleBottomSheet.show(
      context: context,
      presenter: this,
    );
  }

  @override
  Future<void> addUserMessage(String message) {
    throw UnimplementedError();
  }

  @override
  Future<void> toggleLoading({required bool loading}) {
    throw UnimplementedError();
  }
}
