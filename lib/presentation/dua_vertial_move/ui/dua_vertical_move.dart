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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(sixteenPx),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            Container(
              height: eightyFivePx,
              padding: EdgeInsets.all(sixteenPx),
              decoration: BoxDecoration(
                color: context.color.shadeColor,
                borderRadius: BorderRadius.circular(twelvePx),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Section: ',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: context.color.primaryColor100,
                              fontSize: fifteenPx,
                            ),
                          ),
                          TextSpan(
                            text: 'The most important thing to ask Allah for',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: fifteenPx,
                              color: context.color.headingTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gapH16,

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return SingleDuaCard(theme: theme);
              },
            ),
          ],
        ),
      ),
    );
  }
}
