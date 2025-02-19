import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:dua/presentation/plan_details/widget/single_plan_card.dart';
import 'package:flutter/material.dart';

class PlanDetailsPage extends StatelessWidget {
  const PlanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isListEmpty = false;
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Plan Details',
          titleFontSize: eighteenPx,
          paddingLeft: eightPx,
          onLeadingPressed: () => Navigator.pop(context),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgImage(
                assetName: AppImages.icSetting2,
                color: context.color.primaryColor100,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(sixteenPx),
          child: isListEmpty
              // ignore: dead_code
              ? SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgImage(
                          assetName: SvgPath.icLampSlash,
                          width: seventyEightPx,
                          height: seventyEightPx,
                        ),
                        gapH10,
                        Text(
                          'Doesn’t have any dua’s in this plan',
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontSize: twelvePx,
                            fontWeight: FontWeight.w400,
                            color: context.color.titleColor.withOpacityInt(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: planDetailsDuaCardModelList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SinglePlanCard(
                      theme: theme,
                      duaCardModel: planDetailsDuaCardModelList[index],
                    );
                  },
                ),
        ));
  }
}
