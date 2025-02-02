import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  const SvgImage({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width ?? twentyFourPx,
      height: height ?? twentyFourPx,
      colorFilter: color != null ? buildColorFilter(color) : null,
    );
  }
}
