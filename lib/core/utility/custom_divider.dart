import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key, required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        color: context.color.primaryColor.withAlpha((0.1 * 255).toInt()),
      ),
    );
  }
}
