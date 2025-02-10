import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/dua_vertial_move/widget/dua_card_footer.dart';
import 'package:dua/presentation/dua_vertial_move/widget/first_dua_section.dart';
import 'package:dua/presentation/dua_vertial_move/widget/model.dart';
import 'package:dua/presentation/dua_vertial_move/widget/second_dua_section.dart';
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
        DuaNumber(theme: theme),
        gapH12,
        FirstDua(duaCardModel: duaCardModel, theme: theme),
        if (duaCardModel.multipleDuaSeparatorDividerShown)
          Divider(
            color: context.color.primaryColor10,
            height: 1,
          ),
        SecondDua(duaCardModel: duaCardModel, theme: theme),
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

class DuaNumber extends StatelessWidget {
  const DuaNumber({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              '125',
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
            'One Hundred times Subhanallahi wa Bihamdihi',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: fourteenPx,
              color: context.color.primaryColor100,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    text: 'Morning & Evening Adhkar',
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
    );
  }
}
