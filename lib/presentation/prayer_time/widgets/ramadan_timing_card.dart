import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RamadanTimingCard extends StatelessWidget {
  const RamadanTimingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F3DC), // Light green background
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header (Remaining Iftar)
          CustomText(
            text: 'Remaining Iftar',
            fontSize: 14,
            color: Colors.black.withOpacityInt(60),
            theme: theme,
          ),
          const SizedBox(height: 8),
          // Timer Text
          CustomText(
            text: '03:15:00',
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Colors.black.withOpacityInt(90),
            theme: theme,
          ),
          const SizedBox(height: 16),
          // Divider
          Container(
            height: 1,
            color: Colors.black.withOpacityInt(20), // Light gray divider
          ),
          const SizedBox(height: 16),
          // Time Displays (Suhoor and Iftar)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: 'Suhoor',
                    fontSize: 14,
                    color: Colors.black.withOpacityInt(60),
                    theme: theme,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    text: '04:30 am',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacityInt(90),
                    theme: theme,
                  ),
                ],
              ),
              // SizedBox(width: 20),

              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20), // Add margin for spacing
                width: 1,
                height: 30,
                color: Colors.black.withOpacityInt(20), // Light gray divider
              ),
              Column(
                children: [
                  CustomText(
                    text: 'Iftar',
                    fontSize: 14,
                    color: Colors.black.withOpacityInt(60),
                    theme: theme,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    text: '05:31 pm',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacityInt(90),
                    theme: theme,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
