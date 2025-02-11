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
        paddingBottom: sixtyPx,
      ),
      body: Padding(
        padding: EdgeInsets.all(fourPx),
        child: Column(
          children: [
            CustomSearchBar(
              hintText: 'Search by Plan',
            ),
            Expanded(
              child: isListEmpty
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
                      padding: EdgeInsets.all(sixteenPx),
                      itemCount: MemorizeModel.getMemorizeModel().length,
                      itemBuilder: (context, index) {
                        return MemorizationPlanCard(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlanDetailsPage(),
                            ),
                          ),
                          title: MemorizeModel.getMemorizeModel()[index].title,
                          daysLeft:
                              MemorizeModel.getMemorizeModel()[index].daysLeft,
                          completedTasks:
                              MemorizeModel.getMemorizeModel()[index]
                                  .completedTasks,
                          totalTasks: MemorizeModel.getMemorizeModel()[index]
                              .totalTasks,
                          remainingDays: MemorizeModel.getMemorizeModel()[index]
                              .remainingDays,
                          endDate:
                              MemorizeModel.getMemorizeModel()[index].endDate,
                          progress:
                              MemorizeModel.getMemorizeModel()[index].progress,
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
