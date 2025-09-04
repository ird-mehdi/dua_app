import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:flutter/material.dart';

class AllDuasUiState extends BaseUiState {
  const AllDuasUiState({
    required super.isLoading,
    super.userMessage,
    this.duas = const [], // Default to empty list
    this.selectedLanguage = 'en', // Default to English
    this.searchQuery = '',
    this.selectedCharacter,
    this.alphabetLetters = const [], // Default to empty list
    this.currentDragLetter, // Added
    this.overlayEntry, // Added
  });

  final List<DuaEntity> duas;
  final String selectedLanguage; // 'en' for English, 'bn' for Bangla
  final String searchQuery;
  final String? selectedCharacter;
  final List<String> alphabetLetters;
  final String? currentDragLetter; // Added: Letter being dragged over scrollbar
  final OverlayEntry? overlayEntry; // Added: Overlay for dragged letter

  factory AllDuasUiState.empty() {
    return const AllDuasUiState(
      isLoading: false,
      userMessage: null, // Use null for no message
      duas: [],
      selectedLanguage: 'en',
      searchQuery: '',
      selectedCharacter: null,
      alphabetLetters: [], // Initialize as empty, presenter calculates it
      currentDragLetter: null, // Added
      overlayEntry: null, // Added
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
        alphabetLetters,
        currentDragLetter, // Added
        overlayEntry, // Added
      ];

  AllDuasUiState copyWith({
    bool? isLoading,
    // Allow clearing userMessage by passing null explicitly
    ValueGetter<String?>? userMessage,
    List<DuaEntity>? duas,
    String? selectedLanguage,
    String? searchQuery,
    // Allow clearing selectedCharacter by passing null explicitly
    ValueGetter<String?>? selectedCharacter,
    List<String>? alphabetLetters,
    // Allow clearing currentDragLetter by passing null explicitly
    ValueGetter<String?>? currentDragLetter,
    // Allow clearing overlayEntry by passing null explicitly
    ValueGetter<OverlayEntry?>? overlayEntry,
  }) {
    return AllDuasUiState(
      isLoading: isLoading ?? this.isLoading,
      // Use ValueGetter pattern for nullable fields to allow setting them to null
      userMessage: userMessage != null ? userMessage() : this.userMessage,
      duas: duas ?? this.duas,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCharacter: selectedCharacter != null
          ? selectedCharacter()
          : this.selectedCharacter,
      alphabetLetters: alphabetLetters ?? this.alphabetLetters,
      currentDragLetter: currentDragLetter != null
          ? currentDragLetter()
          : this.currentDragLetter,
      overlayEntry: overlayEntry != null ? overlayEntry() : this.overlayEntry,
    );
  }
}
