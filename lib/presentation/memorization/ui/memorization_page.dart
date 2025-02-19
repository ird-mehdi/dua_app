import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:dua/presentation/common/widgets/floting_action_button_round.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/memorization/widget/memorization_plan_card.dart';
import 'package:dua/presentation/memorization/widget/memorize_model.dart';
import 'package:dua/presentation/plan_details/ui/plan_details_page.dart';
import 'package:flutter/material.dart';

class MemorizationPage extends StatelessWidget {
  const MemorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isListEmpty =
        false; // Changed to false to demonstrate the empty state handling
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Memorization',
        titleFontSize: eighteenPx,
        icon: AppImages.icCategory2,
        actions: [
          Padding(
            padding: EdgeInsets.all(tenPx),
            child: Row(
              children: [
                SvgImage(
                  assetName: SvgPath.icFolderFavorate,
                ),
                gapW20,
                SvgImage(
                  assetName: SvgPath.icLogin,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FlotingButtonRounded(
        paddingBottom: 24,
      ),
      body: Padding(
        padding: EdgeInsets.all(sixteenPx),
        child: Column(
          children: [
            CustomSearchBar(
              hintText: 'Search by Plan',
            ),
            gapH16,
            Expanded(
              child: isListEmpty
                  // ignore: dead_code
                  ? Center(
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
                            'No memorization found',
                            style: theme.textTheme.displayMedium?.copyWith(
                              fontSize: twelvePx,
                              fontWeight: FontWeight.w400,
                              color:
                                  context.color.titleColor.withOpacityInt(0.6),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: getMemorizeModel.length,
                      itemBuilder: (context, index) {
                        final MemorizeModel memorizeModel =
                            getMemorizeModel[index];
                        return MemorizationPlanCard(
                          onTap: () => context.navigatorPush(PlanDetailsPage()),
                          memorizeModel: memorizeModel,
                          theme: theme,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
