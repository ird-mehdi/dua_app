import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class FlotingButtonRounded extends StatelessWidget {
  final String? icon;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final double? width;
  final double? height;
  final Object? heroTag;
  const FlotingButtonRounded({
    super.key,
    this.icon,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.width,
    this.height,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop ?? 0,
        bottom: paddingBottom ?? 0,
        left: paddingLeft ?? 0,
        right: paddingRight ?? 0,
      ),
      child: SizedBox(
        width: width ?? eightyPx,
        height: height ?? eightyPx,
        child: FloatingActionButton(
          onPressed: () {},
          heroTag: heroTag ?? 'floatingBtn${DateTime.now().millisecondsSinceEpoch}',
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
        ),
      ),
    );
  }
}
