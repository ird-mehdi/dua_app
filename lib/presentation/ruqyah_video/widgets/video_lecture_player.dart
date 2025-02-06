import 'package:dua/core/static/font_family.dart';
import 'package:dua/presentation/ruqyah_video/widgets/duration_display.dart';
import 'package:dua/presentation/ruqyah_video/widgets/video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';

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
        _buildVideoPlayer(context),
        VideoProgressBar(),
      ],
    );
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Stack(
      children: [
        _buildThumbnail(context),
        _buildControlsOverlay(context),
      ],
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    return Container(
      height: twoHundredFortyPx,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.color.black,
        image: DecorationImage(
          image: AssetImage(thumbnailUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            context.color.black.withOpacityInt(0.5),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }

  Widget _buildControlsOverlay(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopControls(),
          _buildPlayControls(context),
          DurationDisplay(
            currentTime: currentTime,
            totalDuration: totalDuration,
          ),
        ],
      ),
    );
  }

  Widget _buildTopControls() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sixteenPx,
        vertical: sixPx,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onBackTap,
            icon: SvgPicture.asset(AppImages.icArrowDown),
          ),
          IconButton(
            onPressed: onSettingsTap,
            icon: SvgPicture.asset(AppImages.icSetting2),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildControlButton(AppImages.icPrevious),
        gapW40,
        _buildPlayButton(context),
        gapW40,
        _buildControlButton(AppImages.icNext),
      ],
    );
  }

  Widget _buildControlButton(String icon) {
    return IconButton(
      onPressed: onPlayTap,
      icon: SvgPicture.asset(icon),
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    return IconButton(
      onPressed: onPlayTap,
      icon: Container(
        padding: padding18,
        decoration: BoxDecoration(
          color: context.color.controlsOverlay,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(AppImages.icPlay),
      ),
    );
  }
}
