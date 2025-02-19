import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:flutter/material.dart';

class DuaContentCard extends StatelessWidget {
  const DuaContentCard({
    super.key,
    required this.title,
    required this.arabicText,
    required this.transliteration,
    required this.meaning,
    required this.reference,
    required this.duaCardModel,
    required this.theme,
  });
  final String title;
  final String arabicText;
  final String transliteration;
  final String meaning;
  final String reference;
  final DuaCardModel duaCardModel;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sixPx),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH25,
          if (duaCardModel.isSecondDuaTitleShown)
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontSize: fourteenPx,
                height: 1.5,
                letterSpacing: -0.3,
                color: context.color.titleColor,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),

          // Arabic Text
          if (duaCardModel.isSecondDuaSectionShown)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    arabicText,
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
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.left,
                ),
                gapH12,

                // Quote
                Text(
                  meaning,
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
                          reference,
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
    );
  }
}
