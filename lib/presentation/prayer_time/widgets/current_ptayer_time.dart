import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/prayer_time/widgets/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class CurrentPrayerTimeCard extends StatelessWidget {
  const CurrentPrayerTimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: fortySixPx,
                    decoration: BoxDecoration(
                      color: context.color.primaryColor110.withOpacityInt(0.1),
                      borderRadius: BorderRadius.circular(thirtyPx),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: twelvePx, vertical: sixPx),
                      child: Text(
                        'Now',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: ninePx,
                          fontWeight: FontWeight.w400,
                          color: context.color.subtitleColor,
                        ),
                      ),
                    ),
                  ),
                  gapH8,
                  Text(
                    'DHUHR',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: twentyFourPx,
                      fontWeight: FontWeight.w700,
                      color: context.color.titleColor,
                    ),
                  ),
                  Text(
                    'Dhaka, Bangladesh',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: elevenPx,
                      fontWeight: FontWeight.w400,
                      color: context.color.subtitleColor,
                    ),
                  ),
                  gapH25,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '11 Jumada Al-Akhirah, 1441',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: thirteenPx,
                          fontWeight: FontWeight.w600,
                          color: context.color.titleHeadingColorLight,
                        ),
                      ),
                      Text(
                        '17 July, 2024',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: elevenPx,
                          fontWeight: FontWeight.w400,
                          color: context.color.subtitleColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CircularSeekBar(
              width: 134,
              height: 134,
              progress: 51,
              barWidth: 6,
              trackColor: context.color.primaryColor10,
              progressColor: context.color.primaryColor400,
              strokeCap: StrokeCap.round,
              outerThumbRadius: 10, // বাইরের থাম্বের ব্যাসার্ধ
              outerThumbStrokeWidth: 6, // বাইরের থাম্বের স্ট্রোক পুরুত্ব

              outerThumbColor: Colors.white,

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '03:15:00',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Remaining Duhr',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
