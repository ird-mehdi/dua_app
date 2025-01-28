import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimestampCard extends StatelessWidget {
  final String leftTime;
  final String rightTime;
  final bool notification;
  final bool rightNotification;

  const TimestampCard({
    super.key,
    required this.leftTime,
    required this.rightTime,
    required this.notification,
    required this.rightNotification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DuaColor.shadeColorLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTimeWithIcon(
            title: 'Seheri',
            time: leftTime,
            hasNotification: notification,
            alignment: MainAxisAlignment.start,
          ),
          _buildTimeWithIcon(
            title: 'Ifter',
            time: rightTime,
            hasNotification: rightNotification,
            alignment: MainAxisAlignment.end,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeWithIcon({
    required String title,
    required String time,
    required bool hasNotification,
    required MainAxisAlignment alignment,
  }) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Container(
          margin: EdgeInsets.only(right: sixteenPx),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: DuaColor.iconShadeColorLight,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            notification ? AppImages.icNotification : AppImages.icNotification,
            width: twentyFourPx,
            height: twentyFourPx,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: twelvePx,
                fontWeight: FontWeight.w500,
                color: DuaColor.titleTextColorLight,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: eighteenPx,
                fontWeight: FontWeight.w800,
                color: DuaColor.titleTextColorLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
