import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final ThemeData theme;
  final String scheduleName;
  final String totalDua;
  final String scheduleTime;

  const ScheduleCard({
    super.key,
    required this.theme,
    this.scheduleName = 'Schedule Name',
    this.totalDua = '3',
    this.scheduleTime = '9:30AM',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: tenPx),
      padding: EdgeInsets.all(sixteenPx),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(twentyPx),
        border: Border.all(
          color: context.color.primaryColor10,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: thirtyFourPx,
                          height: thirtyFourPx,
                          padding: EdgeInsets.all(fivePx),
                          decoration: BoxDecoration(
                            color: context.color.iconShadeColor,
                            borderRadius: BorderRadius.circular(thirtyPx),
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
                      ],
                    ),
                    SvgImage(
                      assetName: AppImages.icMore,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: context.color.backgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Schedule Options',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('Edit Schedule'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete Schedule'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
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
        ],
      ),
    );
  }
}
