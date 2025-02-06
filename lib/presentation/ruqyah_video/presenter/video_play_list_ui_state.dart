import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/domain/entities/category_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayListUiState extends BaseUiState {
  const VideoPlayListUiState({
    required super.isLoading,
    required super.userMessage,
    required this.videoTitle,
    required this.currentTime,
    required this.totalDuration,
    required this.categories,
    required this.duration,
    required this.imageUrl,
    this.context,
  });

  factory VideoPlayListUiState.empty() {
    return VideoPlayListUiState(
      isLoading: false,
      userMessage: '',
      videoTitle:
          'THIS LECTURE IS CAPABLE OF CHANGING ANY MUSLIM - MOHAMMAD HOBLOS',
      currentTime: '00:03:59',
      totalDuration: '00:43:59',
      duration: '00:43:59',
      imageUrl: AppImages.videoThumbnail,
      context: null,
      categories: <CategoryData>[
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
      ],
    );
  }

  final BuildContext? context;
  final String videoTitle;
  final String currentTime;
  final String totalDuration;
  final List<CategoryData> categories;
  final String duration;
  final String imageUrl;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        videoTitle,
        currentTime,
        totalDuration,
        categories,
        context,
        duration,
        imageUrl,
      ];

  VideoPlayListUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
    String? videoTitle,
    String? currentTime,
    String? totalDuration,
    List<CategoryData>? categories,
    String? duration,
    String? imageUrl,
  }) {
    return VideoPlayListUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
      videoTitle: videoTitle ?? this.videoTitle,
      currentTime: currentTime ?? this.currentTime,
      totalDuration: totalDuration ?? this.totalDuration,
      categories: categories ?? this.categories,
      duration: duration ?? this.duration,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
