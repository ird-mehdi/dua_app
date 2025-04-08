import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/domain/entities/dua_entity.dart';

class AllDuasUiState extends BaseUiState {
  const AllDuasUiState({
    required super.isLoading,
    super.userMessage,
    this.duas,
    this.selectedLanguage = 'bn', // Default to Bangla
    this.searchQuery = '',
  });

  final List<DuaEntity>? duas;
  final String selectedLanguage; // 'en' for English, 'bn' for Bangla
  final String searchQuery;

  factory AllDuasUiState.empty() {
    return const AllDuasUiState(
      isLoading: false,
      userMessage: '',
      duas: [],
      selectedLanguage: 'bn',
      searchQuery: '',
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        duas,
        selectedLanguage,
        searchQuery,
      ];

  AllDuasUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<DuaEntity>? duas,
    String? selectedLanguage,
    String? searchQuery,
  }) {
    return AllDuasUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      duas: duas ?? this.duas,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}