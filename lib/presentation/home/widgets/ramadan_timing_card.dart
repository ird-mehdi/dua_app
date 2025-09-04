import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RamadanTimingCard extends StatelessWidget {
  final String leftTime;
  final String rightTime;
  final bool notification;

  const RamadanTimingCard({
    super.key,
    required this.leftTime,
    required this.rightTime,
    required this.notification,
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
            context: context,
          ),
          _buildTimeWithIcon(
            title: 'Ifter',
            time: rightTime,
            hasNotification: notification,
            alignment: MainAxisAlignment.end,
            context: context,
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
    required BuildContext context,
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
                color: context.color.headingTextColor,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: eighteenPx,
                fontWeight: FontWeight.w600,
                color: context.color.headingTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
