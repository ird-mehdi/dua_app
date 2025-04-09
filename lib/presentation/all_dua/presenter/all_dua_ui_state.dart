import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:flutter/material.dart';

class AllDuasUiState extends BaseUiState {
  const AllDuasUiState({
    required super.isLoading,
    super.userMessage,
    this.duas,
    this.selectedLanguage = 'en', // Default to English
    this.searchQuery = '',
    this.selectedCharacter,
    this.scrollController,
    this.alphabetLetters,
  });

  final List<DuaEntity>? duas;
  final String selectedLanguage; // 'en' for English, 'bn' for Bangla
  final String searchQuery;
  final String? selectedCharacter;
  final ScrollController? scrollController;
  final List<String>? alphabetLetters;

  factory AllDuasUiState.empty() {
    return AllDuasUiState(
      isLoading: false,
      userMessage: '',
      duas: const [],
      selectedLanguage: 'en', // Default to English
      searchQuery: '',
      selectedCharacter: null,
      scrollController: ScrollController(),
      // Keep full alphabet but it will be filtered based on available letters
      alphabetLetters: [
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
        'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
        'U', 'V', 'W', 'X', 'Y', 'Z'
      ],
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        duas,
        selectedLanguage,
        searchQuery,
        selectedCharacter,
        scrollController,
        alphabetLetters,
      ];

  AllDuasUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<DuaEntity>? duas,
    String? selectedLanguage,
    String? searchQuery,
    String? selectedCharacter,
    ScrollController? scrollController,
    List<String>? alphabetLetters,
  }) {
    return AllDuasUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      duas: duas ?? this.duas,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCharacter: selectedCharacter ?? this.selectedCharacter,
      scrollController: scrollController ?? this.scrollController,
      alphabetLetters: alphabetLetters ?? this.alphabetLetters,
    );
  }
}
