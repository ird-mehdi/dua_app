import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/core/config/app_images.dart';
import 'package:dua/domain/entities/category_data_entity.dart';
import 'package:flutter/material.dart';

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
      categories: [],
      duration: '00:43:59',
      imageUrl: AppImages.videoThumbnail,
      context: null,
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
