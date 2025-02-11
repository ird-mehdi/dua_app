import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:flutter/material.dart';

class FirstDua extends StatelessWidget {
  const FirstDua({
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
        if (duaCardModel.isFirstDuaTitleShown)
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
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
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
          "Sub’hanallahi wa bi’hamdihi",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: fourteenPx,
            color: context.color.titleColor.withOpacityInt(0.5),
            fontWeight: FontWeight.w400,
          ),
        ),
        gapH20,

        // Quote
        Text(
          '''Glory and praise is to Allah''',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: fourteenPx,
            color: context.color.titleColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        gapH20,

        // Reference
        if (duaCardModel.isFirstDuaReferenceShown)
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

        gapH6,

        // Action buttons
      ],
    );
  }
}
