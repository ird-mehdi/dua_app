import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/static/font_family.dart';
import 'package:dua/core/static/svg_path.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Prayer Times',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: DuaColor.scaffoldBachgroundColorLight,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrayerTime1stCard(),
            SizedBox(height: sixteenPx),
            PrayerTime2ndCard(
              name: 'Fazar',
              time: '03:15:00',
              notification: true,
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
              leadingIcon: SvgPath.prayertimeIconDhuhr,
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
            PrayerTime3rdCard(),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextStyle? style;
  final double? letterSpacing;

  const CustomText({
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.style,
    this.letterSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            fontFamily: FontFamily.poppins,
            fontSize: fontSize ?? 10,
            color: color ?? DuaColor.primaryTextColorLight,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
      textAlign: textAlign,
    );
  }
}
