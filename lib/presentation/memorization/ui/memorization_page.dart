import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:dua/presentation/common/widgets/floting_action_button_round.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/memorization/widget/memorization_plan_card.dart';
import 'package:flutter/material.dart';

class MemorizationPage extends StatelessWidget {
  const MemorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FlotingButtonRounded(),
      body: Padding(
        padding: EdgeInsets.all(fourPx),
        child: Column(
          children: [
            CustomSearchBar(
              hintText: 'Search by Plan',
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(sixteenPx),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MemorizationPlanCard(
                    title: 'My 50 Day Plan',
                    daysLeft: 21,
                    completedTasks: 1,
                    totalTasks: 3,
                    remainingDays: 8,
                    endDate: 'Jan 14, 2025',
                    progress: 0.75,
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
