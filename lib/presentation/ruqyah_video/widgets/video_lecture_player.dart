import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VideoLecturePlayer extends StatelessWidget {
  final String thumbnailUrl;
  final String currentTime;
  final String totalDuration;
  final String title;
  final VoidCallback? onPlayTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onBackTap;

  const VideoLecturePlayer({
    super.key,
    required this.thumbnailUrl,
    required this.currentTime,
    required this.totalDuration,
    required this.title,
    this.onPlayTap,
    this.onSettingsTap,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            // Video Thumbnail
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(thumbnailUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacityInt(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),

            // Controls Overlay
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Controls
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: sixteenPx,
                      vertical: sixPx,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          AppImages.icArrowDown,
                        ),
                        SvgPicture.asset(
                          AppImages.icSetting2,
                        ),
                      ],
                    ),
                  ),

                  // Center Play Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: onPlayTap,
                        icon: SvgPicture.asset(AppImages.icPrevious),
                      ),
                      const SizedBox(width: 40),
                      IconButton(
                        onPressed: onPlayTap,
                        icon: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0x6696AB99),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppImages.icPlay),
                        ),
                      ),
                      const SizedBox(width: 40),
                      IconButton(
                        onPressed: onPlayTap,
                        icon: SvgPicture.asset(AppImages.icNext),
                      ),
                    ],
                  ),

                  // Bottom Progress Bar
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: ShapeDecoration(
                      color: Color(0x3395AB99),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          currentTime,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                            letterSpacing: 0.10,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '/',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                            letterSpacing: 0.10,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          totalDuration,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Video Title
      ],
    );
  }
}
