import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/common/app_bar_widget.dart';
import 'package:dua/presentation/home/presenter/home_presenter.dart';
import 'package:dua/presentation/home/widgets/categories.dart';
import 'package:dua/presentation/home/widgets/prayer_card.dart';
import 'package:dua/presentation/home/widgets/quick_access_menu.dart';
import 'package:dua/presentation/home/widgets/timestamp_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final HomePresenter presenter = locate<HomePresenter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dua & Ruqyah',
        centerTitle: true,
        icon: AppImages.icCategory2,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.icSearch),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PrayerCard(),
              TimestampCard(
                leftTime: '12:27 Pm',
                rightTime: '12:27 Pm',
                notification: true,
                rightNotification: true,
              ),
              QuickAccessMenu(),
              Categories(),
            ],
          ),
        ),
      ),
    );
  }
}
