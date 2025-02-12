import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/scheduale/widget/edit_schedule_bottom_sheet.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/scheduale/presenter/schedule_presenter.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final ThemeData theme;
  final String scheduleName;
  final String totalDua;
  final String scheduleTime;
  final SchedulePresenter presenter;
  final VoidCallback onTap;

  const ScheduleCard({
    super.key,
    required this.theme,
    this.scheduleName = 'Schedule Name',
    this.totalDua = '3',
    this.scheduleTime = '9:30AM',
    required this.presenter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: tenPx),
        padding: EdgeInsets.all(sixteenPx),
        decoration: BoxDecoration(
          borderRadius: radius30,
          border: Border.all(
            color: context.color.primaryColor10,
            width: 1,
          ),
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: thirtyFourPx,
                    height: thirtyFourPx,
                    padding: padding5,
                    decoration: BoxDecoration(
                      color: context.color.iconShadeColor,
                      borderRadius: radius30,
                    ),
                    child: SvgImage(
                      assetName: AppImages.icDate,
                      color: context.color.primaryColor100,
                      width: twentyPx,
                      height: twentyPx,
                    ),
                  ),
                  gapW12,
                  Text(
                    scheduleName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: fifteenPx,
                      fontWeight: FontWeight.w500,
                      color: context.color.titleColor,
                    ),
                  ),
                  Spacer(),
                  SvgImage(
                    assetName: AppImages.icMore,
                    onTap: () => EditScheduleBottomSheet.show(
                      context: context,
                      presenter: presenter,
                    ),
                  ),
                ],
              ),
              gapH16,
              Text(
                'Total Dua: $totalDua',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: elevenPx,
                  color: context.color.subtitleColor,
                ),
              ),
              gapH8,
              Text(
                'Schedule time: $scheduleTime',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: elevenPx,
                  color: context.color.subtitleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
