import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:dua/presentation/common/widgets/floting_action_button_round.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/scheduale/presenter/schedule_presenter.dart';
import 'package:dua/presentation/scheduale/widget/schedule_card.dart';
import 'package:dua/presentation/schedule_details/ui/schedule_details_page.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({super.key});
  final SchedulePresenter _presenter = locate<SchedulePresenter>();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Schedule',
        titleSpacing: fourPx,
        paddingLeft: tenPx,
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
              child: ListView.builder(
                itemCount:
                    2, // Temporary count, replace with actual data length
                itemBuilder: (context, index) {
                  return ScheduleCard(
                    presenter: _presenter,
                    theme: theme,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScheduleDetailsPage(),
                      ),
                    ),
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
