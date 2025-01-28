import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/presentation/prayer_time/ui/prayer_time_page.dart';
import 'package:flutter/material.dart';

class PrayerTime1stCard extends StatelessWidget {
  const PrayerTime1stCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
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
                        color: DuaColor.cardColorLight,
                        borderRadius: BorderRadius.circular(tenPx),
                      ),
                      child: CustomText(
                        text: 'Now',
                      ),
                    ),
                    SizedBox(height: eightPx),
                    CustomText(
                      text: 'DHUHR',
                      fontSize: twentyFourPx,
                      fontWeight: FontWeight.w800,
                    ),
                    CustomText(
                      text: 'Dhaka, Bangladesh',
                      fontSize: twelvePx,
                    ),
                    SizedBox(
                      height: twentyPx,
                    ),
                    CustomText(
                      text: '11 Jumada Al-Akhirah, 1441',
                      fontSize: twelvePx,
                      color: Colors.black54,
                    ),
                    CustomText(
                      text: '17 July, 2024',
                      fontSize: twelvePx,
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
                        Container(
                          width: 125,
                          height: 125,
                          child: CircularProgressIndicator(
                            value: 0.51, // Progress value
                            strokeWidth: 6,
                            backgroundColor: DuaColor.cardColorLight,
                            valueColor: AlwaysStoppedAnimation<Color>(DuaColor
                                .progressColorLight), // Color of the progress
                          ),
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: '03:15:00',
                              fontSize: 22,
                            ),
                            CustomText(
                              text: 'Remaining Duhr',
                              fontSize: 10,
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
        ),
      ],
    );
  }
}
