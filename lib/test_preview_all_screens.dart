
import 'package:dua/presentation/all_dua/ui/all_dua.dart';
import 'package:dua/presentation/dua_vertial_move/ui/dua_vertical_move.dart';
import 'package:dua/presentation/main/ui/nav_bar_page.dart';
import 'package:dua/presentation/memorization/ui/memorization_page.dart';
import 'package:dua/presentation/prayer_time/ui/prayer_time_page.dart';
import 'package:dua/presentation/ruqyah_video/ui/video_play_list_page.dart';
import 'package:dua/presentation/scheduale/ui/schedule_page.dart';
import 'package:dua/presentation/schedule_details/ui/schedule_details_page.dart';
import 'package:dua/presentation/subcategory/ui/subcategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Screen List',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ElevatedButton(
            //     onPressed: () {
            //       Get.bottomSheet(const MoreOptionBottomSheet());
            //     },
            //     child: const Text('MOdal Bottom')),
            // ElevatedButton(
            //     onPressed: () {
            //       Get.dialog(const GoToHadithDialog());
            //     },
            //     child: const Text('data')),
            ScreenItem(name: 'Home', screen: NavBarPage()),
            ScreenItem(name: 'All Dua', screen: AllDuaPage()),
            ScreenItem(name: 'Sub Category', screen: SubCategory()),
            ScreenItem(name: 'Dua Vertical Move', screen: DuaVerticalMove()),
            ScreenItem(name: 'Schedule', screen: SchedulePage()),
            ScreenItem(name: 'Schedule Details', screen: ScheduleDetailsPage()),
            ScreenItem(name: 'Prayer Time', screen: PrayerTimePage()),
            ScreenItem(name: 'Memorization', screen: MemorizationPage()),
            ScreenItem(name: 'Video Playlist', screen: VideoPlayListPage()),
            
          ],
        ).paddingAll(Get.width * .04),
      ),
    );
  }
}

class ScreenItem extends StatelessWidget {
  const ScreenItem({
    Key? key,
    this.name,
    this.screen,
  }) : super(key: key);

  final String? name;
  final Widget? screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: Get.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
          trailing: Icon(Icons.arrow_forward_ios, size: Get.width * .04),
          title: Text(
            name!,
          ),
          onTap: () => Get.to(() => screen!)),
    );
  }
}