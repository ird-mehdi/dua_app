
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/prayer_time/presenter/prayer_time_presenter.dart';
import 'package:dua/presentation/prayer_time/widgets/prayer_time_1st_card.dart';
import 'package:dua/presentation/prayer_time/widgets/prayer_time_2nd_card.dart';
import 'package:dua/presentation/prayer_time/widgets/prayer_time_3rd_card.dart';
import 'package:flutter/material.dart';

class PrayerTimePage extends StatelessWidget {
  final PrayerTimePresenter presenter = locate<PrayerTimePresenter>();

  PrayerTimePage({super.key});
  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/png/prayer_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: sixteenPx),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Prayer Time',
                backgroundColor: Colors.transparent,
                titleFontSize: eighteenPx,
              ),
              PrayerTime1stCard(),
              SizedBox(height: 60),
              PrayerTime2ndCard(
                name: 'Fazar',
                time: '03:15:00',
                notification: true,
                leadingIcon: SvgPath.prayertimeIconFazr,
              ),
              PrayerTime2ndCard(
                name: 'Sunrise',
                time: '03:15:00',
                notification: true,
                leadingIcon: SvgPath.prayertimeIconFazr,
              ),
              PrayerTime2ndCard(
                name: 'Dhuhr',
                time: '03:15:00',
                notification: false,
                leadingIcon: SvgPath.icSun,
              ),
              PrayerTime2ndCard(
                name: 'Asr',
                time: '03:15:00',
                notification: true,
                leadingIcon: SvgPath.prayertimeIconAsr,
              ),
              PrayerTime2ndCard(
                name: 'Sunset',
                time: '03:15:00',
                notification: false,
                leadingIcon: SvgPath.prayertimeIconMagrib,
              ),
              PrayerTime2ndCard(
                name: 'Magrib',
                time: '03:15:00',
                notification: false,
                leadingIcon: SvgPath.prayertimeIconMagrib,
              ),
              PrayerTime2ndCard(
                name: 'Esha',
                time: '03:15:00',
                notification: true,
                leadingIcon: SvgPath.prayertimeIconEsha,
              ),
              SizedBox(height: 30),
              PrayerTime3rdCard(),
              SizedBox(height: 100),
              SizedBox(height: sixteenPx),
              SizedBox(height: sixteenPx),
            ],
          ),
        ),
      ),
    );
  }
}
