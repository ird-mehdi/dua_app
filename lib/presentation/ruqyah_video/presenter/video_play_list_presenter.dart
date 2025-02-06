import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/ruqyah_video/presenter/video_play_list_ui_state.dart';
import 'package:get/get.dart';

class VideoPlayListPresenter extends BasePresenter<VideoPlayListUiState> {
  VideoPlayListPresenter();

  final Obs<VideoPlayListUiState> uiState = Obs(VideoPlayListUiState.empty());

  VideoPlayListUiState get currentUiState => uiState.value;

  void playVideo() {
    // Handle play button tap
  }

  void openSettings() {
    // Handle settings button tap
  }

  void goBack() {
    Get.back();
  }

  List<Map<String, String>> get featuredLectures => [
        {
          'thumbnailUrl': AppImages.videoThumbnail3,
          'duration': '00:43:59',
          'title': 'PROPHET (ﷺ) WARNED EVERY MUSLIM OF 2 WOLVES',
        },
        {
          'thumbnailUrl': AppImages.videoThumbnail2,
          'duration': '00:43:59',
          'title':
              'THIS LECTURE IS CAPABLE OF CHANGING ANY MUSLIM - MOHAMMAD HOBLOS',
        },
        {
          'thumbnailUrl': AppImages.videoThumbnail4,
          'duration': '00:43:59',
          'title': 'PROPHET (ﷺ) WARNED EVERY MUSLIM OF 2 WOLVES',
        },
        {
          'thumbnailUrl': AppImages.videoThumbnail2,
          'duration': '00:43:59',
          'title':
              'THIS LECTURE IS CAPABLE OF CHANGING ANY MUSLIM - MOHAMMAD HOBLOS',
        },
      ];

  @override
  Future<void> addUserMessage(String message) {
    return showMessage(message: message, context: currentUiState.context);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
