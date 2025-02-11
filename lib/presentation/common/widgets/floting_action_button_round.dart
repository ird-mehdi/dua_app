import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class FlotingButtonRounded extends StatelessWidget {
  final String? icon;
  const FlotingButtonRounded({
    super.key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: context.color.primaryColor100,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(oneHundredPx),
        side: BorderSide(
          color: context.color.primaryColor20,
          width: 1.8,
        ),
      ),
      child: SvgImage(
        assetName: icon ?? SvgPath.icAdd,
        width: twentyFourPx,
        height: twentyFourPx,
      ),
    );
  }
}
