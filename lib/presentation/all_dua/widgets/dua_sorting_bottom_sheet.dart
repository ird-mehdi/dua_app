
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class DuaSortingBottomSheet extends StatelessWidget {
  const DuaSortingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: context.color.backgroundColor,
        borderRadius: radius30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Text(
              'Sorting',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RadioListTile(
            title: Text(
              'by Number (1-100)',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fifteenPx,
                color: context.color.titleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            groupValue: null,
            onChanged: (value) {},
            value: null,
            activeColor: context.color.titleColor,
          ),
          RadioListTile(
            title: Text(
              'by Alphabets (A - Z)',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fifteenPx,
                color: context.color.titleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            groupValue: null,
            onChanged: (value) {},
            value: null,
            activeColor: context.color.titleColor,
          ),
        ],
      ),
    );
  }
}
