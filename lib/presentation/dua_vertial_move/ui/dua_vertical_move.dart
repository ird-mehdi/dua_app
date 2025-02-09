import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/dua_vertial_move/widget/single_dua_card.dart';
import 'package:flutter/material.dart';

class DuaVerticalMove extends StatelessWidget {
  const DuaVerticalMove({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Dua Importance',
        titleFontSize: eighteenPx,
        // icon: ,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: twentyFivePx),
            child: Container(
                width: twentyFourPx,
                height: twentyFourPx,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgImage(
                    assetName: AppImages.icSetting2,
                    color: context.color.primaryColor100)),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: fiftySixPx,
        ),
        child: Container(
          width: seventyTwoPx,
          height: fiftySixPx,
          decoration: BoxDecoration(
            color: context.color.primaryColor100,
            borderRadius: BorderRadius.circular(fortyPx),
          ),
          child: Center(child: SvgImage(assetName: AppImages.icPlay)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(sixteenPx),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            SingleDuaCard(
              theme: theme,
            ),
            gapH10,
            SingleDuaCard(
              theme: theme,
              isFirst: false,
              isArabicTopTitleShown: true,
            ),
            gapH10,
            SingleDuaCard(
              theme: theme,
              isReferenceShown: false,
              isFooterShown: false,
            ),
            gapH10,
            SingleDuaCard(
              theme: theme,
              isDuaNumberShown: false,
              isFirst: false,
            ),
            gapH10,
            SingleDuaCard(
              theme: theme,
              isArabicTopTitleShown: true,
              isLast: false,
            ),
          ],
        ),
      ),
    );
  }
}
