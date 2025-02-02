import 'dart:ui';

class CategoryData {
  final String icon;
  final Color bgColor;
  final String title;
  final String subtitle;
  final int? duaCount;

  CategoryData({
    required this.icon,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    this.duaCount,
  });
}
