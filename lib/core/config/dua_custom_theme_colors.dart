import 'package:flutter/material.dart';

class DuaCustomThemeColors extends ThemeExtension<DuaCustomThemeColors> {
  final Color primaryColor110;
  final Color primaryColor400;
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
  final Color cardBackgroundColor;
  final Color cardBackColor1;
  final Color cardBackColor2;
  final Color navbarBGColor;
  final Color tabBtnColor;
  final Color shadeColor;
  final Color iconShadeColor;
  final Color whiteColor;
  final Color secondaryColor;
  final Color secondaryColor10;
  final Color sectionTextColor;
  final Color btnTextColor;
  final Color headingTextColor;
  final Color quickAccessColor1;
  final Color quickAccessColor2;
  final Color quickAccessColor3;
  final Color quickAccessColor4;
  final Color quickAccessColor5;
  final Color quickAccessColor6;
  final Color quickAccessColor7;
  final Color quickAccessColor8;
  final Color titleHeadingColorLight;
  final Color progressBarBackground;
  final Color progressBarForeground;
  final Color controlsOverlay;
  final Color durationBackground;
  final Color white;
  final Color black;
  final LinearGradient blackFadeGradient;
  final Color cardDurationBackground;

  const DuaCustomThemeColors({
    required this.primaryColor110,
    required this.primaryColor400,
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
    required this.cardBackgroundColor,
    required this.cardBackColor1,
    required this.cardBackColor2,
    required this.navbarBGColor,
    required this.tabBtnColor,
    required this.shadeColor,
    required this.iconShadeColor,
    required this.whiteColor,
    required this.secondaryColor,
    required this.secondaryColor10,
    required this.sectionTextColor,
    required this.btnTextColor,
    required this.headingTextColor,
    required this.quickAccessColor1,
    required this.quickAccessColor2,
    required this.quickAccessColor3,
    required this.quickAccessColor4,
    required this.quickAccessColor5,
    required this.quickAccessColor6,
    required this.quickAccessColor7,
    required this.quickAccessColor8,
    required this.titleHeadingColorLight,
    required this.progressBarBackground,
    required this.progressBarForeground,
    required this.controlsOverlay,
    required this.durationBackground,
    required this.white,
    required this.black,
    required this.blackFadeGradient,
    required this.cardDurationBackground,
  });

  @override
  ThemeExtension<DuaCustomThemeColors> copyWith({
    Color? primaryColor110,
    Color? primaryColor400,
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
    Color? cardBackgroundColor,
    Color? cardBackColor1,
    Color? cardBackColor2,
    Color? navbarBGColor,
    Color? tabBtnColor,
    Color? shadeColor,
    Color? iconShadeColor,
    Color? whiteColor,
    Color? secondaryColor,
    Color? secondaryColor10,
    Color? sectionTextColor,
    Color? btnTextColor,
    Color? headingTextColor,
    Color? quickAccessColor1,
    Color? quickAccessColor2,
    Color? quickAccessColor3,
    Color? quickAccessColor4,
    Color? quickAccessColor5,
    Color? quickAccessColor6,
    Color? quickAccessColor7,
    Color? quickAccessColor8,
    Color? titleHeadingColorLight,
    Color? progressBarBackground,
    Color? progressBarForeground,
    Color? controlsOverlay,
    Color? durationBackground,
    Color? white,
    Color? black,
    LinearGradient? blackFadeGradient,
    Color? cardDurationBackground,
  }) {
    return DuaCustomThemeColors(
      primaryColor110: primaryColor110 ?? this.primaryColor110,
      primaryColor400: primaryColor400 ?? this.primaryColor400,
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
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      cardBackColor1: cardBackColor1 ?? this.cardBackColor1,
      cardBackColor2: cardBackColor2 ?? this.cardBackColor2,
      navbarBGColor: navbarBGColor ?? this.navbarBGColor,
      tabBtnColor: tabBtnColor ?? this.tabBtnColor,
      shadeColor: shadeColor ?? this.shadeColor,
      iconShadeColor: iconShadeColor ?? this.iconShadeColor,
      whiteColor: whiteColor ?? this.whiteColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      secondaryColor10: secondaryColor10 ?? this.secondaryColor10,
      sectionTextColor: sectionTextColor ?? this.sectionTextColor,
      btnTextColor: btnTextColor ?? this.btnTextColor,
      headingTextColor: headingTextColor ?? this.headingTextColor,
      quickAccessColor1: quickAccessColor1 ?? this.quickAccessColor1,
      quickAccessColor2: quickAccessColor2 ?? this.quickAccessColor2,
      quickAccessColor3: quickAccessColor3 ?? this.quickAccessColor3,
      quickAccessColor4: quickAccessColor4 ?? this.quickAccessColor4,
      quickAccessColor5: quickAccessColor5 ?? this.quickAccessColor5,
      quickAccessColor6: quickAccessColor6 ?? this.quickAccessColor6,
      quickAccessColor7: quickAccessColor7 ?? this.quickAccessColor7,
      quickAccessColor8: quickAccessColor8 ?? this.quickAccessColor8,
      titleHeadingColorLight:
          titleHeadingColorLight ?? this.titleHeadingColorLight,
      progressBarBackground:
          progressBarBackground ?? this.progressBarBackground,
      progressBarForeground:
          progressBarForeground ?? this.progressBarForeground,
      controlsOverlay: controlsOverlay ?? this.controlsOverlay,
      durationBackground: durationBackground ?? this.durationBackground,
      white: white ?? this.white,
      black: black ?? this.black,
      blackFadeGradient: blackFadeGradient ?? this.blackFadeGradient,
      cardDurationBackground:
          cardDurationBackground ?? this.cardDurationBackground,
    );
  }

  @override
  ThemeExtension<DuaCustomThemeColors> lerp(
      ThemeExtension<DuaCustomThemeColors>? other, double t) {
    if (other is! DuaCustomThemeColors) {
      return this;
    }
    return DuaCustomThemeColors(
      primaryColor110: Color.lerp(primaryColor110, other.primaryColor110, t)!,
      primaryColor400: Color.lerp(primaryColor400, other.primaryColor400, t)!,
      titleHeadingColorLight:
          Color.lerp(titleHeadingColorLight, other.titleHeadingColorLight, t)!,
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
      cardBackgroundColor:
          Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
      cardBackColor1: Color.lerp(cardBackColor1, other.cardBackColor1, t)!,
      cardBackColor2: Color.lerp(cardBackColor2, other.cardBackColor2, t)!,
      navbarBGColor: Color.lerp(navbarBGColor, other.navbarBGColor, t)!,
      tabBtnColor: Color.lerp(tabBtnColor, other.tabBtnColor, t)!,
      shadeColor: Color.lerp(shadeColor, other.shadeColor, t)!,
      iconShadeColor: Color.lerp(iconShadeColor, other.iconShadeColor, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      secondaryColor10:
          Color.lerp(secondaryColor10, other.secondaryColor10, t)!,
      sectionTextColor:
          Color.lerp(sectionTextColor, other.sectionTextColor, t)!,
      btnTextColor: Color.lerp(btnTextColor, other.btnTextColor, t)!,
      headingTextColor:
          Color.lerp(headingTextColor, other.headingTextColor, t)!,
      quickAccessColor1:
          Color.lerp(quickAccessColor1, other.quickAccessColor1, t)!,
      quickAccessColor2:
          Color.lerp(quickAccessColor2, other.quickAccessColor2, t)!,
      quickAccessColor3:
          Color.lerp(quickAccessColor3, other.quickAccessColor3, t)!,
      quickAccessColor4:
          Color.lerp(quickAccessColor4, other.quickAccessColor4, t)!,
      quickAccessColor5:
          Color.lerp(quickAccessColor5, other.quickAccessColor5, t)!,
      quickAccessColor6:
          Color.lerp(quickAccessColor6, other.quickAccessColor6, t)!,
      quickAccessColor7:
          Color.lerp(quickAccessColor7, other.quickAccessColor7, t)!,
      quickAccessColor8:
          Color.lerp(quickAccessColor8, other.quickAccessColor8, t)!,
      progressBarBackground:
          Color.lerp(progressBarBackground, other.progressBarBackground, t)!,
      progressBarForeground:
          Color.lerp(progressBarForeground, other.progressBarForeground, t)!,
      controlsOverlay: Color.lerp(controlsOverlay, other.controlsOverlay, t)!,
      durationBackground:
          Color.lerp(durationBackground, other.durationBackground, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      blackFadeGradient:
          LinearGradient.lerp(blackFadeGradient, other.blackFadeGradient, t)!,
      cardDurationBackground:
          Color.lerp(cardDurationBackground, other.cardDurationBackground, t)!,
    );
  }
}
