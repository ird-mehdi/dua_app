import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/dua_vertial_move/widget/dua_card_footer.dart';
import 'package:dua/presentation/dua_vertial_move/widget/section_card.dart';
import 'package:flutter/material.dart';

class DuaDetailsCard extends StatelessWidget {
  const DuaDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isFirstDua = true;
    // final duaCardModel = planDetailsDuaCardModelList.first;

    return Column(
      children: [
        SectionCard(
            theme: theme,
            title: 'Section: ',
            subtitle: 'Morning & Evening Adhkar'),
        //
        gapH25,
        Row(
          children: [
            Container(
              width: thirtySixPx,
              height: thirtySixPx,
              decoration: BoxDecoration(
                color: context.color.primaryColor100,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '4',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            gapW12,
            Expanded(
              child: Text(
                'The servant is dependent on his Lord #1',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: fourteenPx,
                  color: context.color.primaryColor100,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        if (isFirstDua) FirstDua(theme: theme),
        Padding(
          padding: EdgeInsets.all(sixPx),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH25,
              Text(
                'The Messenger of Allah (ﷺ) commenced the prayer when he got up at night. Then he said:',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontSize: fourteenPx,
                  height: 1.5,
                  letterSpacing: -0.3,
                  color: context.color.titleColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
              gapH25,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
                      style: context.textStyle.arabicAyah?.copyWith(
                        fontSize: twentyEightPx,
                        color: context.color.headingTextColor,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  gapH25,
                  // Transliteration
                  Text(
                    "Iyyaaka na'budu wa lyyaaka nasta'een",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: fourteenPx,
                        color: context.color.titleColor.withOpacityInt(0.5),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.left,
                  ),
                  gapH12,

                  // Quote
                  Text(
                    '''He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide.
He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)''',
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: fourteenPx,
                        color: context.color.titleColor,
                        fontWeight: FontWeight.w400,
                        height: 1.8),
                    textAlign: TextAlign.left,
                  ),
                  gapH20,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reference:',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: twelvePx,
                              color: context.color.titleColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          gapH4,
                          Text(
                            'Muslim: 770',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: fifteenPx,
                              color: context.color.titleColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // Action buttons
            ],
          ),
        ),
        const DuaCardFooter(),
        Divider(
          color: context.color.titleColor.withOpacityInt(0.1),
          thickness: 1,
          height: twentyFourPx,
        ),
      ],
    );
  }
}

class FirstDua extends StatelessWidget {
  const FirstDua({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sixPx),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH25,
          Text(
            'The Messenger of Allah (ﷺ) commenced the prayer when he got up at night. Then he said:',
            style: theme.textTheme.titleSmall?.copyWith(
              fontSize: fourteenPx,
              height: 1.5,
              letterSpacing: -0.3,
              color: context.color.titleColor,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
          gapH25,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
                  style: context.textStyle.arabicAyah?.copyWith(
                    fontSize: twentyEightPx,
                    color: context.color.headingTextColor,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              gapH25,
              // Transliteration
              Text(
                "Iyyaaka na'budu wa lyyaaka nasta'een",
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: fourteenPx,
                    color: context.color.titleColor.withOpacityInt(0.5),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
              gapH12,

              // Quote
              Text(
                '''He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide.
    He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)''',
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: fourteenPx,
                    color: context.color.titleColor,
                    fontWeight: FontWeight.w400,
                    height: 1.8),
                textAlign: TextAlign.left,
              ),
              gapH20,
            ],
          ),
          Divider(
            color: context.color.titleColor.withOpacityInt(0.1),
            thickness: 1,
            height: twentyFourPx,
          ),
        ],
      ),
    );
  }
}
