import 'package:flutter/material.dart';

class DuaCustomThemeColors extends ThemeExtension<DuaCustomThemeColors> {
  final Color primaryColor100;
  final Color primaryColor90;
  final Color primaryColor80;
  final Color primaryColor70;
  final Color primaryColor60;
  final Color primaryColor50;
  final Color primaryColor40;
  final Color primaryColor30;
  final Color primaryColor20;
  final Color primaryColor10;
  final Color primaryColor05;
  final Color primaryColor01;
  final Color subtitleColor;
  final Color titleColor;
  final Color logoTextColor;
  final Color gradientTop;
  final Color gradientBottom1;
  final Color gradientBottom3;
  final Color gradientBottom2;
  final Color backgroundColor;
  final Color mosqueTop;
  final Color cloud;

  const DuaCustomThemeColors({
    required this.primaryColor100,
    required this.primaryColor90,
    required this.primaryColor80,
    required this.primaryColor70,
    required this.primaryColor60,
    required this.primaryColor50,
    required this.primaryColor40,
    required this.primaryColor30,
    required this.primaryColor20,
    required this.primaryColor10,
    required this.primaryColor05,
    required this.primaryColor01,
    required this.subtitleColor,
    required this.titleColor,
    required this.logoTextColor,
    required this.gradientTop,
    required this.gradientBottom1,
    required this.gradientBottom3,
    required this.gradientBottom2,
    required this.backgroundColor,
    required this.mosqueTop,
    required this.cloud,
  });

  @override
  ThemeExtension<DuaCustomThemeColors> copyWith({
    Color? primaryColor100,
    Color? primaryColor90,
    Color? primaryColor80,
    Color? primaryColor70,
    Color? primaryColor60,
    Color? primaryColor50,
    Color? primaryColor40,
    Color? primaryColor30,
    Color? primaryColor20,
    Color? primaryColor10,
    Color? primaryColor05,
    Color? primaryColor01,
    Color? subtitleColor,
    Color? titleColor,
    Color? logoTextColor,
    Color? gradientTop,
    Color? gradientBottom1,
    Color? gradientBottom3,
    Color? gradientBottom2,
    Color? backgroundColor,
    Color? mosqueTop,
    Color? cloud,
  }) {
    return DuaCustomThemeColors(
      primaryColor100: primaryColor100 ?? this.primaryColor100,
      primaryColor90: primaryColor90 ?? this.primaryColor90,
      primaryColor80: primaryColor80 ?? this.primaryColor80,
      primaryColor70: primaryColor70 ?? this.primaryColor70,
      primaryColor60: primaryColor60 ?? this.primaryColor60,
      primaryColor50: primaryColor50 ?? this.primaryColor50,
      primaryColor40: primaryColor40 ?? this.primaryColor40,
      primaryColor30: primaryColor30 ?? this.primaryColor30,
      primaryColor20: primaryColor20 ?? this.primaryColor20,
      primaryColor10: primaryColor10 ?? this.primaryColor10,
      primaryColor05: primaryColor05 ?? this.primaryColor05,
      primaryColor01: primaryColor01 ?? this.primaryColor01,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      titleColor: titleColor ?? this.titleColor,
      logoTextColor: logoTextColor ?? this.logoTextColor,
      gradientTop: gradientTop ?? this.gradientTop,
      gradientBottom1: gradientBottom1 ?? this.gradientBottom1,
      gradientBottom3: gradientBottom3 ?? this.gradientBottom3,
      gradientBottom2: gradientBottom2 ?? this.gradientBottom2,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      mosqueTop: mosqueTop ?? this.mosqueTop,
      cloud: cloud ?? this.cloud,
    );
  }

  @override
  ThemeExtension<DuaCustomThemeColors> lerp(
      ThemeExtension<DuaCustomThemeColors>? other, double t) {
    if (other is! DuaCustomThemeColors) {
      return this;
    }
    return DuaCustomThemeColors(
      primaryColor100: Color.lerp(primaryColor100, other.primaryColor100, t)!,
      primaryColor90: Color.lerp(primaryColor90, other.primaryColor90, t)!,
      primaryColor80: Color.lerp(primaryColor80, other.primaryColor80, t)!,
      primaryColor70: Color.lerp(primaryColor70, other.primaryColor70, t)!,
      primaryColor60: Color.lerp(primaryColor60, other.primaryColor60, t)!,
      primaryColor50: Color.lerp(primaryColor50, other.primaryColor50, t)!,
      primaryColor40: Color.lerp(primaryColor40, other.primaryColor40, t)!,
      primaryColor30: Color.lerp(primaryColor30, other.primaryColor30, t)!,
      primaryColor20: Color.lerp(primaryColor20, other.primaryColor20, t)!,
      primaryColor10: Color.lerp(primaryColor10, other.primaryColor10, t)!,
      primaryColor05: Color.lerp(primaryColor05, other.primaryColor05, t)!,
      primaryColor01: Color.lerp(primaryColor01, other.primaryColor01, t)!,
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      logoTextColor: Color.lerp(logoTextColor, other.logoTextColor, t)!,
      gradientTop: Color.lerp(gradientTop, other.gradientTop, t)!,
      gradientBottom1: Color.lerp(gradientBottom1, other.gradientBottom1, t)!,
      gradientBottom3: Color.lerp(gradientBottom3, other.gradientBottom3, t)!,
      gradientBottom2: Color.lerp(gradientBottom2, other.gradientBottom2, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      mosqueTop: Color.lerp(mosqueTop, other.mosqueTop, t)!,
      cloud: Color.lerp(cloud, other.cloud, t)!,
    );
  }
}
