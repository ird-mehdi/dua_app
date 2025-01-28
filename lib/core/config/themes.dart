import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_custom_text_theme.dart';

import 'package:dua/core/config/dua_custom_theme_colors.dart';
import 'package:dua/core/config/dua_screen.dart';

import 'package:dua/core/static/font_family.dart';
import 'package:dua/core/utility/trial_utility.dart';
import 'package:dua/presentation/dua_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DuaTheme {
  DuaTheme._();

  static ThemeData getTheme(
      String themeName, String fontFamily, double fontSize) {
    switch (themeName) {
      case 'Light':
        return lightTheme(fontFamily);
      case 'Dark':
        return darkTheme(fontFamily);
      case 'Green':
        return greenTheme(fontFamily);
      default:
        return lightTheme(fontFamily);
    }
  }

  static final ThemeData _baseTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: FontFamily.kalpurush,
    bannerTheme:
        MaterialBannerThemeData(backgroundColor: DuaColor.bannerColor),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xffDEDEDE)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff17B686)),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff17B686)),
      ),
      hoverColor: DuaColor.primaryColorGreen,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1,
      space: 0,
    ),
    radioTheme: const RadioThemeData(
      visualDensity: VisualDensity(horizontal: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    disabledColor: const Color(0xff7F909F),
    dividerColor: const Color(0xffDEDEDE),
    secondaryHeaderColor: const Color(0xff17B686),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      modalBackgroundColor: Color(0xFFF3F3F3),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );

  static ThemeData lightTheme(String fontFamily) => _baseTheme.copyWith(
        brightness: Brightness.light,
        extensions: [
          DuaCustomThemeColors(
            primaryColor: DuaColor.primaryColorLight,
            secondary: DuaColor.secondaryColorLight,
            cardShade: DuaColor.cardColorLight,
            topShapeBg: DuaColor.topShapeBgLight,
            navInactive: DuaColor.navInactiveLight,
            topIconHome: DuaColor.primaryColorLight,
            backgroundColor: DuaColor.scaffoldBachgroundColorLight,
            whiteColor: Colors.white,
            navBgAc: DuaColor.navBgAcLight.withAlpha((0.25 * 255).toInt()),
            blackColor: DuaColor.blackColorLight,
            subtitleColor:
                DuaColor.textColorLight.withAlpha((0.6 * 255).toInt()),
            shade1: DuaColor.shade1Light,
            gdTop: DuaColor.gdTopLight,
            gdBottom: DuaColor.gdBottomLight,
            gdMiddle: DuaColor.gdMiddleLight,
            gradientTop: DuaColor.gradientTopLight,
            gradientBottom: DuaColor.gradientBottomLight,
            iconActiveColor: DuaColor.iconActiveColorLight,
            iconDisabledColor: DuaColor.iconDisabledColorLight,
            primaryButtonColor: DuaColor.primaryButtonColorLight,
            secondaryButtonColor: DuaColor.secondaryButtonColorLight,
            primaryButtonTextColor: DuaColor.primaryButtonTextColorLight,
            secondaryButtonTextColor: DuaColor.secondaryButtonTextColorLight,
            inputFieldColor: DuaColor.inputFieldColorLight,
            bottomSheetHeader: DuaColor.bottomSheetHeaderColorLight,
            thumbInactive: DuaColor.thumbInactiveColorLight,
            thumbActive: DuaColor.thumbActiveColorLight,
            switchInactive: DuaColor.switchInactiveColorLight,
            switchActive: DuaColor.switchActiveColorLight,
            iconBgColor: DuaColor.iconBgColorLight,
            tabBarShade: DuaColor.tabBarShadeLight,
            tabActive: DuaColor.tabBarActiveLight,
            chartShade: DuaColor.chartShadeLight,
          ),
          DuaCustomTextTheme(
            lableExtraSmall: TextStyle(
              fontSize: lableExtraSmallFontSize,
              color: DuaColor.textColorLight,
              fontFamily: FontFamily.inter,
            ),
            surahName: TextStyle(
              fontSize: surahNameFontSize,
              fontFamily: FontFamily.suraNames,
              fontWeight: FontWeight.w400,
              color: DuaColor.textColorLight,
            ),
            arabicAyah: TextStyle(
              fontFamily: FontFamily.kfgq,
              fontSize: arabicAyahFontSize,
              fontWeight: FontWeight.w400,
              height: 2,
              color: DuaColor.textColorLight,
            ),
            buttonText: TextStyle(
              fontSize: buttonTexFontSize,
              fontWeight: FontWeight.bold,
              color: DuaColor.primaryButtonTextColorLight,
              fontFamily: fontFamily,
            ),
            aText: TextStyle(
              fontSize: aFontSize,
              color: DuaColor.textColorLight,
              fontFamily: fontFamily,
            ),
          )
        ],
        checkboxTheme: CheckboxThemeData(
          checkColor: const WidgetStatePropertyAll(Colors.white),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return DuaColor.primaryColorLight;
            }
            return Colors.transparent;
          }),
          side: BorderSide(
            color: DuaColor.primaryColorLight.withAlpha((0.4 * 255).toInt()),
            width: 1.5,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.5)),
        ),
        radioTheme: RadioThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4),
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return DuaColor.primaryColorLight;
            }
            return DuaColor.primaryColorLight.withAlpha((0.38 * 255).toInt());
          }),
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: DuaColor.scaffoldBachgroundColorLight,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: DuaColor.primaryColorLight,
          labelStyle: TextStyle(color: Color(0xff17B686)),
          fillColor: DuaColor.inputFieldColorLight,
        ),
        dividerTheme: DividerThemeData(
          color: DuaColor.primaryColorLight.withAlpha((0.9 * 255).toInt()),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: DuaColor.primaryColorLight,
          selectionColor:
              DuaColor.primaryColorLight.withAlpha((0.2 * 255).toInt()),
          selectionHandleColor: DuaColor.primaryColorLight,
        ),
        primaryColorLight: Colors.black,
        buttonTheme: const ButtonThemeData(
          buttonColor: DuaColor.textColorLight,
        ),
        cardColor: DuaColor.cardColorLight,
        iconTheme: const IconThemeData(color: DuaColor.textColorLight),
        primaryColor: DuaColor.primaryColorLight,
        scaffoldBackgroundColor: DuaColor.scaffoldBachgroundColorLight,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(DuaColor.primaryColorLight),
        ),
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.white,
          backgroundColor: DuaColor.secondaryColorLight,
          foregroundColor: Color(0xff477848),
          iconTheme: IconThemeData(color: DuaColor.textColorLight),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        textTheme: QuranTextTheme.baseTextTheme.apply(
          bodyColor: DuaColor.textColorLight,
          displayColor: DuaColor.textColorLight,
          fontFamily: fontFamily,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: DuaColor.primaryColorLight,
          secondary: DuaColor.secondaryColorLight,
          surface: DuaColor.primaryColorLight,
          error: Color(0xFFED3535),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFF000000),
          onSurface: Color(0xFF000000),
          onError: Color(0xFFFFFFFF),
          errorContainer: Color(0xFFFFE7DF),
          scrim: DuaColor.secondaryButtonColorLight,
          inverseSurface: DuaColor.scaffoldBachgroundColorLight,
          inversePrimary: DuaColor.secondaryButtonTextColorLight,
        ),
      );
  static ThemeData greenTheme(String fontFamily) => _baseTheme.copyWith(
        brightness: Brightness.light,
        extensions: [
          DuaCustomThemeColors(
            primaryColor: DuaColor.primaryColorGreen,
            secondary: DuaColor.secondaryColorGreen,
            cardShade: DuaColor.cardColorGreen,
            topShapeBg: DuaColor.topShapeBgGreen,
            navInactive: DuaColor.navInactiveGreen,
            topIconHome: DuaColor.primaryColorGreen,
            backgroundColor: DuaColor.scaffoldBachgroundColorGreen,
            whiteColor: Colors.white,
            navBgAc: DuaColor.navBgAcGreen.withAlpha((0.25 * 255).toInt()),
            blackColor: DuaColor.blackColorGreen,
            subtitleColor:
                DuaColor.textColorGreen.withAlpha((0.6 * 255).toInt()),
            shade1: DuaColor.shade1Green,
            gdTop: DuaColor.gdTopGreen,
            gradientTop: DuaColor.gradientTopGreen,
            gradientBottom: DuaColor.gradientBottomGreen,
            gdBottom: DuaColor.gdBottomGreen,
            gdMiddle: DuaColor.gdMiddleGreen,
            iconActiveColor: DuaColor.iconActiveColorGreen,
            iconDisabledColor: DuaColor.iconDisabledColorGreen,
            primaryButtonColor: DuaColor.primaryButtonColorGreen,
            secondaryButtonColor: DuaColor.secondaryButtonColorGreen,
            primaryButtonTextColor: DuaColor.primaryButtonTextColorGreen,
            inputFieldColor: DuaColor.inputFieldColorGreen,
            bottomSheetHeader: DuaColor.bottomSheetHeaderColorGreen,
            thumbInactive: DuaColor.thumbInactiveColorGreen,
            thumbActive: DuaColor.thumbActiveColorGreen,
            switchInactive: DuaColor.switchInactiveColorGreen,
            switchActive: DuaColor.switchActiveColorGreen,
            secondaryButtonTextColor: DuaColor.secondaryButtonTextColorGreen,
            iconBgColor: DuaColor.iconBgColorGreen,
            tabBarShade: DuaColor.tabBarShadeGreen,
            tabActive: DuaColor.tabBarActiveGreen,
            chartShade: DuaColor.chartShadeGreen,
          ),
          DuaCustomTextTheme(
            lableExtraSmall: TextStyle(
              fontSize: lableExtraSmallFontSize,
              color: DuaColor.textColorGreen,
              fontFamily: FontFamily.inter,
            ),
            surahName: TextStyle(
              fontSize: surahNameFontSize,
              fontFamily: FontFamily.suraNames,
              fontWeight: FontWeight.w400,
              color: DuaColor.textColorGreen,
            ),
            arabicAyah: TextStyle(
              fontFamily: FontFamily.meQuran,
              fontSize: arabicAyahFontSize,
              fontWeight: FontWeight.w400,
              height: 2,
              color: DuaColor.textColorGreen,
            ),
            buttonText: TextStyle(
              fontSize: buttonTexFontSize,
              fontWeight: FontWeight.bold,
              color: DuaColor.primaryButtonTextColorGreen,
              fontFamily: fontFamily,
            ),
            aText: TextStyle(
              fontSize: aFontSize,
              color: DuaColor.textColorGreen,
              fontFamily: fontFamily,
            ),
          )
        ],
        checkboxTheme: CheckboxThemeData(
          checkColor: const WidgetStatePropertyAll(Colors.white),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return DuaColor.primaryColorGreen;
            }
            return Colors.transparent;
          }),
          side: BorderSide(
            color: DuaColor.primaryColorGreen.withAlpha((0.4 * 255).toInt()),
            width: 1.5,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.5)),
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: DuaColor.scaffoldBachgroundColorGreen,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: DuaColor.primaryColorGreen,
          labelStyle: TextStyle(color: Color(0xff17B686)),
          fillColor: DuaColor.inputFieldColorGreen,
        ),
        dividerTheme: DividerThemeData(
          color: DuaColor.primaryColorGreen.withAlpha((0.9 * 255).toInt()),
        ),
        radioTheme: RadioThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4),
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return DuaColor.primaryColorGreen;
            }
            return DuaColor.primaryColorGreen.withAlpha((0.38 * 255).toInt());
          }),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: DuaColor.primaryColorGreen,
          selectionColor:
              DuaColor.primaryColorGreen.withAlpha((0.2 * 255).toInt()),
          selectionHandleColor: DuaColor.primaryColorGreen,
        ),
        primaryColorLight: Colors.black,
        buttonTheme: const ButtonThemeData(
          buttonColor: DuaColor.textColorGreen,
        ),
        cardColor: DuaColor.cardColorGreen,
        iconTheme: const IconThemeData(color: DuaColor.textColorGreen),
        primaryColor: DuaColor.primaryColorGreen,
        scaffoldBackgroundColor: DuaColor.scaffoldBachgroundColorGreen,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(DuaColor.primaryColorGreen),
        ),
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.white,
          backgroundColor: DuaColor.secondaryColorGreen,
          foregroundColor: Color(0xff477848),
          iconTheme: IconThemeData(color: DuaColor.textColorGreen),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        textTheme: QuranTextTheme.baseTextTheme.apply(
          bodyColor: DuaColor.textColorGreen,
          displayColor: DuaColor.textColorGreen,
          fontFamily: fontFamily,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: DuaColor.primaryColorGreen,
          secondary: DuaColor.secondaryColorGreen,
          surface: DuaColor.primaryColorGreen,
          error: Color(0xFFED3535),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFF000000),
          onSurface: Color(0xFF000000),
          onError: Color(0xFFFFFFFF),
          errorContainer: Color(0xFFFFE7DF),
          scrim: DuaColor.secondaryButtonColorGreen,
          inverseSurface: DuaColor.scaffoldBachgroundColorGreen,
          inversePrimary: DuaColor.secondaryButtonTextColorGreen,
        ),
      );
  static ThemeData darkTheme(String fontFamily) => _baseTheme.copyWith(
        brightness: Brightness.dark,
        extensions: [
          const DuaCustomThemeColors(
            primaryColor: DuaColor.primaryColorDark,
            secondary: DuaColor.secondaryColorDark,
            cardShade: DuaColor.cardColorDark,
            topShapeBg: DuaColor.topShapeBgDark,
            navInactive: DuaColor.navInactiveDark,
            topIconHome: DuaColor.topIconHomeDark,
            backgroundColor: DuaColor.scaffoldBachgroundColorDark,
            whiteColor: Colors.white,
            navBgAc: DuaColor.navBgAcDark,
            blackColor: DuaColor.blackColorDark,
            subtitleColor: DuaColor.subtitleColorDark,
            gradientTop: DuaColor.gradientTopDark,
            gradientBottom: DuaColor.gradientBottomDark,
            shade1: DuaColor.shade1Dark,
            gdTop: DuaColor.gdTopDark,
            gdBottom: DuaColor.gdBottomDark,
            gdMiddle: DuaColor.gdMiddleDark,
            iconActiveColor: DuaColor.iconActiveColorDark,
            iconDisabledColor: DuaColor.iconDisabledColorDark,
            primaryButtonColor: DuaColor.primaryButtonColorDark,
            secondaryButtonColor: DuaColor.secondaryButtonColorDark,
            primaryButtonTextColor: DuaColor.primaryButtonTextColorDark,
            inputFieldColor: DuaColor.inputFieldColorDark,
            bottomSheetHeader: DuaColor.bottomSheetHeaderColorDark,
            thumbInactive: DuaColor.thumbInactiveColorDark,
            thumbActive: DuaColor.thumbActiveColorDark,
            switchInactive: DuaColor.switchInactiveColorDark,
            switchActive: DuaColor.switchActiveColorDark,
            secondaryButtonTextColor: DuaColor.secondaryButtonTextColorDark,
            iconBgColor: DuaColor.iconBgColorDark,
            tabBarShade: DuaColor.tabBarShadeDark,
            tabActive: DuaColor.tabBarActiveDark,
            chartShade: DuaColor.chartShadeDark,
          ),
          DuaCustomTextTheme(
            lableExtraSmall: TextStyle(
              fontSize: lableExtraSmallFontSize,
              color: DuaColor.textColorDark,
              fontFamily: FontFamily.inter,
            ),
            surahName: TextStyle(
              fontSize: surahNameFontSize,
              fontFamily: FontFamily.suraNames,
              fontWeight: FontWeight.w400,
              color: DuaColor.textColorDark,
            ),
            arabicAyah: TextStyle(
              fontFamily: FontFamily.meQuran,
              fontSize: arabicAyahFontSize,
              fontWeight: FontWeight.w400,
              height: 2,
              color: DuaColor.textColorDark,
            ),
            buttonText: TextStyle(
              fontSize: buttonTexFontSize,
              fontWeight: FontWeight.bold,
              color: DuaColor.primaryButtonTextColorDark,
              fontFamily: fontFamily,
            ),
            aText: TextStyle(
              fontSize: aFontSize,
              color: DuaColor.textColorDark,
              fontFamily: fontFamily,
            ),
          )
        ],
        checkboxTheme: CheckboxThemeData(
          checkColor: const WidgetStatePropertyAll(Colors.white),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return DuaColor.primaryColorDark.withAlpha((0.5 * 255).toInt());
            }
            return Colors.transparent;
          }),
          side: BorderSide(
            color: DuaColor.primaryColorDark.withAlpha((0.4 * 255).toInt()),
            width: 1.5,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.5)),
        ),
        radioTheme: RadioThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4),
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return DuaColor.primaryColorDark;
            }
            return DuaColor.primaryColorDark.withAlpha((0.38 * 255).toInt());
          }),
        ),
        bannerTheme: const MaterialBannerThemeData(
            backgroundColor: DuaColor.bannerColor),
        dialogTheme: const DialogTheme(
          backgroundColor: Color(0xff122337),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Color(0xff7F909F)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF585868)),
          ),
          focusColor: DuaColor.textColorDark,
          labelStyle: TextStyle(color: Color(0xff17B686)),
          fillColor: DuaColor.inputFieldColorDark,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: DuaColor.primaryColorDark,
          selectionColor:
              DuaColor.primaryColorDark.withAlpha((0.5 * 255).toInt()),
          selectionHandleColor: DuaColor.primaryColorDark,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.amber),
        cardColor: DuaColor.cardColorDark,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xff122337),
          modalBackgroundColor: Color(0xff223449),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(DuaColor.textColorDark),
        ),
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.black,
          backgroundColor: DuaColor.secondaryColorDark,
          foregroundColor: Color(0xff477848),
          iconTheme: IconThemeData(color: DuaColor.textColorDark),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        primaryColor: DuaColor.primaryColorDark,
        scaffoldBackgroundColor: DuaColor.scaffoldBachgroundColorDark,
        primaryColorDark: const Color(0xff122337),
        dividerColor: const Color(0xFF585868),
        iconTheme: const IconThemeData(color: Color(0xff7F909F)),
        textTheme: QuranTextTheme.baseTextTheme.apply(
          bodyColor: DuaColor.textColorDark,
          displayColor: DuaColor.textColorDark,
          fontFamily: fontFamily,
        ),
        colorScheme: const ColorScheme.dark(
          primary: DuaColor.textColorDark,
          secondary: DuaColor.secondaryColorDark,
          surface: DuaColor.textColorDark,
          error: Color(0xFFED3535),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onError: Colors.white,
          brightness: Brightness.dark,
          errorContainer: Color(0xFF202939),
          scrim: DuaColor.secondaryButtonColorDark,
          inverseSurface: DuaColor.scaffoldBachgroundColorDark,
          inversePrimary: DuaColor.secondaryButtonTextColorDark,
        ),
      );
}

Future<SystemUiOverlayStyle?> getSystemUiOverlayStyle({
  bool? isDark,
  BuildContext? context,
}) async {
  final SystemUiOverlayStyle? uiOverlayStyle = await catchAndReturnFuture(
    () async {
      final ThemeData theme = Theme.of(context ?? DuaApp.globalContext);
      final Color statusBarColor = isDark == null
          ? theme.primaryColor
          : (isDark ? const Color(0x00ffffff) : const Color(0xffffffff));
      final Color systemNavigationBarColor = isDark == null
          ? theme.cardColor
          : (isDark ? const Color(0xff161C23) : const Color(0xffffffff));
      return SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
    },
  );
  return uiOverlayStyle;
}


