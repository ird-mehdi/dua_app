import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class DuaTitleWithNumber extends StatelessWidget {
  final String title;
  final String number;
  const DuaTitleWithNumber({
    super.key,
    required this.theme,
    required this.title,
    required this.number,
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
          child: Center(
            child: Text(
              number,
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
            title,
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