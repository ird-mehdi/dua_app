import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:dua/presentation/main/presenter/nav_bar_presenter.dart';
import 'package:flutter/material.dart';
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
                      icon: SvgImage(assetName: AppImages.icHome),
                      selectedIcon: SvgImage(assetName: AppImages.icHome),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: SvgImage(assetName: AppImages.icCategory),
                      selectedIcon: SvgImage(assetName: AppImages.icCategory),
                      label: 'All Duas',
                    ),
                    NavigationDestination(
                      icon: SvgImage(assetName: AppImages.icBookmark),
                      selectedIcon: SvgImage(assetName: AppImages.icBookmark),
                      label: 'Bookmark',
                    ),
                    NavigationDestination(
                      icon: SvgImage(assetName: AppImages.icCalendar),
                      selectedIcon: SvgImage(assetName: AppImages.icCalendar),
                      label: 'Schedule',
                    ),
                    NavigationDestination(
                      icon: SvgImage(assetName: AppImages.icLampCharge),
                      selectedIcon: SvgImage(assetName: AppImages.icLampCharge),
                      label: 'Memorize',
                    ),
                  ],
                )),
          );
        });
  }
}
