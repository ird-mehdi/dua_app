import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/scheduale/presenter/schedule_presenter.dart';
import 'package:dua/presentation/scheduale/widget/bottom_sheet_frame.dart';
import 'package:flutter/material.dart';

class EditScheduleBottomSheet extends StatelessWidget {
  const EditScheduleBottomSheet({
    super.key,
    required this.presenter,
  });

  final SchedulePresenter presenter;

  static Future<void> show({
    required BuildContext context,
    required SchedulePresenter presenter,
  }) async {
    if (!context.mounted) return;
    
    // Use microtask to avoid blocking the UI thread
    // This will schedule the bottom sheet to show after the current frame is rendered
    Future.microtask(() {
      final EditScheduleBottomSheet customBottomSheet =
          EditScheduleBottomSheet(presenter: presenter);
      if (context.mounted) {
        context.showBottomSheet(
          customBottomSheet,
          context,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BottomSheetFrame(theme: theme, headerTitle: 'Options');
  }
}
