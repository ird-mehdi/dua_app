import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/config/themes.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:dua/presentation/main/ui/nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DuaApp extends StatelessWidget {
  const DuaApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get globalContext =>
      navigatorKey.currentContext ?? Get.context!;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ));

    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        onInit: () => DuaScreen.setUp(context),
        onReady: () => DuaScreen.setUp(context),
        title: 'Dua App',

        theme: DuaTheme.getTheme('Light', FontFamily.kalpurush, 16),
        themeMode: ThemeMode.light,
        // home: VideoPlayListPage(),
        // home: AllDuaPage(),
        // home: SubCategory(),
        // home: DuaVerticalMove(),
        home: NavBarPage(),
        // home: SchedulePage(),
        // home: ScheduleDetailsPage(),
        // home: ScreenList(),
        // home: PrayerTimePage(),
        // home: MemorizationPage(),
        // home: PlanDetailsPage(),
      );
    });
  }
}
