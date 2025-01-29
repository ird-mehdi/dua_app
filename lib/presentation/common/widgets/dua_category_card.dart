import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryData {
  final String icon;
  final Color bgColor;
  final String title;
  final String subtitle;
  final int duaCount;

  CategoryData({
    required this.icon,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.duaCount,
  });
}

class CategoryCard extends StatelessWidget {
  final CategoryData category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: eightyEightPx,
      padding: padding18,
      decoration: BoxDecoration(
        border: Border.all(width: onePx, color: DuaColor.primary10Color),
        borderRadius: radius20,
      ),
      child: Row(
        children: [
          Container(
            width: fiftyTwoPx,
            height: fiftyTwoPx,
            padding: padding6,
            decoration: BoxDecoration(
              color: category.bgColor,
              borderRadius: radius15,
            ),
            child: SvgPicture.asset(
              category.icon,
              height: thirtySevenPx,
              width: thirtyTwoPx,
            ),
          ),
          gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: TextStyle(
                    fontSize: fifteenPx,
                    fontWeight: FontWeight.w500,
                    color: DuaColor.textPrimaryColorLight,
                  ),
                ),
                gapH4,
                Text(
                  category.subtitle,
                  style: TextStyle(
                    fontSize: twelvePx,
                    fontWeight: FontWeight.w400,
                    color: DuaColor.subtitleColorLight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: twoPx,
            height: thirtyFourPx,
            decoration: BoxDecoration(
              color: DuaColor.iconShadeColorLight,
              borderRadius: radius10,
            ),
          ),
          gapW16,
          Column(
            children: [
              Text(
                '${category.duaCount}',
                style: TextStyle(
                  fontSize: fifteenPx,
                  fontWeight: FontWeight.w500,
                  color: DuaColor.textPrimaryColorLight,
                ),
              ),
              gapH4,
              Text(
                'Duas',
                style: TextStyle(
                  fontSize: twelvePx,
                  fontWeight: FontWeight.w400,
                  color: DuaColor.subtitleColorLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
