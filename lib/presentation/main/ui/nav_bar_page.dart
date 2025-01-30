import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/main/presenter/nav_bar_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NavBarPage extends StatelessWidget {
  // Inject controller
  final NavBarPresenter controller = Get.put(NavBarPresenter());

  NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder<NavBarPresenter>(
        presenter: controller,
        builder: () {
          return Scaffold(
            body: IndexedStack(
              index: controller.currentUiState.selectedIndex,
              children: controller.pages,
            ),
            bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: context.color.primaryColor20,
                      width: 1,
                    ),
                  ),
                ),
                child: NavigationBar(
                  selectedIndex: controller.currentUiState.selectedIndex,
                  onDestinationSelected: controller.onItemTapped,
                  //backgroundColor: DuaColor.navbarBGColorLight,
                  height: 80,
                  destinations: [
                    NavigationDestination(
                      icon: SvgPicture.asset(AppImages.icHome),
                      selectedIcon: SvgPicture.asset(AppImages.icHome),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppImages.icCategory),
                      selectedIcon: SvgPicture.asset(AppImages.icCategory),
                      label: 'All Duas',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppImages.icBookmark),
                      selectedIcon: SvgPicture.asset(AppImages.icBookmark),
                      label: 'Bookmark',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppImages.icCalendar),
                      selectedIcon: SvgPicture.asset(AppImages.icCalendar),
                      label: 'Schedule',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppImages.icLampCharge),
                      selectedIcon: SvgPicture.asset(AppImages.icLampCharge),
                      label: 'Memorize',
                    ),
                  ],
                )),
          );
        });
  }
}
