// ignore_for_file: deprecated_member_use
import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:flutter/material.dart';

class DuaThemes {
  DuaThemes._();

  static ThemeData getTheme(
      String themeName, String? fontFamily, double? fontSize) {
    switch (themeName) {
      case 'Light':
        return lightTheme;
      default:
        return lightTheme;
    }
  }

  static ThemeData get lightTheme => ThemeData(
        fontFamily: FontFamily.poppins,
        scaffoldBackgroundColor: DuaColor.scaffoldBackgroundColorLight,
        appBarTheme: AppBarTheme(
          backgroundColor: DuaColor.appBarBackgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: DuaColor.titleTextColorLight,
            fontFamily: FontFamily.poppins,
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: DuaColor.primary01Color,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: DuaColor.primary100ColorLight,
                overflow: TextOverflow.ellipsis,
              );
            }
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: DuaColor.textPrimaryColorLight,
            );
          }),
          indicatorColor: DuaColor.primary20Color,
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(
                color: DuaColor.primary100ColorLight,
              );
            }
            return IconThemeData(
              color: DuaColor.textPrimaryColorLight,
            );
          }),
        ),
      );
}
