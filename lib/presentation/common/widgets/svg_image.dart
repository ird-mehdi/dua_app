import 'package:dua/core/config/dua_screen.dart';
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
    this.onTap,
  });

  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        fit: fit,
        height: height ?? twentyFourPx,
        width: width ?? twentyFourPx,
        colorFilter: color == null ? null : buildColorFilterToChangeColor(color),

      ),
    );
  }
}

