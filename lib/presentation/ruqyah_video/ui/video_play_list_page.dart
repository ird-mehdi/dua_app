import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/presentation/common/widgets/dua_category_card.dart';
import 'package:dua/presentation/ruqyah_video/presenter/video_play_list_presenter.dart';
import 'package:dua/presentation/ruqyah_video/widgets/featured_lecture_card.dart';
import 'package:dua/presentation/ruqyah_video/widgets/section_title.dart';
import 'package:dua/presentation/ruqyah_video/widgets/video_lecture_player.dart';
import 'package:flutter/material.dart';
import 'package:dua/core/config/dua_custom_text_theme.dart';

class VideoPlayListPage extends StatelessWidget {
  const VideoPlayListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = locate<VideoPlayListPresenter>();

    return PresentableWidgetBuilder<VideoPlayListPresenter>(
      presenter: presenter,
      builder: () => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              VideoLecturePlayer(
                thumbnailUrl: presenter.currentUiState.imageUrl,
                currentTime: presenter.currentUiState.currentTime,
                totalDuration: presenter.currentUiState.totalDuration,
                onPlayTap: presenter.playVideo,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: twentyFourPx,
                          vertical: twelvePx,
                        ),
                        child: Text(
                          presenter.currentUiState.videoTitle,
                          style: Theme.of(context)
                              .extension<DuaCustomTextTheme>()
                              ?.videoTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      _buildFeaturedLectures(presenter),
                      gapH14,
                      Padding(
                        padding: paddingH16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle(title: 'Other Playlist'),
                            gapH16,
                            _buildPlaylistSection(presenter),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedLectures(VideoPlayListPresenter presenter) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sixteenPx),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: presenter.featuredLectures
              .map((lecture) => Padding(
                    padding: EdgeInsets.only(left: sixteenPx),
                    child: FeaturedLectureCard(
                      thumbnailUrl: lecture['thumbnailUrl'] ?? '',
                      duration: lecture['duration'] ?? '00:00:00',
                      title: lecture['title'] ?? 'Untitled Lecture',
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildPlaylistSection(VideoPlayListPresenter presenter) {
    return Column(
      children: presenter.currentUiState.categories
          .map((category) =>
              DuaCategoryCard(category: category, showDetails: false))
          .toList(),
    );
  }
}
