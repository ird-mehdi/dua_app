import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:flutter/material.dart';

class SecondDua extends StatelessWidget {
  const SecondDua({
    super.key,
    required this.duaCardModel,
    required this.theme,
  });

  final DuaCardModel duaCardModel;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH16,
        if (duaCardModel.isSecondDuaTitleShown)
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
        if (duaCardModel.isSecondDuaSectionShown)
          Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
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
                "Sub'hanallahi wa bi'hamdihi",
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
    Abu Hurairah (RA) said, the Messenger of Allah (ﷺ) said that, if anyone recite "Sub'hanallahi wa bi'hamdihi" hundred times in the morning and in the evening, then you will bring largest rewards then anyone in the day of resurrection, except who recite it more than him. In the other narration, he will be forgiven even if his sins are greater than the foams of the sea. Another narration, the dhikr was mentioned as "Sub'hanallahil 'adhim wa bi'hamdihi".''',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: fourteenPx,
                  color: context.color.titleColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
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
                  SizedBox()
                ],
              ),
            ],
          ),

        // Reference

        gapH16,

        // Action buttons
      ],
    );
  }
}
