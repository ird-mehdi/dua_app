import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class SvgIconButton extends StatelessWidget {
  final SvgImage icon;
  final VoidCallback onPressed;

  const SvgIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: icon,
      ),
    );
  }
}
