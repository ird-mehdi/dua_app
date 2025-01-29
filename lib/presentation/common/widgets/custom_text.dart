import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextStyle? style;
  final double? letterSpacing;
  final ThemeData theme;

  const CustomText({
    required this.text,
    required this.theme,
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
          // TextStyle(
          //   fontFamily: FontFamily.poppins,
          //   fontSize: fontSize ?? 10,
          //   color: color ?? DuaColor.primaryTextColorLight,
          //   fontWeight: fontWeight,
          // ),

          theme.textTheme.bodyMedium!.copyWith(
            color: context.color.titleColor,
          ),
    );
  }
}
