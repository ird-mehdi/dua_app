import 'package:dua/core/config/dua_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DateInfo extends StatelessWidget {
  final String icon;
  final String date;
  final String title;

  const DateInfo({
    super.key,
    required this.icon,
    required this.date,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIcon(),
        const SizedBox(width: 12),
        _buildDateText(),
      ],
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFD0E4A3),
        borderRadius: BorderRadius.circular(14),
      ),
      child: SvgPicture.asset(
        icon,
        height: sixteenPx,
        width: sixteenPx,
      ),
    );
  }

  Widget _buildDateText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: twelvePx,
            fontWeight: FontWeight.bold,
            color: Color(0xFF282E29),
          ),
        ),
        Text(
          date,
          style: TextStyle(
            fontSize: tenPx,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
