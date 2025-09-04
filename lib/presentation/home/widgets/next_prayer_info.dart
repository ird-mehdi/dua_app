import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NextPrayerInfo extends StatelessWidget {
  final String icon;
  final String title;
  final String time;

  const NextPrayerInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIcon(),
        gapW12,
        _buildInfo(),
      ],
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: padding5,
      decoration: BoxDecoration(
        color: const Color(0xFFD0E4A3),
        borderRadius: radius14,
      ),
      child: SvgPicture.asset(
        icon,
        height: fourteenPx,
        width: fourteenPx,
        colorFilter: const ColorFilter.mode(
          Color(0xFF417360),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: twelvePx,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF282E29),
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: twelvePx,
              color: const Color(0xFF282E29),
            ),
            children: [
              const TextSpan(text: 'Start - '),
              TextSpan(
                text: time,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
