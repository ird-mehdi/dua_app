
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/presentation/prayer_time/ui/prayer_time_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrayerTime2ndCard extends StatelessWidget {
  final String name;
  final String time;
  final bool notification;
  final String? offset;
  final String? leadingIcon;

  const PrayerTime2ndCard({
    super.key,
    required this.name,
    required this.time,
    required this.notification,
    this.offset,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  leadingIcon ?? SvgPath.prayertimeIconFazr,
                  width: eighteenPx,
                  height: eighteenPx,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: name,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    if (offset != null)
                      CustomText(
                        text: offset!,
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CustomText(
                  text: time,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(width: 8.0),
                SvgPicture.asset(
                  notification ? SvgPath.volumeHhigh : SvgPath.volumeSlash,
                  width: eighteenPx,
                  height: eighteenPx,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
