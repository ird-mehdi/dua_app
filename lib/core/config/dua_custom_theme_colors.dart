import 'package:flutter/material.dart';

class DuaCustomThemeColors extends ThemeExtension<DuaCustomThemeColors> {
  final Color primaryColor;
  final Color secondary;
  final Color cardShade;
  final Color topShapeBg;
  final Color navInactive;
  final Color topIconHome;
  final Color backgroundColor;
  final Color whiteColor;
  final Color navBgAc;
  final Color blackColor;
  final Color subtitleColor;
  final Color shade1;
  final Color gdTop;
  final Color gdMiddle;
  final Color gdBottom;
  final Color iconDisabledColor;
  final Color iconActiveColor;
  final Color primaryButtonColor;
  final Color primaryButtonTextColor;
  final Color secondaryButtonColor;
  final Color inputFieldColor;
  final Color bottomSheetHeader;
  final Color thumbInactive;
  final Color thumbActive;
  final Color switchInactive;
  final Color switchActive;
  final Color secondaryButtonTextColor;
  final Color gradientTop;
  final Color gradientBottom;
  final Color iconBgColor;
  final Color tabBarShade;
  final Color tabActive;
  final Color chartShade; // Added chartShade

  const DuaCustomThemeColors({
    required this.primaryColor,
    required this.secondary,
    required this.cardShade,
    required this.topShapeBg,
    required this.navInactive,
    required this.topIconHome,
    required this.backgroundColor,
    required this.whiteColor,
    required this.navBgAc,
    required this.blackColor,
    required this.subtitleColor,
    required this.shade1,
    required this.gdTop,
    required this.gdMiddle,
    required this.gdBottom,
    required this.iconDisabledColor,
    required this.iconActiveColor,
    required this.primaryButtonColor,
    required this.primaryButtonTextColor,
    required this.secondaryButtonColor,
    required this.inputFieldColor,
    required this.bottomSheetHeader,
    required this.thumbInactive,
    required this.thumbActive,
    required this.switchInactive,
    required this.switchActive,
    required this.secondaryButtonTextColor,
    required this.gradientTop,
    required this.gradientBottom,
    required this.iconBgColor,
    required this.tabBarShade,
    required this.tabActive,
    required this.chartShade, // Added chartShade
  });

  @override
  ThemeExtension<DuaCustomThemeColors> copyWith({
    Color? primaryColor,
    Color? secondary,
    Color? cardShade,
    Color? topShapeBg,
    Color? navInactive,
    Color? topIconHome,
    Color? backgroundColor,
    Color? whiteColor,
    Color? navBgAc,
    Color? blackColor,
    Color? subtitleColor,
    Color? homeDashboardBgColor,
    Color? gdTop,
    Color? gdMiddle,
    Color? gdBottom,
    Color? iconDisabledColor,
    Color? iconActiveColor,
    Color? primaryButtonColor,
    Color? primaryButtonTextColor,
    Color? secondaryButtonColor,
    Color? inputFieldColor,
    Color? bottomSheetHeader,
    Color? thumbInactive,
    Color? thumbActive,
    Color? switchInactive,
    Color? switchActive,
    Color? secondaryButtonTextColor,
    Color? gradientTop,
    Color? gradientBottom,
    Color? iconBgColor,
    Color? tabBarShade,
    Color? tabActive,
    Color? chartShade, // Added chartShade
  }) {
    return DuaCustomThemeColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondary: secondary ?? this.secondary,
      cardShade: cardShade ?? this.cardShade,
      topShapeBg: topShapeBg ?? this.topShapeBg,
      navInactive: navInactive ?? this.navInactive,
      topIconHome: topIconHome ?? this.topIconHome,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      whiteColor: whiteColor ?? this.whiteColor,
      navBgAc: navBgAc ?? this.navBgAc,
      blackColor: blackColor ?? this.blackColor,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      shade1: homeDashboardBgColor ?? shade1,
      gdTop: gdTop ?? this.gdTop,
      gdMiddle: gdMiddle ?? this.gdMiddle,
      gdBottom: gdBottom ?? this.gdBottom,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
      iconActiveColor: iconActiveColor ?? this.iconActiveColor,
      primaryButtonColor: primaryButtonColor ?? this.primaryButtonColor,
      primaryButtonTextColor:
          primaryButtonTextColor ?? this.primaryButtonTextColor,
      secondaryButtonColor: secondaryButtonColor ?? this.secondaryButtonColor,
      inputFieldColor: inputFieldColor ?? this.inputFieldColor,
      bottomSheetHeader: bottomSheetHeader ?? this.bottomSheetHeader,
      thumbInactive: thumbInactive ?? this.thumbInactive,
      thumbActive: thumbActive ?? this.thumbActive,
      switchInactive: switchInactive ?? this.switchInactive,
      switchActive: switchActive ?? this.switchActive,
      secondaryButtonTextColor:
          secondaryButtonTextColor ?? this.secondaryButtonTextColor,
      gradientTop: gradientTop ?? this.gradientTop,
      gradientBottom: gradientBottom ?? this.gradientBottom,
      iconBgColor: iconBgColor ?? this.iconBgColor,
      tabBarShade: tabBarShade ?? this.tabBarShade,
      tabActive: tabActive ?? this.tabActive,
      chartShade: chartShade ?? this.chartShade, // Added chartShade
    );
  }

  @override
  ThemeExtension<DuaCustomThemeColors> lerp(
      ThemeExtension<DuaCustomThemeColors>? other, double t) {
    if (other is! DuaCustomThemeColors) {
      return this;
    }
    return DuaCustomThemeColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      cardShade: Color.lerp(cardShade, other.cardShade, t)!,
      topShapeBg: Color.lerp(topShapeBg, other.topShapeBg, t)!,
      navInactive: Color.lerp(navInactive, other.navInactive, t)!,
      topIconHome: Color.lerp(topIconHome, other.topIconHome, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      navBgAc: Color.lerp(navBgAc, other.navBgAc, t)!,
      blackColor: Color.lerp(blackColor, other.blackColor, t)!,
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t)!,
      shade1: Color.lerp(shade1, other.shade1, t)!,
      gdTop: Color.lerp(gdTop, other.gdTop, t)!,
      gdMiddle: Color.lerp(gdMiddle, other.gdMiddle, t)!,
      gdBottom: Color.lerp(gdBottom, other.gdBottom, t)!,
      iconDisabledColor:
          Color.lerp(iconDisabledColor, other.iconDisabledColor, t)!,
      iconActiveColor: Color.lerp(iconActiveColor, other.iconActiveColor, t)!,
      primaryButtonColor:
          Color.lerp(primaryButtonColor, other.primaryButtonColor, t)!,
      primaryButtonTextColor:
          Color.lerp(primaryButtonTextColor, other.primaryButtonTextColor, t)!,
      secondaryButtonColor:
          Color.lerp(secondaryButtonColor, other.secondaryButtonColor, t)!,
      inputFieldColor: Color.lerp(inputFieldColor, other.inputFieldColor, t)!,
      bottomSheetHeader:
          Color.lerp(bottomSheetHeader, other.bottomSheetHeader, t)!,
      thumbInactive: Color.lerp(thumbInactive, other.thumbInactive, t)!,
      thumbActive: Color.lerp(thumbActive, other.thumbActive, t)!,
      switchInactive: Color.lerp(switchInactive, other.switchInactive, t)!,
      switchActive: Color.lerp(switchActive, other.switchActive, t)!,
      secondaryButtonTextColor: Color.lerp(
          secondaryButtonTextColor, other.secondaryButtonTextColor, t)!,
      gradientTop: Color.lerp(gradientTop, other.gradientTop, t)!,
      gradientBottom: Color.lerp(gradientBottom, other.gradientBottom, t)!,
      iconBgColor: Color.lerp(iconBgColor, other.iconBgColor, t)!,
      tabBarShade: Color.lerp(tabBarShade, other.tabBarShade, t)!,
      tabActive: Color.lerp(tabActive, other.tabActive, t)!,
      chartShade:
          Color.lerp(chartShade, other.chartShade, t)!, // Added chartShade
    );
  }
}
