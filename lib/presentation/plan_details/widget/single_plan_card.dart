import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/dua_vertial_move/widget/dua_card_footer.dart';
import 'package:dua/presentation/dua_vertial_move/widget/first_dua_section.dart';
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
        PlanHeader(theme: theme),
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

class PlanHeader extends StatelessWidget {
  const PlanHeader({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(sixteenPx),
        decoration: BoxDecoration(
          color: context.color.shadeColor,
          borderRadius: BorderRadius.circular(twelvePx),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plan Name 1',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.color.primaryColor100,
                fontSize: fifteenPx,
              ),
            ),
            Text(
              'Total Duas: 3',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: twelvePx,
                color: context.color.subtitleColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
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
