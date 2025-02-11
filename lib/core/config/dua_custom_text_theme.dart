import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:flutter/material.dart';

class DuaCustomTextTheme extends ThemeExtension<DuaCustomTextTheme> {
  final TextStyle? lableExtraSmall;
  final TextStyle? surahName;
  final TextStyle? arabicAyah;
  final TextStyle? buttonText;
  final TextStyle? aText;
  final TextStyle? videoDurationStyle;
  final TextStyle? sectionTitle;
  final TextStyle? videoTitle;
  final TextStyle? categoryTitle;
  final TextStyle? categorySubtitle;
  final TextStyle? duaCount;
  final TextStyle? prayerTitle;
  final TextStyle? prayerTime;
  final TextStyle? prayerLocation;
  final TextStyle? nextPrayerText;
  final TextStyle? duaCountSubtitle;

  const DuaCustomTextTheme({
    this.lableExtraSmall,
    this.surahName,
    this.arabicAyah,
    this.buttonText,
    this.aText,
    this.videoDurationStyle,
    this.sectionTitle,
    this.videoTitle,
    this.categoryTitle,
    this.categorySubtitle,
    this.duaCount,
    this.prayerTitle,
    this.prayerTime,
    this.prayerLocation,
    this.nextPrayerText,
    this.duaCountSubtitle,
  });

  @override
  ThemeExtension<DuaCustomTextTheme> copyWith({
    TextStyle? lableExtraSmall,
    TextStyle? surahName,
    TextStyle? arabicAyah,
    TextStyle? buttonText,
    TextStyle? aText,
    TextStyle? videoDurationStyle,
    TextStyle? sectionTitle,
    TextStyle? videoTitle,
    TextStyle? categoryTitle,
    TextStyle? categorySubtitle,
    TextStyle? duaCount,
    TextStyle? prayerTitle,
    TextStyle? prayerTime,
    TextStyle? prayerLocation,
    TextStyle? nextPrayerText,
    TextStyle? duaCountSubtitle,
  }) {
    return DuaCustomTextTheme(
      lableExtraSmall: lableExtraSmall ?? this.lableExtraSmall,
      surahName: surahName ?? this.surahName,
      arabicAyah: arabicAyah ?? this.arabicAyah,
      buttonText: buttonText ?? this.buttonText,
      aText: aText ?? this.aText,
      videoDurationStyle: videoDurationStyle ?? this.videoDurationStyle,
      sectionTitle: sectionTitle ?? this.sectionTitle,
      videoTitle: videoTitle ?? this.videoTitle,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      categorySubtitle: categorySubtitle ?? this.categorySubtitle,
      duaCount: duaCount ?? this.duaCount,
      prayerTitle: prayerTitle ?? this.prayerTitle,
      prayerTime: prayerTime ?? this.prayerTime,
      prayerLocation: prayerLocation ?? this.prayerLocation,
      nextPrayerText: nextPrayerText ?? this.nextPrayerText,
      duaCountSubtitle: duaCountSubtitle ?? this.duaCountSubtitle,
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
      aText: TextStyle.lerp(aText, other.aText, t),
      videoDurationStyle:
          TextStyle.lerp(videoDurationStyle, other.videoDurationStyle, t),
      sectionTitle: TextStyle.lerp(sectionTitle, other.sectionTitle, t),
      videoTitle: TextStyle.lerp(videoTitle, other.videoTitle, t),
      categoryTitle: TextStyle.lerp(categoryTitle, other.categoryTitle, t),
      categorySubtitle:
          TextStyle.lerp(categorySubtitle, other.categorySubtitle, t),
      duaCount: TextStyle.lerp(duaCount, other.duaCount, t),
      prayerTitle: TextStyle.lerp(prayerTitle, other.prayerTitle, t),
      prayerTime: TextStyle.lerp(prayerTime, other.prayerTime, t),
      prayerLocation: TextStyle.lerp(prayerLocation, other.prayerLocation, t),
      nextPrayerText: TextStyle.lerp(nextPrayerText, other.nextPrayerText, t),
      duaCountSubtitle:
          TextStyle.lerp(duaCountSubtitle, other.duaCountSubtitle, t),
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
      fontSize: headlineLargeFontSize,
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
