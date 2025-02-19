import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/prayer_time/widgets/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({
    super.key,
    required this.theme,
    required this.progress,
    this.containerWidth,
    this.containerHeight,
    this.seekBarWidth,
    this.seekBarHeight,
    this.containerBarWidth,
    this.seekBarBarWidth,
    this.text,
    this.isLargeStyle = true,
  });

  final ThemeData theme;
  final double progress;
  final double? seekBarWidth;
  final double? seekBarHeight;
  final double? containerWidth;
  final double? containerHeight;
  final double? containerBarWidth;
  final double? seekBarBarWidth;
  final String? text;
  final bool? isLargeStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: containerWidth ?? 26.percentWidth,
          height: containerHeight ?? 26.percentWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.color.primaryColor10,
              width: containerBarWidth ?? eightPx,
            ),
          ),
        ),
        CircularSeekBar(
          width: seekBarWidth ?? 24.percentWidth,
          height: seekBarHeight ?? 24.percentWidth,
          progress: progress,
          minProgress: 0,
          maxProgress: 100,
          barWidth: seekBarBarWidth ?? eightPx,
          startAngle: 180,
          sweepAngle: 360,
          strokeCap: StrokeCap.round,
          progressColor: context.color.primaryColor100,
          trackColor: Colors.transparent,
          animation: true,
          curves: Curves.easeInOut,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: sixteenPx,
                    fontWeight: FontWeight.w500,
                    color: context.color.titleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: elevenPx,
                    fontWeight: FontWeight.w400,
                    color: context.color.subtitleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
