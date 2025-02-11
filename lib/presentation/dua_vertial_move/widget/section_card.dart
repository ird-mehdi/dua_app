import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
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
      ),
    );
  }
}
