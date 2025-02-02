import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PrayerTime1stCard extends StatelessWidget {
  const PrayerTime1stCard({
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
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: eightPx, vertical: fourPx),
                    decoration: BoxDecoration(
                      color: context.color.primaryColor10,
                      borderRadius: BorderRadius.circular(thirtyPx),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: twelvePx, vertical: sixPx),
                      child: Text(
                        'Now',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: tenPx,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: eightPx),
                  Text(
                    'DHUHR',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: twentyFourPx,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Dhaka, Bangladesh',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: twelvePx,
                    ),
                  ),
                  SizedBox(
                    height: twentyFivePx,
                  ),
                  Text(
                    '11 Jumada Al-Akhirah, 1441',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: fourteenPx,
                      color: context.color.titleHeadingColorLight,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: thirtyPx,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 125,
                        height: 125,
                        child: CircularProgressIndicator(
                          value: 0.51, // Progress value
                          strokeWidth: 6,
                          backgroundColor: DuaColor.primaryColorLight01,
                          valueColor: AlwaysStoppedAnimation<Color>(DuaColor
                              .primaryColorLight01), // Color of the progress
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '03:15:00',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontSize: twentyTwoPx,
                            ),
                          ),
                          CustomText(
                            text: 'Remaining Duhr',
                            fontSize: 10,
                            theme: theme,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: eightPx,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
