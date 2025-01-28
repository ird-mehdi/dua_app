import 'package:dua/core/config/app_images.dart';
import 'package:dua/presentation/home/widgets/date_info.dart';
import 'package:dua/presentation/home/widgets/next_prayer_info.dart';
import 'package:flutter/material.dart';
import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';

class PrayerCard extends StatelessWidget {
  const PrayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(18),
      //decoration: _buildDecoration(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.banner),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocationRow(),
          const SizedBox(height: 22),
          _buildPrayerTimeInfo(),
          const SizedBox(height: 8),
          _buildProgressBar(context),
          const SizedBox(height: 8),
          _buildRemainingTime(),
          const SizedBox(height: 22),
          _buildBottomRow(),
        ],
      ),
    );
  }

  Widget _buildLocationRow() {
    return Row(
      children: [
        const Icon(Icons.location_on, size: 18, color: Color(0xFF282E29)),
        const SizedBox(width: 8),
        Text(
          'Khilgaon, Dhaka',
          style: TextStyle(
            fontSize: twelvePx,
            color: DuaColor.textPrimaryColorLight,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPrayerTimeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dhuhr',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF282E29),
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '12:27 ',
                style: TextStyle(
                  fontSize: twentyEightPx,
                  height: 1,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF6E833F),
                ),
              ),
              TextSpan(
                text: 'Pm',
                style: TextStyle(
                  fontSize: thirteenPx,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF6E833F),
                ),
              ),
              TextSpan(
                text: ' to ',
                style: TextStyle(
                  fontSize: twelvePx,
                  color: const Color(0xFF282E29),
                ),
              ),
              TextSpan(
                text: '3:54pm',
                style: TextStyle(
                  fontSize: twelvePx,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF282E29),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFFB0C18C),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Container(
          height: 6,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: const Color(0xFF6E833F),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }

  Widget _buildRemainingTime() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 12,
          color: Color(0xFF282E29),
        ),
        children: [
          TextSpan(text: 'Remaining: '),
          TextSpan(
            text: '00:50:00 mins',
            style: TextStyle(fontSize: twelvePx, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomRow() {
    return const Row(
      children: [
        NextPrayerInfo(
          icon: Icons.nightlight_round,
          title: 'Magrib',
          time: '3:54pm',
        ),
        SizedBox(width: 24),
        DateInfo(),
      ],
    );
  }
}
