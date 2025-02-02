import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/presentation/common/widgets/dua_category_card.dart';
import 'package:dua/presentation/ruqyah_video/presenter/video_play_list_presenter.dart';
import 'package:dua/presentation/ruqyah_video/widgets/featured_lecture_card.dart';
import 'package:dua/presentation/ruqyah_video/widgets/section_title.dart';
import 'package:dua/presentation/ruqyah_video/widgets/video_lecture_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayListPage extends StatelessWidget {
  const VideoPlayListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoPlayListPresenter());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// ✅ **VideoLecturePlayer will remain fixed at the top**
            Obx(
              () => VideoLecturePlayer(
                thumbnailUrl: AppImages.videoThumbnail,
                currentTime: controller.currentTime.value,
                totalDuration: controller.totalDuration.value,
                title: controller.videoTitle.value,
                onPlayTap: controller.playVideo,
                onSettingsTap: controller.openSettings,
                onBackTap: controller.goBack,
              ),
            ),

            /// ✅ **Scrollable Content**
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: twentyFourPx, vertical: twelvePx),
                          child: Text(
                            controller.videoTitle.value,
                            style: TextStyle(
                              fontSize: fourteenPx,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _buildFeaturedLectures(controller),
                        gapH14,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionTitle(title: 'Other Playlist'),
                              const SizedBox(height: 16),
                              _buildPlaylistSection(controller),
                            ],
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
      ),
    );
  }

  Widget _buildFeaturedLectures(VideoPlayListPresenter presenter) {
    return SizedBox(
      height: twoHundredSeventyPx,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: sixteenPx),
        itemCount: presenter.featuredLectures.length,
        itemBuilder: (context, index) {
          final lecture = presenter.featuredLectures[index];
          return Row(
            children: [
              gapW16,
              FeaturedLectureCard(
                thumbnailUrl: lecture['thumbnailUrl'] ?? '',
                duration: lecture['duration'] ?? '00:00:00',
                title: lecture['title'] ?? 'Untitled Lecture',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPlaylistSection(VideoPlayListPresenter presenter) {
    return Obx(
      () => Column(
        children: presenter.categories
            .map((category) =>
                DuaCategoryCard(category: category, showDetails: false))
            .toList(),
      ),
    );
  }
}
