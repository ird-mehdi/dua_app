import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/presentation/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrayerTimeListItem extends StatelessWidget {
  final String name;
  final String time;
  final bool notification;
  final String? offset;
  final String? leadingIcon;
  final FontWeight? fontWeight;

  const PrayerTimeListItem({
    super.key,
    required this.name,
    required this.time,
    required this.notification,
    this.offset,
    this.leadingIcon,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(14),
          // color: Colors.black.withOpacityInt(5),
          ),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                      fontSize: fourteenPx,
                      fontWeight: fontWeight ?? FontWeight.normal,
                      theme: theme,
                    ),
                    if (offset != null)
                      CustomText(
                        text: offset!,
                        fontSize: 14.0,
                        color: Colors.grey[600],
                        theme: theme,
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
                  theme: theme,
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
