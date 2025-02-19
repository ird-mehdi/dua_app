import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/memorization/widget/memorize_model.dart';
import 'package:dua/presentation/prayer_time/widgets/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class MemorizationPlanCard extends StatelessWidget {
  final Function() onTap;
  final MemorizeModel memorizeModel;
  final ThemeData theme;
  final double? containerWidth;
  final double? containerHeight;
  final double? containerBarWidth;
  final double? seekBarWidth;
  final double? seekBarHeight;

  const MemorizationPlanCard({
    super.key,
    required this.theme,
    required this.onTap,
    required this.memorizeModel,
    this.containerWidth,
    this.containerHeight,
    this.containerBarWidth,
    this.seekBarWidth,
    this.seekBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: tenPx),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.only(bottom: 16),

          padding: EdgeInsets.all(twelvePx),
          decoration: BoxDecoration(
            color: context.color.btnTextColor,
            borderRadius: BorderRadius.circular(fourteenPx),
            border: Border.all(color: context.color.primaryColor10),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MemorizationPlanCardHeader(
                  title: memorizeModel.title, theme: theme),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${memorizeModel.daysLeft} ',
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontSize: twentyTwoPx,
                                      fontWeight: FontWeight.w700,
                                      color: context.color.titleColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Days Left',
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: context.color.subtitleColor,
                                      fontSize: thirteenPx,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        gapH12,
                        MemorizationPlanCardRow(
                          title: 'Turned Of',
                          icon: SvgPath.icVolumeTurnedOf,
                          theme: theme,
                        ),
                        gapH8,
                        MemorizationPlanCardRow(
                          title:
                              'Completed: ${memorizeModel.completedTasks}/${memorizeModel.totalTasks}',
                          icon: SvgPath.icAyah,
                          theme: theme,
                        ),
                        gapH8,
                        MemorizationPlanCardRow(
                          title: 'Remaining: ${memorizeModel.remainingDays}',
                          icon: SvgPath.icTeacher,
                          theme: theme,
                        ),
                        gapH8,
                        MemorizationPlanCardRow(
                          title: 'End Date: ${memorizeModel.endDate}',
                          icon: SvgPath.icClock,
                          theme: theme,
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: containerWidth ?? 26.percentWidth,
                        height: containerHeight ?? 26.percentWidth,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.color.primaryColor10,
                            width: containerBarWidth ?? eightPx,
                          ),
                        ),
                      ),
                      CircularSeekBar(
                        progress: memorizeModel.progress,
                        width: seekBarWidth ?? 24.percentWidth,
                        height: seekBarHeight ?? 24.percentWidth,
                        minProgress: 0,
                        maxProgress: 1,
                        barWidth: 8,
                        progressColor: context.color.primaryColor100,
                        trackColor: Colors.transparent,
                        strokeCap: StrokeCap.round,
                        dashGap: 0,
                        dashWidth: 8,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${(memorizeModel.progress * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: sixteenPx,
                                  fontWeight: FontWeight.w500,
                                  color: context.color.titleColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Completed',
                                style: TextStyle(
                                  fontSize: elevenPx,
                                  fontWeight: FontWeight.w400,
                                  color: context.color.subtitleColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MemorizationPlanCardRow extends StatelessWidget {
  final String title;
  final String icon;
  final ThemeData theme;
  const MemorizationPlanCardRow({
    super.key,
    required this.title,
    required this.icon,
    required this.theme,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgImage(
          assetName: icon,
          width: sixteenPx,
          height: sixteenPx,
          color: context.color.primaryColor70,
        ),
        gapW8,
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: context.color.subtitleColor,
            fontSize: twelvePx,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class MemorizationPlanCardHeader extends StatelessWidget {
  const MemorizationPlanCardHeader({
    super.key,
    required this.title,
    required this.theme,
  });

  final String title;
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: fifteenPx,
            fontWeight: FontWeight.w500,
            color: context.color.titleColor,
          ),
        ),
        SvgImage(
          assetName: SvgPath.icMoreVertical,
          height: eighteenPx,
          width: eighteenPx,
        ),
      ],
    );
  }
}
