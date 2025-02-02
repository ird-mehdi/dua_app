import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/domain/entities/category_data_entity.dart';
import 'package:dua/presentation/common/widgets/dua_category_card.dart';
import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  const TabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryData(
        icon: AppImages.icPrayer,
        bgColor: const Color(0x1AE08E15),
        title: 'Dua Importance',
        subtitle: '7 Subcategories',
        duaCount: 50,
      ),
      CategoryData(
        icon: AppImages.icPrayer,
        bgColor: const Color(0x1A924A56),
        title: 'Dua Acceptance',
        subtitle: '10 Subcategories',
        duaCount: 33,
      ),
      CategoryData(
        icon: AppImages.icPrayer,
        bgColor: const Color(0x1A3F5C6C),
        title: 'Time of Dua',
        subtitle: '5 Subcategories',
        duaCount: 25,
      ),
      // ... Add other categories
    ];

    return Padding(
      padding: padding16,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: index < categories.length - 1 ? 12 : 0),
            child: DuaCategoryCard(category: categories[index]),
          );
        },
      ),
    );
  }
}
