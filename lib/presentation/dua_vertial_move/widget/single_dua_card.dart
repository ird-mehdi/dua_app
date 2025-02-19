import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/dua_number_widget.dart';
import 'package:dua/presentation/dua_vertial_move/widget/dua_card_footer.dart';
import 'package:dua/presentation/dua_vertial_move/widget/first_dua_section.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:dua/presentation/dua_vertial_move/widget/second_dua_section.dart';
import 'package:dua/presentation/dua_vertial_move/widget/section_card.dart';
import 'package:flutter/material.dart';

class SingleDuaCard extends StatelessWidget {
  final ThemeData theme;
  final DuaCardModel duaCardModel;

  const SingleDuaCard({
    super.key,
    required this.theme,
    required this.duaCardModel,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionCard(theme: theme),
        gapH16,
        DuaNumberWidget(
          theme: theme,
          number: 125,
          dua: 'One Hundred times Subhanallahi wa Bihamdihi',
        ),
        gapH12,
        FirstDua(
            title:
                'The Messenger of Allah (ﷺ) commenced the prayer when he got up at night. Then he said:',
            subtitleArabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
            transliteration: "Iyyaaka na'budu wa lyyaaka nasta'een",
            meaning:
                'He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)',
            reference: 'Muslim: 770',
            duaCardModel: duaCardModel,
            theme: theme),
        if (duaCardModel.multipleDuaSeparatorDividerShown)
          Divider(
            color: context.color.primaryColor10,
            height: 1,
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
        gapH10,
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

// class DuaNumber extends StatelessWidget {
//   const DuaNumber({
//     super.key,
//     required this.theme,
//   });

//   final ThemeData theme;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: thirtySixPx,
//           height: thirtySixPx,
//           decoration: BoxDecoration(
//             color: context.color.primaryColor100,
//             shape: BoxShape.circle,
//           ),
//           child: const Center(
//             child: Text(
//               '125',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         gapW12,
//         Expanded(
//           child: Text(
//             'One Hundred times Subhanallahi wa Bihamdihi',
//             style: theme.textTheme.bodyMedium?.copyWith(
//               fontSize: fourteenPx,
//               color: context.color.primaryColor100,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
