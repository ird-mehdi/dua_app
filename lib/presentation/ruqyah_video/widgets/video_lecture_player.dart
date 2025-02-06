import 'package:dua/presentation/ruqyah_video/widgets/duration_display.dart';
import 'package:dua/presentation/ruqyah_video/widgets/video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/core/config/video_player_styles.dart';
import 'package:dua/presentation/ruqyah_video/widgets/video_control_button.dart';

class VideoLecturePlayer extends StatelessWidget {
  const VideoLecturePlayer({
    super.key,
    required this.thumbnailUrl,
    required this.currentTime,
    required this.totalDuration,
    this.onPlayTap,
    this.onSettingsTap,
    this.onBackTap,
  });

  final String thumbnailUrl;
  final String currentTime;
  final String totalDuration;
  final VoidCallback? onPlayTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: VideoPlayerStyles.playerHeight,
          child: Stack(
            children: [
              _buildThumbnail(context),
              _buildControlsOverlay(context),
            ],
          ),
        ),
        const VideoProgressBar(),
      ],
    );
  }

  Widget _buildThumbnail(BuildContext context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.color.black,
          image: DecorationImage(
            image: AssetImage(thumbnailUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              context.color.black
                  .withOpacityInt(VideoPlayerStyles.overlayOpacity),
              BlendMode.darken,
            ),
          ),
        ),
      );

  Widget _buildControlsOverlay(BuildContext context) => Positioned.fill(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopControls(),
            _buildPlayControls(),
            DurationDisplay(
              currentTime: currentTime,
              totalDuration: totalDuration,
            ),
          ],
        ),
      );

  Widget _buildTopControls() => Padding(
        padding: VideoPlayerStyles.controlsPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VideoControlButton(
              icon: AppImages.icArrowDown,
              onPressed: onBackTap,
            ),
            VideoControlButton(
              icon: AppImages.icSetting2,
              onPressed: onSettingsTap,
            ),
          ],
        ),
      );

  Widget _buildPlayControls() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VideoControlButton(
            icon: AppImages.icPrevious,
            onPressed: onPlayTap,
          ),
          gapW40,
          VideoControlButton(
            icon: AppImages.icPlay,
            onPressed: onPlayTap,
            isPlayButton: true,
          ),
          gapW40,
          VideoControlButton(
            icon: AppImages.icNext,
            onPressed: onPlayTap,
          ),
        ],
      );
}
