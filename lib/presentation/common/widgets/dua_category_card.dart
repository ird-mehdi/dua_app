import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/domain/entities/category_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DuaCategoryCard extends StatelessWidget {
  final CategoryData category;
  final bool showDetails;

  const DuaCategoryCard({
    super.key,
    required this.category,
    this.showDetails = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: eightyEightPx,
      padding: padding18,
      margin: EdgeInsets.only(bottom: twelvePx),
      decoration: BoxDecoration(
        border: Border.all(width: onePx, color: context.color.primaryColor10),
        borderRadius: radius20,
      ),
      child: Row(
        children: [
          _buildCategoryIcon(),
          gapW16,
          Expanded(child: _buildCategoryDetails(context)),
          if (showDetails) ...[
            _buildVerticalDivider(context),
            gapW16,
            _buildDuaCount(context),
          ],
        ],
      ),
    );
  }

  Widget _buildCategoryIcon() {
    return Container(
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
    );
  }

  Widget _buildCategoryDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.title,
          style: TextStyle(
            fontSize: fifteenPx,
            fontWeight: FontWeight.w500,
            color: context.color.headingTextColor,
          ),
        ),
        gapH4,
        Text(
          category.subtitle,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: twelvePx,
            fontWeight: FontWeight.w400,
            color: context.color.sectionTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider(BuildContext context) {
    return Container(
      width: twoPx,
      height: thirtyFourPx,
      decoration: BoxDecoration(
        color: context.color.iconShadeColor,
        borderRadius: radius10,
      ),
    );
  }

  Widget _buildDuaCount(BuildContext context) {
    return Column(
      children: [
        Text(
          '${category.duaCount}',
          style: TextStyle(
            fontSize: fifteenPx,
            fontWeight: FontWeight.w500,
            color: context.color.headingTextColor,
          ),
        ),
        gapH4,
        Text(
          'Duas',
          style: TextStyle(
            fontSize: twelvePx,
            fontWeight: FontWeight.w400,
            color: context.color.sectionTextColor,
          ),
        ),
      ],
    );
  }
}
