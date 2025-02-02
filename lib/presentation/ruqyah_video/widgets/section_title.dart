import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH8,
      child: Opacity(
        opacity: 0.70,
        child: Text(
          title,
          style: TextStyle(
            color: context.color.sectionTextColor,
            fontSize: twelvePx,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.67,
            letterSpacing: 0.12,
          ),
        ),
      ),
    );
  }
}
