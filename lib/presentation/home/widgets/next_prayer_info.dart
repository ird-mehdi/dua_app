import 'package:flutter/material.dart';

class NextPrayerInfo extends StatelessWidget {
  final IconData icon;
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
        const SizedBox(width: 12),
        _buildInfo(),
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
      child: Icon(icon, size: 14, color: const Color(0xFF417360)),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF282E29),
          ),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF282E29),
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
