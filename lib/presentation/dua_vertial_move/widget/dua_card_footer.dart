import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class DuaCardFooter extends StatelessWidget {
  const DuaCardFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: eighteenPx),
      child: Row(
        children: [
          gapW15,
          SvgImage(
            assetName: AppImages.icBookmark,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
          ),
          const Spacer(),
          SvgImage(
            assetName: AppImages.icLampCharge,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
          ),
          const Spacer(),
          SvgImage(
            assetName: AppImages.icPlayNoneBg,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
          ),
          const Spacer(),
          SvgImage(
            assetName: AppImages.icCalendar,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
          ),
          const Spacer(),
          SvgImage(
            assetName: AppImages.icMore,
            color: context.color.primaryColor70,
            width: twentyFourPx,
            height: twentyFourPx,
          ),
          gapW12,
        ],
      ),
    );
  }
}
