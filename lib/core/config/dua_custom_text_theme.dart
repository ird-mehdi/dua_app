import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:flutter/material.dart';

class DuaCustomTextTheme extends ThemeExtension<DuaCustomTextTheme> {
  final TextStyle? lableExtraSmall;
  final TextStyle? surahName;
  final TextStyle? arabicAyah;
  final TextStyle? buttonText;
  final TextStyle? aText; // Added new property

  const DuaCustomTextTheme({
    this.lableExtraSmall,
    this.surahName,
    this.arabicAyah,
    this.buttonText,
    this.aText, // Added to constructor
  });

  @override
  ThemeExtension<DuaCustomTextTheme> copyWith({
    TextStyle? lableExtraSmall,
    TextStyle? surahName,
    TextStyle? arabicAyah,
    TextStyle? buttonText,
    TextStyle? aText, // Added to copyWith parameters
  }) {
    return DuaCustomTextTheme(
      lableExtraSmall: lableExtraSmall ?? this.lableExtraSmall,
      surahName: surahName ?? this.surahName,
      arabicAyah: arabicAyah ?? this.arabicAyah,
      buttonText: buttonText ?? this.buttonText,
      aText: aText ?? this.aText, // Added to copyWith return
    );
  }

  @override
  ThemeExtension<DuaCustomTextTheme> lerp(
    ThemeExtension<DuaCustomTextTheme>? other,
    double t,
  ) {
    if (other is! DuaCustomTextTheme) {
      return this;
    }
    return DuaCustomTextTheme(
      lableExtraSmall:
          TextStyle.lerp(lableExtraSmall, other.lableExtraSmall, t),
      surahName: TextStyle.lerp(surahName, other.surahName, t),
      arabicAyah: TextStyle.lerp(arabicAyah, other.arabicAyah, t),
      buttonText: TextStyle.lerp(buttonText, other.buttonText, t),
      aText: TextStyle.lerp(aText, other.aText, t), // Added to lerp
    );
  }
}

class QuranTextTheme {
  static TextTheme baseTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: displayLargeFontSize,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: displayMediumFontSize,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: displaySmallFontSize,
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: headlineLargeFontSize,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: headlineMediumFontSize,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: headingSmallFontSize,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: titleLargeFontSize,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: titleMediumFontSize,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: titleSmallFontSize,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: bodyLargeFontSize,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: bodyMediumFontSize,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: bodySmallFontSize,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: labelLargeFontSize,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: labelMediumFontSize,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: labelSmallFontSize,
      fontWeight: FontWeight.w500,
    ),
  );
}
