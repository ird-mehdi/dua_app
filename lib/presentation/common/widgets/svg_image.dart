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
  
  // Use a static cache map to avoid repeated asset loading
  static final Map<String, SvgPicture> _cache = <String, SvgPicture>{};

  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Create a unique key for this specific SVG with its properties
    final String cacheKey = '$assetName-${width ?? 'default'}-${height ?? 'default'}-${color?.toARGB32() ?? 'nocolor'}';
    
    // Try to get from cache first
    final svgWidget = _cache.putIfAbsent(cacheKey, () => SvgPicture.asset(
      assetName,
      fit: fit,
      height: height ?? twentyFourPx,
      width: width ?? twentyFourPx,
      colorFilter: color == null ? null : buildColorFilterToChangeColor(color),
      // SVG caching is handled automatically by the flutter_svg package
    ));
    
    return GestureDetector(
      onTap: onTap,
      child: svgWidget,
    );
  }
}

