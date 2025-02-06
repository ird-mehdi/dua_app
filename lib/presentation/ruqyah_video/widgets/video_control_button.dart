import 'package:dua/core/config/video_player_styles.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VideoControlButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final bool isPlayButton;

  const VideoControlButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.isPlayButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isPlayButton
          ? Container(
              padding: VideoPlayerStyles.playButtonPadding,
              decoration: BoxDecoration(
                color: context.color.controlsOverlay,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(icon),
            )
          : SvgPicture.asset(icon),
    );
  }
}
