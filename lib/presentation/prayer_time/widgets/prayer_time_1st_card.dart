import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
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
                    padding: EdgeInsets.symmetric(
                        horizontal: eightPx, vertical: fourPx),
                    decoration: BoxDecoration(
                      color: DuaColor.primaryColorLight01,
                      borderRadius: BorderRadius.circular(tenPx),
                    ),
                    child: CustomText(
                      text: 'Now',
                      theme: theme,
                    ),
                  ),
                  SizedBox(height: eightPx),
                  CustomText(
                    text: 'DHUHR',
                    fontSize: twentyFourPx,
                    fontWeight: FontWeight.w800,
                    theme: theme,
                  ),
                  CustomText(
                    text: 'Dhaka, Bangladesh',
                    fontSize: twelvePx,
                    theme: theme,
                  ),
                  SizedBox(
                    height: twentyPx,
                  ),
                  CustomText(
                    text: '11 Jumada Al-Akhirah, 1441',
                    fontSize: twelvePx,
                    color: Colors.black54,
                    theme: theme,
                  ),
                  CustomText(
                    text: '17 July, 2024',
                    fontSize: twelvePx,
                    theme: theme,
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
                          CustomText(
                            text: '03:15:00',
                            fontSize: 22,
                            theme: theme,
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
