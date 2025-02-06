import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:flutter/material.dart';

class DuaCustomTextTheme extends ThemeExtension<DuaCustomTextTheme> {
  final TextStyle? lableExtraSmall;
  final TextStyle? surahName;
  final TextStyle? arabicAyah;
  final TextStyle? buttonText;
  final TextStyle? aText; // Added new property
  final TextStyle? videoDurationStyle;

  const DuaCustomTextTheme(
      {this.lableExtraSmall,
      this.surahName,
      this.arabicAyah,
      this.buttonText,
      this.aText, // Added to constructor
      this.videoDurationStyle});

  @override
  ThemeExtension<DuaCustomTextTheme> copyWith({
    TextStyle? lableExtraSmall,
    TextStyle? surahName,
    TextStyle? arabicAyah,
    TextStyle? buttonText,
    TextStyle? aText, // Added to copyWith parameters
    TextStyle? videoDurationStyle,
  }) {
    return DuaCustomTextTheme(
      lableExtraSmall: lableExtraSmall ?? this.lableExtraSmall,
      surahName: surahName ?? this.surahName,
      arabicAyah: arabicAyah ?? this.arabicAyah,
      buttonText: buttonText ?? this.buttonText,
      aText: aText ?? this.aText, // Added to copyWith return
      videoDurationStyle: videoDurationStyle ?? this.videoDurationStyle,
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
      videoDurationStyle:
          TextStyle.lerp(videoDurationStyle, other.videoDurationStyle, t),
    );
  }
}

class QuranTextTheme {
  static TextTheme baseTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: displayLargeFontSize,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: displayMediumFontSize,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: displaySmallFontSize,
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: headlineLargeFontSize,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: headlineMediumFontSize,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: headingSmallFontSize,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: titleLargeFontSize,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: titleMediumFontSize,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: titleSmallFontSize,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: bodyLargeFontSize,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: bodyMediumFontSize,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: bodySmallFontSize,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: labelLargeFontSize,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: labelMediumFontSize,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: labelSmallFontSize,
      fontWeight: FontWeight.w500,
    ),
  );
}
