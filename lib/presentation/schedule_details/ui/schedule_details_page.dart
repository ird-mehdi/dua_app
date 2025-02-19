import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:dua/presentation/schedule_details/widget/schedule_details_dua_list.dart';
import 'package:flutter/material.dart';

class ScheduleDetailsPage extends StatelessWidget {
  const ScheduleDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DuaCardModel duaCardModel = DuaCardModel();
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Schedule Name',
        titleFontSize: eighteenPx,
        titleSpacing: tenPx,
        paddingLeft: eightPx,
        paddingRight: twentyFivePx,
        onLeadingPressed: () => Navigator.pop(context),
        actions: [
          SvgImage(
            assetName: AppImages.icSetting2,
            color: context.color.primaryColor100,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sixteenPx),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: scheduleDetailsDuaCardModelList.length,
            itemBuilder: (context, index) {
              return ScheduleDetailsDuaList(
                theme: theme,
                duaCardModel: duaCardModel,
              );
            },
          ),
        ),
      ),
    );
  }
}
