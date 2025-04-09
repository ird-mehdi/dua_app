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
    required this.selectedScriptType,
    required this.selectedFont,
  });

  final bool showArabic;
  final bool showTranslation;
  final bool showReference;
  final bool keepScreenOn;
  final double arabicFontSize;
  final double translationFontSize;
  final int selectedAppearance;
  final String selectedScriptType;
  final String selectedFont;

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
        selectedScriptType: 'Uthmanic',
        selectedFont: 'KFG Hafs',
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
    String? selectedScriptType,
    String? selectedFont,
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
      selectedScriptType: selectedScriptType ?? this.selectedScriptType,
      selectedFont: selectedFont ?? this.selectedFont,
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
        selectedScriptType,
        selectedFont,
      ];
}
