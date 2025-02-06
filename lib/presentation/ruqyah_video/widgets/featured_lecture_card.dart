// lib/presentation/widgets/featured_lecture_card.dart

import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/ruqyah_video/widgets/duration_display.dart';
import 'package:flutter/material.dart';
import 'package:dua/core/config/dua_custom_text_theme.dart';

class FeaturedLectureCard extends StatelessWidget {
  const FeaturedLectureCard({
    super.key,
    required this.thumbnailUrl,
    required this.duration,
    required this.title,
  });

  final String thumbnailUrl;
  final String duration;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: threeHundredPx,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildThumbnailWithOverlay(context),
          gapH12,
          _buildTitle(context),
        ],
      ),
    );
  }

  Widget _buildThumbnailWithOverlay(BuildContext context) {
    return Stack(
      children: [
        _buildThumbnailImage(),
        _buildGradientOverlay(context),
        Positioned(
          bottom: tenPx,
          left: tenPx,
          child: DurationDisplay(
            totalDuration: duration,
            margin: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Widget _buildThumbnailImage() {
    return ClipRRect(
      borderRadius: radius16,
      child: Image.asset(
        thumbnailUrl,
        height: 172,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGradientOverlay(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius16,
          gradient: context.color.blackFadeGradient,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: eightPx),
      child: Text(
        title,
        style: Theme.of(context).extension<DuaCustomTextTheme>()?.videoTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
