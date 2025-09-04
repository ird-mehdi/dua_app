import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:flutter/material.dart';

class FirstDua extends StatelessWidget {
  final String title;
  final String subtitleArabic;
  final String transliteration;
  final String meaning;
  final String reference;
  final DuaCardModel duaCardModel;
  final ThemeData theme;
  const FirstDua({
    super.key,
    required this.title,
    required this.subtitleArabic,
    required this.transliteration,
    required this.meaning,
    required this.reference,
    required this.duaCardModel,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sixPx),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH25,
          if (duaCardModel.isFirstDuaTitleShown)
            Text(
              title,
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
              subtitleArabic,
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
            transliteration,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: fourteenPx,
              color: context.color.titleColor.withOpacityInt(0.5),
              fontWeight: FontWeight.w400,
            ),
          ),
          gapH20,

          // Quote
          Text(
            meaning,
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
                    text: reference,
                  ),
                ),
              ],
            ),

          // Action buttons
        ],
      ),
    );
  }
}
