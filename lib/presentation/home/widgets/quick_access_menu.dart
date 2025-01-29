// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class QuickAccessMenu extends StatelessWidget {
  const QuickAccessMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.85, // Adjusted to prevent overflow
      ),
      itemCount: quickAccessItems.length,
      itemBuilder: (context, index) {
        return _buildQuickAccessItem(
          icon: quickAccessItems[index].icon,
          label: quickAccessItems[index].label,
          color: quickAccessItems[index].color,
        );
      },
    );
  }

  Widget _buildQuickAccessItem({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            borderRadius: BorderRadius.circular(50), // Circular ripple effect
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12.0), // Reduced padding
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: color.withOpacity(0.5), width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                child: Icon(
                  icon,
                  color: color,
                  size: 22.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0), // Reduced spacing
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.0, // Slightly reduced font size
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class QuickAccessItem {
  final IconData icon;
  final String label;
  final Color color;

  const QuickAccessItem({
    required this.icon,
    required this.label,
    required this.color,
  });
}

final List<QuickAccessItem> quickAccessItems = [
  QuickAccessItem(
    icon: Icons.access_time,
    label: 'Last Read',
    color: Colors.blue,
  ),
  QuickAccessItem(
    icon: Icons.star,
    label: 'Challanges',
    color: Colors.orange,
  ),
  QuickAccessItem(
    icon: Icons.bolt,
    label: 'Self Ruqyah',
    color: Colors.green,
  ),
  QuickAccessItem(
    icon: Icons.book,
    label: "Dua's Books",
    color: Colors.brown,
  ),
  QuickAccessItem(
    icon: Icons.person,
    label: 'Dhikr',
    color: Colors.green,
  ),
  QuickAccessItem(
    icon: Icons.mosque,
    label: 'Prayer Time',
    color: Colors.purple,
  ),
  QuickAccessItem(
    icon: Icons.apps,
    label: 'Other Apps',
    color: Colors.blue,
  ),
  QuickAccessItem(
    icon: Icons.favorite,
    label: 'Support Us',
    color: Colors.pink,
  ),
];
