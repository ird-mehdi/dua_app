import 'package:flutter/material.dart';

class DateInfo extends StatelessWidget {
  const DateInfo({super.key});

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
      child: const Icon(
        Icons.calendar_today,
        size: 14,
        color: Color(0xFF417360),
      ),
    );
  }

  Widget _buildDateText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dhuʻl-Hijjah 26, 1445 AH',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF282E29),
          ),
        ),
        Text(
          'Tuesday, July 2, 2024',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
