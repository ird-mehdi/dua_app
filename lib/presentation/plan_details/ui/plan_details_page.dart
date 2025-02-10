import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class PlanDetailsPage extends StatelessWidget {
  const PlanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Plan Details',
        titleFontSize: eighteenPx,
        onLeadingPressed: () => Navigator.pop(context),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgImage(
              assetName: AppImages.icSetting2,
              color: context.color.primaryColor100,
              width: sixteenPx,
              height: sixteenPx,
            ),
          ),
        ],
      ),
    );
  }
}
