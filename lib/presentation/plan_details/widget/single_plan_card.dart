import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/dua_collection_preview.dart';
import 'package:dua/presentation/common/widgets/dua_title_with_number.dart';
import 'package:dua/presentation/dua_vertial_move/widget/dua_card_footer.dart';
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
        gapH25,
        DuaTitleWithNumber(
            theme: theme,
            title: 'The servant is dependent on his Lord #1',
            number: '4'),
        DuaContentCard(
          title: 'One Hundred times Subhanallahi wa Bihamdihi',
          transliteration: "Iyyaaka na'budu wa lyyaaka nasta'een",
          meaning:
              'He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)',
          reference: 'Muslim: 770',
          duaCardModel: duaCardModel,
          theme: theme,
          arabicText: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
        ),
        const DuaCardFooter(),
        if (duaCardModel.multipleDuaSeparatorDividerShown)
          Divider(
            color: context.color.primaryColor10,
            height: 1,
          ),
        gapH25,
        DuaTitleWithNumber(
            theme: theme,
            title: 'The servant is dependent on his Lord #1',
            number: '4'),
        DuaContentCard(
            title: '',
            arabicText: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
            transliteration: 'Iyyaaka na\'budu wa liyaaka nasta\'een',
            meaning:
                'He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)',
            reference: 'Muslim: 770',
            duaCardModel: duaCardModel,
            theme: theme),
        const DuaCardFooter(),
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
