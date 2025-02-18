import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/dua_collection_preview.dart';
import 'package:dua/presentation/common/widgets/dua_title_with_number.dart';
import 'package:dua/presentation/dua_vertial_move/widget/dua_card_footer.dart';
import 'package:dua/presentation/dua_vertial_move/widget/first_dua_section.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:dua/presentation/dua_vertial_move/widget/second_dua_section.dart';
import 'package:flutter/material.dart';

class SinglePlanCard extends StatelessWidget {
  final ThemeData theme;
  final DuaCardModel duaCardModel;

  const SinglePlanCard({
    super.key,
    required this.theme,
    required this.duaCardModel,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DuaCollectionPreview(
          theme: theme,
          title: 'Plan Name 1',
          subtitle: 'Total Duas: 3',
        ),
        gapH16,
        DuaTitleWithNumber(
            theme: theme,
            title: 'One Hundred times Subhanallahi wa Bihamdihi',
            number: '125'),
        gapH12,
        FirstDua(
            title: 'One Hundred times Subhanallahi wa Bihamdihi',
            subtitleArabic: 'السلام عليكم ورحمة الله وبركاته',
            transliteration: 'السلام عليكم ورحمة الله وبركاته',
            meaning: 'The greeting of peace, mercy, and blessings of Allah',
            reference: 'Ibn Majah',
            duaCardModel: duaCardModel,
            theme: theme),
        if (duaCardModel.multipleDuaSeparatorDividerShown)
          Divider(
            color: context.color.primaryColor10,
            height: 1,
          ),
        SecondDua(duaCardModel: duaCardModel, theme: theme),
        const DuaCardFooter(),
        gapH30,
        if (duaCardModel.isLast)
          Divider(
            color: context.color.primaryColor10,
            height: 1,
          ),
        gapH20,
      ],
    );
  }
}
