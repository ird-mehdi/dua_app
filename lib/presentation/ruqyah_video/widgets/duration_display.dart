import 'package:flutter/material.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/core/static/font_family.dart';

class DurationDisplay extends StatelessWidget {
  final String? currentTime;
  final String totalDuration;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;

  const DurationDisplay({
    super.key,
    this.currentTime,
    required this.totalDuration,
    this.margin,
    this.padding,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: fontSize ?? tenPx,
      color: textColor ?? context.color.white,
      fontFamily: FontFamily.poppins,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0.10,
    );

    return Container(
      margin:
          margin ?? EdgeInsets.symmetric(horizontal: tenPx, vertical: eightPx),
      padding: padding ??
          EdgeInsets.symmetric(horizontal: eightPx, vertical: fivePx),
      decoration: ShapeDecoration(
        color: backgroundColor ?? context.color.durationBackground,
        shape: RoundedRectangleBorder(borderRadius: radius13),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (currentTime != null) ...[
            Text(
              currentTime!,
              style: textStyle,
            ),
            gapW5,
            Text(
              '/',
              style: textStyle,
            ),
            gapW5,
          ],
          Text(totalDuration, style: textStyle),
        ],
      ),
    );
  }
}
