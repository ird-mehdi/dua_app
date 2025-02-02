import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
  });

  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      fit: fit,
      height: height,
      width: width,
      colorFilter: color == null ? null : buildColorFilterToChangeColor(color),
    );
  }
}
