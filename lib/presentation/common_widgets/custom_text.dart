import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextStyle? style;
  final double? letterSpacing;

  const CustomText({
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.style,
    this.letterSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            fontFamily: FontFamily.poppins,
            fontSize: fontSize ?? 10,
            color: color ?? DuaColor.subtitleColorLight,
            fontWeight: fontWeight,
          ),
      textAlign: textAlign,
    );
  }
}
