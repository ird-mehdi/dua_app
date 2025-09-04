import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/dua_collection_preview.dart';
import 'package:dua/presentation/common/widgets/dua_number_widget.dart';
import 'package:dua/presentation/dua_vertial_move/widget/dua_card_footer.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:dua/presentation/dua_vertial_move/widget/second_dua_section.dart';
import 'package:flutter/material.dart';

class ScheduleDetailsDuaList extends StatelessWidget {
  const ScheduleDetailsDuaList({
    super.key,
    required this.theme,
    required this.duaCardModel,
  });

  final ThemeData theme;
  final DuaCardModel duaCardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DuaCollectionPreview(
          theme: theme,
          title: 'Schedule Name',
          subtitle: 'Total Duas: 3',
        ),
        gapH20,
        DuaNumberWidget(
          theme: theme,
          number: 4,
          dua: 'The servant is dependent on his Lord #1',
        ),
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
        if (scheduleDetailsDuaCardModelList[0].isLast)
          Divider(
            color: context.color.primaryColor10,
            height: 1,
          ),
        gapH20,
        DuaNumberWidget(
          theme: theme,
          number: 4,
          dua: 'The servant is dependent on his Lord #1',
        ),
        gapH16,
        DuaContentCard(
            title: '',
            arabicText: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
            transliteration: 'Iyyaaka na\'budu wa liyaaka nasta\'een',
            meaning:
                'He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)',
            reference: 'Muslim: 770',
            duaCardModel: duaCardModel,
            theme: theme),
        gapH16,
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
