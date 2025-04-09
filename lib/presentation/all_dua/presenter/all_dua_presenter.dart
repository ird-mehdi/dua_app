import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/use_cases/dua/get_all_dua.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_ui_state.dart';
import 'package:flutter/material.dart';

class AllDuasPresenter extends BasePresenter<AllDuasUiState> {
  final GetAllDuaUseCase getAllDuas;

  final Obs<AllDuasUiState> uiState = Obs(AllDuasUiState.empty());

  AllDuasUiState get currentUiState => uiState.value;
  List<DuaEntity> _allDuas = []; // Store all duas to filter locally
  bool _isLoading = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;

  AllDuasPresenter(this.getAllDuas);

  @override
  void onInit() {
    super.onInit();
    _fetchAllDuas();
  }

  Future<void> _fetchAllDuas() async {
    if (_isLoading) return;

    _isLoading = true;
    uiState.value = currentUiState.copyWith(isLoading: true);

    try {
      final result = await getAllDuas();

      result.fold(
        (error) {
          uiState.value = currentUiState.copyWith(
            isLoading: false,
            userMessage: error,
          );

          // Retry if we still have attempts left and got an error
          if (_retryCount < _maxRetries) {
            _retryCount++;
            Future.delayed(Duration(seconds: 1), _fetchAllDuas);
          }
        },
        (duas) {
          _allDuas = duas;

          if (duas.isEmpty && _retryCount < _maxRetries) {
            // Retry if we got an empty list
            _retryCount++;
            Future.delayed(Duration(seconds: 1), _fetchAllDuas);
            return;
          }

          if (duas.isNotEmpty) {
          } else {
          }

          _applyFilters();
          _retryCount = 0; // Reset retry count on success
        },
      );
    } catch (e) {
      uiState.value = currentUiState.copyWith(
        isLoading: false,
        userMessage: 'Failed to load duas: $e',
      );

      // Retry if we still have attempts left
      if (_retryCount < _maxRetries) {
        _retryCount++;
        Future.delayed(Duration(seconds: 1), _fetchAllDuas);
      }
    } finally {
      _isLoading = false;
    }
  }

  // Apply both language and search filters
  void _applyFilters() {
    if (_allDuas.isEmpty) {
      uiState.value = currentUiState.copyWith(
        isLoading: false,
        duas: [],
      );
      return;
    }


    final filteredDuas = _allDuas.where((dua) {
      // Filter by language
      final languageMatches = dua.languageId == currentUiState.selectedLanguage;

      // Filter by search query if provided
      final searchQuery = currentUiState.searchQuery.toLowerCase();
      final nameMatches =
          searchQuery.isEmpty || dua.name.toLowerCase().contains(searchQuery);

      return languageMatches && nameMatches;
    }).toList();


    uiState.value = currentUiState.copyWith(
      isLoading: false,
      duas: filteredDuas,
    );
  }

  void selectCharacter(String character) {
    uiState.value = currentUiState.copyWith(selectedCharacter: character);
    // Scroll to the selected character's section
    scrollToCharacter(character);
  }

  void scrollToCharacter(String character) {
    // Calculate and find position to scroll
    double position = 0;

    // Simply calculate a rough position based on the character index
    final int characterIndex =
        currentUiState.alphabetLetters?.indexOf(character) ?? 0;
    // Rough estimation of position - we can refine this as needed
    position = characterIndex * 100; // Estimated height per section

    // Scroll to calculated position
    currentUiState.scrollController?.animateTo(
      position,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Toggle between Bangla and English
  void toggleLanguage() {
    final newLanguage = currentUiState.selectedLanguage == 'bn' ? 'en' : 'bn';
    uiState.value = currentUiState.copyWith(selectedLanguage: newLanguage);
    _applyFilters();
  }

  // Update search query
  void updateSearchQuery(String query) {
    uiState.value = currentUiState.copyWith(searchQuery: query);
    _applyFilters();
  }

  @override
  void refresh() {
    _retryCount = 0;
    _fetchAllDuas();
  }

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = currentUiState.copyWith(userMessage: message);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
