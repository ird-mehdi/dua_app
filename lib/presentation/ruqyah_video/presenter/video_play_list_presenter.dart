import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/domain/entities/category_data_entity.dart';
import 'package:get/get.dart';

class VideoPlayListPresenter extends GetxController {
  var videoTitle =
      'THIS LECTURE IS CAPABLE OF CHANGING ANY MUSLIM - MOHAMMAD HOBLOS'.obs;
  var currentTime = '00:03:59'.obs;
  var totalDuration = '00:43:59'.obs;

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

  final categories = <CategoryData>[
    CategoryData(
      icon: AppImages.icMedicine,
      bgColor: Get.context!.color.quickAccessColor1,
      title: 'Introduction to Ruqyah',
      subtitle: '7 Subcategories',
    ),
    CategoryData(
      icon: AppImages.icInstantRuqyah,
      bgColor: Get.context!.color.quickAccessColor2,
      title: 'Instant Ruqyah',
      subtitle: '10 Subcategories',
    ),
    CategoryData(
      icon: AppImages.icLantern,
      bgColor: Get.context!.color.quickAccessColor3,
      title: 'Time of Dua',
      subtitle: '5 Subcategories',
    ),
    CategoryData(
      icon: AppImages.icKaaba,
      bgColor: Get.context!.color.quickAccessColor4,
      title: 'Hazz & Umrah',
      subtitle: '9 Subcategories',
    ),
    CategoryData(
      icon: AppImages.icKaaba,
      bgColor: Get.context!.color.quickAccessColor5,
      title: 'Witr & Other',
      subtitle: '30 Subcategories',
    ),
    CategoryData(
      icon: AppImages.icMedicine,
      bgColor: Get.context!.color.quickAccessColor6,
      title: 'Fasting',
      subtitle: '12 Subcategories',
    ),
    CategoryData(
      icon: AppImages.icMedicine,
      bgColor: Get.context!.color.quickAccessColor6,
      title: 'Ablution & Bath',
      subtitle: '15 Subcategories',
    ),
  ].obs;
}
