import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class DuaCardFooter extends StatelessWidget {
  const DuaCardFooter({
    super.key,
    this.onBookmarkTap,
    this.onLampTap,
    this.onPlayTap,
    this.onCalendarTap,
    this.onMoreTap,
  });

  final VoidCallback? onBookmarkTap;
  final VoidCallback? onLampTap;
  final VoidCallback? onPlayTap;
  final VoidCallback? onCalendarTap;
  final VoidCallback? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: twentySevenPx, horizontal: eightPx),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgImage(
            assetName: AppImages.icBookmark,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
            onTap: onBookmarkTap,
          ),
          SvgImage(
            assetName: AppImages.icLampCharge,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
            onTap: onLampTap,
          ),
          SvgImage(
            assetName: AppImages.icPlayNoneBg,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
            onTap: onPlayTap,
          ),
          SvgImage(
            assetName: AppImages.icCalendar,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
            onTap: onCalendarTap,
          ),
          SvgImage(
            assetName: AppImages.icMore,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
            onTap: onMoreTap,
          ),
        ],
      ),
    );
  }
}
