import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/scheduale/presenter/schedule_presenter.dart';
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

    EditScheduleBottomSheet customBottomSheet =
        EditScheduleBottomSheet(presenter: presenter);
    await context.showBottomSheet(
      customBottomSheet,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: context.color.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Schedule Options',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: context.color.titleColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.edit, color: context.color.titleColor),
                      Text(
                        'Edit Memorization',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: context.color.titleColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.delete_outline, color: Colors.red),
                      Text(
                        'Delete',
                        style: context.textStyle.videoTitle!.copyWith(
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add your bottom sheet content here
          ],
        ),
      ),
    );
  }
}
