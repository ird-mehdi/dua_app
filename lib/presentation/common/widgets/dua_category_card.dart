import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/subcategory/ui/subcategory_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dua/core/config/dua_custom_text_theme.dart';

class DuaCategoryCard extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final String categoryIcon;
  final String categorySubtitle;
  final int categoryDuaCount;
  final bool showDetails;
  final Color categoryBgColor;

  const DuaCategoryCard({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.categoryIcon,
    required this.categorySubtitle,
    required this.categoryDuaCount,
    this.showDetails = true,
    required this.categoryBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategory(
              categoryId: categoryId,
              categoryName: categoryName,
            ),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }

  Widget _buildCategoryIcon() {
    return Container(
      width: fiftyTwoPx,
      height: fiftyTwoPx,
      padding: padding6,
      decoration: BoxDecoration(
        color: categoryBgColor,
        borderRadius: radius15,
      ),
      child: SvgPicture.asset(
        categoryIcon,
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
          categoryName,
          style:
              Theme.of(context).extension<DuaCustomTextTheme>()?.categoryTitle,
        ),
        gapH4,
        Text(
          categorySubtitle,
          style: Theme.of(context)
              .extension<DuaCustomTextTheme>()
              ?.categorySubtitle,
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
          '$categoryDuaCount',
          style: Theme.of(context).extension<DuaCustomTextTheme>()?.duaCount,
        ),
        gapH4,
        Text(
          'Duas',
          style: Theme.of(context)
              .extension<DuaCustomTextTheme>()
              ?.categorySubtitle,
        ),
      ],
    );
  }
}
