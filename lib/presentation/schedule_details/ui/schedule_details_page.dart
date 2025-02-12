import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/dua_collection_preview.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class ScheduleDetailsPage extends StatelessWidget {
  const ScheduleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Schedule Name',
        titleFontSize: eighteenPx,
        titleSpacing: tenPx,
        paddingLeft: 0,
        paddingRight: twentyPx,
        onLeadingPressed: () => Navigator.pop(context),
        actions: [
          SvgImage(
            assetName: AppImages.icSetting2,
            color: context.color.primaryColor100,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(eighteenPx),
        child: Column(
          children: [
            DuaCollectionPreview(
              theme: theme,
              title: 'Schedule Name',
              subtitle: 'Total Duas: 3',
            ),
          ],
        ),
      ),
    );
  }
}
