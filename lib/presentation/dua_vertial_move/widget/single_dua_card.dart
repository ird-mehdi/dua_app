import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/dua_vertial_move/widget/dua_card_footer.dart';
import 'package:flutter/material.dart';

class SingleDuaCard extends StatelessWidget {
  final ThemeData theme;
  final bool isLast;
  final bool isFooterShown;
  final bool isFirst;
  final bool isArabicTopTitleShown;
  final bool isReferenceShown;
  final bool isDuaNumberShown;

  const SingleDuaCard({
    super.key,
    required this.theme,
    this.isLast = true,
    this.isFooterShown = true,
    this.isFirst = true,
    this.isArabicTopTitleShown = false,
    this.isReferenceShown = true,
    this.isDuaNumberShown = true,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFirst)
              Container(
                height: eightyFivePx,
                padding: EdgeInsets.all(sixteenPx),
                decoration: BoxDecoration(
                  color: context.color.shadeColor,
                  borderRadius: BorderRadius.circular(twelvePx),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Section: ',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.color.primaryColor100,
                                fontSize: fifteenPx,
                              ),
                            ),
                            TextSpan(
                              text: 'The most important thing to ask Allah for',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: fifteenPx,
                                color: context.color.headingTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            gapH16,

            if (isDuaNumberShown)
              Padding(
                padding: EdgeInsets.all(eightPx),
                child: Row(
                  children: [
                    Container(
                      width: thirtySixPx,
                      height: thirtySixPx,
                      decoration: BoxDecoration(
                        color: context.color.primaryColor100,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
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
              ),
            gapH12,

            if (isArabicTopTitleShown)
              Text(
                'The Messenger of Allah (ﷺ) commenced the prayer when he got up at night. Then he said:',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontSize: fourteenPx,
                  height: 1.5,
                  letterSpacing: -0.3,
                  color: context.color.titleColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),

            // Arabic Text
            Padding(
              padding: EdgeInsets.all(eightPx),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
                  style: context.textStyle.arabicAyah?.copyWith(
                      fontSize: twentyEightPx,
                      color: context.color.headingTextColor,
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            gapH25,
            // Transliteration
            Text(
              "lyyaaka na'budu wa lyyaaka nasta'een",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fourteenPx,
                color: context.color.titleColor.withOpacityInt(0.5),
                fontWeight: FontWeight.w400,
              ),
            ),
            gapH20,

            // Quote
            Text(
              '''
It is You we worship and It is You we ask for help.

He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)''',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fourteenPx,
                color: context.color.titleColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            gapH20,

            // Reference
            if (isReferenceShown)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: twelvePx,
                        color: context.color.titleColor,
                        fontWeight: FontWeight.w400,
                      ),
                      text: 'Reference:',
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: fifteenPx,
                        color: context.color.titleColor,
                        fontWeight: FontWeight.w600,
                      ),
                      text: 'Muslim: 770',
                    ),
                  ),
                ],
              ),

            gapH16,

            // Action buttons
          ],
        ),
        if (isFooterShown) DuaCardFooter.DuaCardFooter(),
        gapH10,
        if (isLast)
          Divider(
            color: context.color.primaryColor10,
            height: 1,
          ),
      ],
    );
  }
}
