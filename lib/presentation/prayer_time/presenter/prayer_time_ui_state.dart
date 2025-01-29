import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class PrayerTimeUiState extends BaseUiState {
  const PrayerTimeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.count,
    required this.showArabic,
    required this.showTranslation,
    required this.showReference,
    required this.arabicFontSize,
    required this.translationFontSize,
    required this.selectedFont,
    this.context,
  });

  factory PrayerTimeUiState.empty() {
    return PrayerTimeUiState(
      isLoading: false,
      userMessage: '',
      context: null,
      count: 0,
      showArabic: false,
      showTranslation: false,
      showReference: false,
      arabicFontSize: 16,
      translationFontSize: 16,
      selectedFont: 'Uthma',
    );
  }

  final BuildContext? context;
  final int count;
  final bool showArabic;
  final bool showTranslation;
  final bool showReference;
  final double arabicFontSize;
  final double translationFontSize;
  final String selectedFont;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
        count,
        showArabic,
        showTranslation,
        showReference,
        arabicFontSize,
        translationFontSize,
        selectedFont,
      ];

  PrayerTimeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
    int? count,
    bool? showArabic,
    bool? showTranslation,
    bool? showReference,
    double? arabicFontSize,
    double? translationFontSize,
    String? selectedFont,
  }) {
    return PrayerTimeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
      count: count ?? this.count,
      showArabic: showArabic ?? this.showArabic,
      showTranslation: showTranslation ?? this.showTranslation,
      showReference: showReference ?? this.showReference,
      arabicFontSize: arabicFontSize ?? this.arabicFontSize,
      translationFontSize: translationFontSize ?? this.translationFontSize,
      selectedFont: selectedFont ?? this.selectedFont,
    );
  }
}
