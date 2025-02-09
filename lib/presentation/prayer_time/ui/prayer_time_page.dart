
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/prayer_time/presenter/prayer_time_presenter.dart';
import 'package:dua/presentation/prayer_time/widgets/current_ptayer_time.dart';
import 'package:dua/presentation/prayer_time/widgets/ramadan_timing_card.dart';
import 'package:dua/presentation/prayer_time/widgets/prayer_time_list_item.dart';
import 'package:flutter/material.dart';

class PrayerTimePage extends StatelessWidget {
  final PrayerTimePresenter presenter = locate<PrayerTimePresenter>();

  PrayerTimePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // Use CustomScrollView
        slivers: [
          SliverAppBar(
            // Use SliverAppBar for the sticky app bar
            pinned: true, // Make the app bar sticky
            backgroundColor: Colors
                .transparent, //Keep the background color same as the original
            // expandedHeight: 80, // Adjusted height
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppBar(
                // Put your CustomAppBar here
                title: 'Prayer Time',
                backgroundColor: Colors.transparent,
                titleFontSize: eighteenPx,
                // Other custom app bar properties if needed
              ),
              titlePadding:
                  EdgeInsets.only(left: eightPx), // Remove default padding
              centerTitle: false, // Alignment for CustomAppBar's title

              background: Container(// The image in the background

                  ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: sixteenPx),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Rest of the content starts here
                  CurrentPrayerTimeCard(),
                  gapH50,
                  PrayerTimeListItem(
                    name: 'Fazar',
                    time: '03:15:00',
                    notification: true,
                    leadingIcon: SvgPath.prayertimeIconFazr,
                  ),

                  PrayerTimeListItem(
                    name: 'Sunrise',
                    time: '03:15:00',
                    notification: true,
                    leadingIcon: SvgPath.prayertimeIconFazr,
                  ),

                  PrayerTimeListItem(
                    name: 'Dhuhr',
                    time: '03:15:00',
                    notification: false,
                    leadingIcon: SvgPath.icSun,
                  ),

                  PrayerTimeListItem(
                    name: 'Asr',
                    time: '03:15:00',
                    notification: true,
                    leadingIcon: SvgPath.prayertimeIconAsr,
                  ),

                  PrayerTimeListItem(
                    name: 'Sunset',
                    time: '03:15:00',
                    notification: false,
                    leadingIcon: SvgPath.prayertimeIconMagrib,
                  ),

                  PrayerTimeListItem(
                    name: 'Magrib',
                    time: '03:15:00',
                    notification: false,
                    leadingIcon: SvgPath.prayertimeIconMagrib,
                  ),

                  PrayerTimeListItem(
                    name: 'Esha',
                    time: '03:15:00',
                    notification: true,
                    leadingIcon: SvgPath.prayertimeIconEsha,
                  ),

                  gapH30,
                  RamadanTimingCard(),
                  gapH16,
                  gapH16,


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
