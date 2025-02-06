// ignore_for_file: deprecated_member_use

import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/prayer_time/ui/prayer_time_page.dart';
import 'package:dua/presentation/ruqyah_video/ui/video_play_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuickAccessMenu extends StatelessWidget {
  const QuickAccessMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.85, // Adjusted to prevent overflow
      ),
      itemCount: quickAccessItems.length,
      itemBuilder: (context, index) {
        return _buildQuickAccessItem(
          context: context,
          icon: quickAccessItems[index].icon,
          label: quickAccessItems[index].label,
          color: quickAccessItems[index].color,
          page: quickAccessItems[index].widget,
        );
      },
    );
  }

  Widget _buildQuickAccessItem({
    required String icon,
    required String label,
    required Color color,
    required BuildContext context,
    required Widget page,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            borderRadius: radius50, // Circular ripple effect
            onTap: () => context.navigatorPush(page),
            child: Container(
              padding: padding14, // Reduced padding
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: color),
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              child: SvgPicture.asset(
                icon,
                height: twentyFourPx,
                width: twentyFourPx,
                colorFilter: buildColorFilter(color),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0), // Reduced spacing
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.0, // Slightly reduced font size
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class QuickAccessItem {
  final String icon;
  final String label;
  final Color color;
  final Widget widget;

  const QuickAccessItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.widget,
  });
}

final List<QuickAccessItem> quickAccessItems = [
  QuickAccessItem(
    icon: AppImages.icTimer,
    label: 'Last Read',
    color: DuaColor.quickAccessColorLight1,
    widget: PrayerTimePage(),
  ),
  QuickAccessItem(
    icon: AppImages.icCup,
    label: 'Challanges',
    color: DuaColor.quickAccessColorLight2,
    widget: PrayerTimePage(),
  ),
  QuickAccessItem(
    icon: AppImages.icBolt,
    label: 'Self Ruqyah',
    color: DuaColor.quickAccessColorLight3,
    widget: PrayerTimePage(),
  ),
  QuickAccessItem(
    icon: AppImages.icBook,
    label: "Dua's Books",
    color: DuaColor.quickAccessColorLight4,
    widget: PrayerTimePage(),
  ),
  QuickAccessItem(
    icon: AppImages.icPerson,
    label: 'Dhikr',
    color: DuaColor.quickAccessColorLight5,
    widget: PrayerTimePage(),
  ),
  QuickAccessItem(
    icon: AppImages.icMosque,
    label: 'Prayer Time',
    color: DuaColor.quickAccessColorLight6,
    widget: PrayerTimePage(),
  ),
  QuickAccessItem(
    icon: AppImages.icApps,
    label: 'Other Apps',
    color: DuaColor.quickAccessColorLight7,
    widget: VideoPlayListPage(),
  ),
  QuickAccessItem(
    icon: AppImages.icLovely,
    label: 'Support Us',
    color: DuaColor.quickAccessColorLight8,
    widget: PrayerTimePage(),
  ),
];
