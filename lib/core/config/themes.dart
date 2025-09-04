import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_custom_text_theme.dart';
import 'package:dua/core/config/dua_custom_theme_colors.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:flutter/material.dart';

class DuaTheme {
  DuaTheme._();

  static ThemeData getTheme(
      String themeName, String fontFamily, double fontSize) {
    switch (themeName) {
      case 'Light':
        return lightTheme(fontFamily);
      default:
        return lightTheme(fontFamily);
    }
  }

  static final ThemeData _baseTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: FontFamily.poppins,
    scaffoldBackgroundColor: DuaColor.backgroundColorLight,
    
    bannerTheme:
        MaterialBannerThemeData(backgroundColor: DuaColor.primaryColorLight01),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1,
      space: 0,
    ),
  );

  static ThemeData lightTheme(String fontFamily) => _baseTheme.copyWith(
        brightness: Brightness.light,
        extensions: [
          DuaCustomThemeColors(
            primaryColor400: DuaColor.primaryColorLight400,
            titleHeadingColorLight: DuaColor.titleHeadingColorLight,
            primaryColor110: DuaColor.primaryColorLight110,
            primaryColor100: DuaColor.primaryColorLight100,
            primaryColor90: DuaColor.primaryColorLight90,
            primaryColor80: DuaColor.primaryColorLight80,
            primaryColor70: DuaColor.primaryColorLight70,
            primaryColor60: DuaColor.primaryColorLight60,
            primaryColor50: DuaColor.primaryColorLight50,
            primaryColor40: DuaColor.primaryColorLight40,
            primaryColor30: DuaColor.primaryColorLight30,
            primaryColor20: DuaColor.primaryColorLight20,
            primaryColor10: DuaColor.primaryColorLight10,
            primaryColor05: DuaColor.primaryColorLight05,
            primaryColor01: DuaColor.primaryColorLight01,
            subtitleColor: DuaColor.subtitleColorLight,
            titleColor: DuaColor.titleColorLight,
            logoTextColor: DuaColor.logoTextColorLight,
            gradientTop: DuaColor.gradientTopLight,
            gradientBottom1: DuaColor.gradientBottom1Light,
            gradientBottom3: DuaColor.gradientBottom3Light,
            gradientBottom2: DuaColor.gradientBottom2Light,
            backgroundColor: DuaColor.backgroundColorLight,
            mosqueTop: DuaColor.mosqueTopLight,
            cloud: DuaColor.cloudLight,
            cardBackgroundColor: DuaColor.cardBackgroundColorLight,
            cardBackColor1: DuaColor.cardBackColorLight1,
            cardBackColor2: DuaColor.cardBackColorLight2,
            navbarBGColor: DuaColor.navbarBGColorLight,
            tabBtnColor: DuaColor.tabBtnColorLight,
            shadeColor: DuaColor.shadeColorLight,
            iconShadeColor: DuaColor.iconShadeColorLight,
            whiteColor: DuaColor.whiteColorLight,
            secondaryColor: DuaColor.secondaryColorLight,
            secondaryColor10: DuaColor.secondaryColorLight10,
            sectionTextColor: DuaColor.sectionTextColorLight,
            btnTextColor: DuaColor.btnTextColorLight,
            headingTextColor: DuaColor.headingTextColorLight,
            quickAccessColor1: DuaColor.quickAccessColorLight1,
            quickAccessColor2: DuaColor.quickAccessColorLight2,
            quickAccessColor3: DuaColor.quickAccessColorLight3,
            quickAccessColor4: DuaColor.quickAccessColorLight4,
            quickAccessColor5: DuaColor.quickAccessColorLight5,
            quickAccessColor6: DuaColor.quickAccessColorLight6,
            quickAccessColor7: DuaColor.quickAccessColorLight7,
            quickAccessColor8: DuaColor.quickAccessColorLight8,
            progressBarBackground: DuaColor.progressBarBackground,
            progressBarForeground: DuaColor.progressBarForeground,
            controlsOverlay: DuaColor.controlsOverlay,
            durationBackground: DuaColor.durationBackground,
            white: DuaColor.white,
            black: DuaColor.black,
            blackFadeGradient: DuaColor.blackFadeGradient,
            cardDurationBackground: DuaColor.cardDurationBackground,
          ),
          DuaCustomTextTheme(
            videoDurationStyle: TextStyle(
              fontSize: videoDurationFontSize,
              color: DuaColor.white,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w400,
              height: 1,
              letterSpacing: 0.10,
            ),
            lableExtraSmall: TextStyle(
              fontSize: lableExtraSmallFontSize,
              color: DuaColor.titleColorLight,
              fontFamily: FontFamily.poppins,
            ),
            surahName: TextStyle(
              fontSize: surahNameFontSize,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w400,
              color: DuaColor.titleColorLight,
            ),
            arabicAyah: TextStyle(
              fontFamily: FontFamily.kfgq,
              fontSize: arabicAyahFontSize,
              fontWeight: FontWeight.w400,
              height: 2,
              color: DuaColor.titleColorLight,
            ),
            buttonText: TextStyle(
              fontSize: buttonTexFontSize,
              fontWeight: FontWeight.bold,
              color: DuaColor.backgroundColorLight,
              fontFamily: FontFamily.poppins,
            ),
            sectionTitle: TextStyle(
              color: DuaColor.sectionTextColorLight,
              fontSize: bodySmallFontSize,
              fontWeight: FontWeight.w500,
              height: 1.67,
              letterSpacing: 0.12,
              fontFamily: FontFamily.poppins,
            ),
            videoTitle: TextStyle(
              fontSize: buttonTexFontSize,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w500,
              color: DuaColor.headingTextColorLight,
              height: 1.57,
              letterSpacing: 0.14,
            ),
            categoryTitle: TextStyle(
              fontSize: categoryTitleFontSize,
              fontWeight: FontWeight.w500,
              color: DuaColor.headingTextColorLight,
              fontFamily: FontFamily.poppins,
              height: 1.33,
              letterSpacing: 0.15,
            ),
            categorySubtitle: TextStyle(
              fontFamily: FontFamily.poppins,
              fontSize: categorySubtitleFontSize,
              fontWeight: FontWeight.w400,
              color: DuaColor.subtitleColorLight,
              height: 1.67,
              letterSpacing: 0.12,
            ),
            duaCount: TextStyle(
              fontSize: duaCountFontSize,
              fontWeight: FontWeight.w500,
              color: DuaColor.headingTextColorLight,
              fontFamily: FontFamily.poppins,
            ),
            duaCountSubtitle: TextStyle(
              fontSize: labelSmallFontSize,
              fontWeight: FontWeight.w400,
              color: DuaColor.subtitleColorLight,
              fontFamily: FontFamily.poppins,
              height: 1.67,
              letterSpacing: 0.12,
            ),
          )
        ],
        appBarTheme: AppBarTheme(
          backgroundColor: DuaColor.navbarBGColorLight,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontSize: headlineMediumFontSize,
            fontWeight: FontWeight.w600,
            color: DuaColor.titleColorLight,
            fontFamily: FontFamily.poppins,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: const WidgetStatePropertyAll(Colors.white),
          fillColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return DuaColor.primaryColorLight01;
              }
              return Colors.transparent;
            },
          ),
          side: BorderSide(
            color: DuaColor.primaryColorLight01.withAlpha((0.4 * 255).toInt()),
            width: 1.5,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.5)),
        ),
        radioTheme: RadioThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4),
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return DuaColor.primaryColorLight01;
              }
              return DuaColor.primaryColorLight01
                  .withAlpha((0.38 * 255).toInt());
            },
          ),
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: DuaColor.backgroundColorLight,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: DuaColor.primaryColorLight01,
          labelStyle: TextStyle(color: Color(0xff17B686)),
          fillColor: DuaColor.primaryColorLight01,
        ),
        dividerTheme: DividerThemeData(
          color: DuaColor.primaryColorLight01.withAlpha((0.9 * 255).toInt()),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: DuaColor.primaryColorLight01,
          selectionColor:
              DuaColor.primaryColorLight01.withAlpha((0.2 * 255).toInt()),
          selectionHandleColor: DuaColor.primaryColorLight01,
        ),
        primaryColorLight: DuaColor.primaryColorLight100,
        buttonTheme: const ButtonThemeData(
          buttonColor: DuaColor.titleColorLight,
        ),
        cardColor: DuaColor.primaryColorLight01,
        iconTheme: const IconThemeData(color: DuaColor.titleColorLight),
        primaryColor: DuaColor.primaryColorLight01,
        scaffoldBackgroundColor: DuaColor.backgroundColorLight,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(DuaColor.primaryColorLight01),
        ),
        textTheme: QuranTextTheme.baseTextTheme.apply(
          bodyColor: DuaColor.titleColorLight,
          displayColor: DuaColor.titleColorLight,
          fontFamily: FontFamily.poppins,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: DuaColor.primaryColorLight100,
          secondary: DuaColor.primaryColorLight50,
          surface: DuaColor.primaryColorLight01,
          error: Color(0xFFED3535),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFF000000),
          onSurface: Color(0xFF000000),
          onError: Color(0xFFFFFFFF),
          errorContainer: Color(0xFFFFE7DF),
          scrim: DuaColor.primaryColorLight01,
          inverseSurface: DuaColor.backgroundColorLight,
          inversePrimary: DuaColor.primaryColorLight01,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: DuaColor.navbarBGColorLight,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: DuaColor.primaryColorLight100,
                overflow: TextOverflow.ellipsis,
              );
            }
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: DuaColor.titleColorLight,
            );
          }),
          indicatorColor: DuaColor.primaryColorLight10,
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(
                color: DuaColor.primaryColorLight100,
              );
            }
            return IconThemeData(
              color: DuaColor.titleColorLight,
            );
          }),
        ),
      );
}
