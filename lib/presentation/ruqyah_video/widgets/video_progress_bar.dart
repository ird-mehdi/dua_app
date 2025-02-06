import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class VideoProgressBar extends StatelessWidget {
  const VideoProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: twoPx,
          width: double.infinity,
          color: context.color.progressBarBackground,
        ),
        Container(
          height: twoPx,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: ShapeDecoration(
            color: context.color.progressBarForeground,
            shape: RoundedRectangleBorder(borderRadius: radius3),
          ),
        ),
      ],
    );
  }
}
