import 'package:dua/core/base/base_ui_state.dart';

class SettingsUiState extends BaseUiState {
  const SettingsUiState({
    required super.isLoading,
    required super.userMessage,
    required this.showArabic,
    required this.showTranslation,
    required this.showReference,
    required this.keepScreenOn,
    required this.arabicFontSize,
    required this.translationFontSize,
    required this.selectedAppearance,
  });

  final bool showArabic;
  final bool showTranslation;
  final bool showReference;
  final bool keepScreenOn;
  final double arabicFontSize;
  final double translationFontSize;
  final int selectedAppearance;

  // Factory to create the initial state
  factory SettingsUiState.initial() => const SettingsUiState(
        isLoading: false,
        userMessage: null,
        showArabic: true,
        showTranslation: false,
        showReference: false,
        keepScreenOn: false,
        arabicFontSize: 28.0,
        translationFontSize: 28.0,
        selectedAppearance: 0,
      );

  // Copy with method to create a new instance with updated values
  SettingsUiState copyWith({
    bool? isLoading,
    String? userMessage,
    bool? showArabic,
    bool? showTranslation,
    bool? showReference,
    bool? keepScreenOn,
    double? arabicFontSize,
    double? translationFontSize,
    int? selectedAppearance,
  }) {
    return SettingsUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      showArabic: showArabic ?? this.showArabic,
      showTranslation: showTranslation ?? this.showTranslation,
      showReference: showReference ?? this.showReference,
      keepScreenOn: keepScreenOn ?? this.keepScreenOn,
      arabicFontSize: arabicFontSize ?? this.arabicFontSize,
      translationFontSize: translationFontSize ?? this.translationFontSize,
      selectedAppearance: selectedAppearance ?? this.selectedAppearance,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        showArabic,
        showTranslation,
        showReference,
        keepScreenOn,
        arabicFontSize,
        translationFontSize,
        selectedAppearance,
      ];
}
