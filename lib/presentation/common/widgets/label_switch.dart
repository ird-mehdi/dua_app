import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.theme,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), // Add padding between rows
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontSize: 18, // Increased font size
            color: DuaColor.titleColorLight,
            fontWeight: FontWeight.w500, // Added font weight
            theme: theme,
          ),
          SizedBox(
            // Adjusted size to better match the image
            width: 48,
            height: 24,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF445D48), // Dark green
              activeTrackColor: const Color(0xFF445D48).withOpacityInt(0.5),
              inactiveThumbColor:
                  const Color(0xFF787878), // Inactive color from image
              inactiveTrackColor: const Color(0xFF787878)
                  .withOpacityInt(0.3), // Inactive track color
            ),
          ),
        ],
      ),
    );
  }
}
