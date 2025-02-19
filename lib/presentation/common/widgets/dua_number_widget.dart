import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class DuaNumberWidget extends StatelessWidget {
  final int number;
  final String dua;
  const DuaNumberWidget({
    super.key,
    required this.theme,
    required this.number,
    required this.dua,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(fourPx),
      child: Row(
        children: [
          Container(
            width: thirtyFourPx,
            height: thirtyFourPx,
            decoration: BoxDecoration(
              color: context.color.primaryColor100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          gapW16,
          Expanded(
            child: Text(
              dua,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fourteenPx,
                color: context.color.primaryColor100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
