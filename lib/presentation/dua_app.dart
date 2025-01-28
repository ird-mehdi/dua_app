import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/config/themes.dart';
import 'package:dua/core/static/constants.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:dua/presentation/main/ui/nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DuaApp extends StatelessWidget {
  const DuaApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        onInit: () => DuaScreen.setUp(context),
        onReady: () => DuaScreen.setUp(context),
        theme: DuaThemes.getTheme(lightThemeName, FontFamily.poppins, 16),
        title: 'Dua App',
        home: NavBarPage(),
      );
    });
  }

  static BuildContext get globalContext =>
      Get.context ?? navigatorKey.currentContext!;
}
