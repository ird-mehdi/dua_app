import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/services/dua_cache_service.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/use_cases/dua/get_all_dua.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_ui_state.dart';
import 'package:flutter/foundation.dart';

class AllDuasPresenter extends BasePresenter<AllDuasUiState> {
  final GetAllDuaUseCase getAllDuas;
  final DuaCacheService _cacheService;

  final Obs<AllDuasUiState> uiState = Obs(AllDuasUiState.empty());

  AllDuasUiState get currentUiState => uiState.value;
  List<DuaEntity> _allDuas = [];
  bool _isLoading = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;

  // Improve caching with memory management
  final Map<String, double> _letterPositions = {};
  final Map<String, List<DuaEntity>> _filteredCache = {};

  // Optimize memory usage with lazy loading

  AllDuasPresenter(this.getAllDuas, this._cacheService);

  @override
  void onInit() {
    super.onInit();
    currentUiState.scrollController?.addListener(_optimizedScrollListener);
    _fetchAllDuas();
  }

  @override
  void onClose() {
    currentUiState.scrollController?.removeListener(_optimizedScrollListener);
    currentUiState.scrollController?.dispose();
    _clearCaches();
    super.onClose();
  }

  // Use throttled scroll listener to improve performance
  DateTime _lastScrollUpdate = DateTime.now();
  void _optimizedScrollListener() {
    // Skip processing if scrolling too frequently (throttling)
    final now = DateTime.now();
    if (now.difference(_lastScrollUpdate).inMilliseconds < 100) {
      return;
    }
    _lastScrollUpdate = now;

    _handleScroll();
  }

  void _clearCaches() {
    _letterPositions.clear();
    _filteredCache.clear();
  }

  void _handleScroll() {
    if (_isLoading || currentUiState.scrollController == null) return;

    final scrollPosition = currentUiState.scrollController!.offset;
    String? activeChar;

    // Use cached letter positions if available
    if (_letterPositions.isNotEmpty) {
      for (final entry in _letterPositions.entries) {
        if (scrollPosition >= entry.value &&
            (scrollPosition < entry.value + 100 ||
                entry.key == _letterPositions.keys.last)) {
          activeChar = entry.key;
          break;
        }
      }
    }

    if (activeChar != null && activeChar != currentUiState.selectedCharacter) {
      uiState.value = currentUiState.copyWith(selectedCharacter: activeChar);
    }
  }

  Future<void> _fetchAllDuas() async {
    if (_isLoading) return;

    _isLoading = true;
    uiState.value = currentUiState.copyWith(isLoading: true);

    try {
      // Try to get cached data first
      final cachedDuas = await _cacheService.getCachedDuas();
      if (cachedDuas != null) {
        _allDuas = cachedDuas;
        await _updateUiStateWithDuas(cachedDuas);
        _isLoading = false;
        return;
      }

      final result = await getAllDuas();

      result.fold(
        (error) {
          uiState.value = currentUiState.copyWith(
            isLoading: false,
            userMessage: error,
          );

          if (_retryCount < _maxRetries) {
            _retryCount++;
            Future.delayed(Duration(seconds: 1), _fetchAllDuas);
          }
        },
        (duas) async {
          _allDuas = duas;
          await _cacheService.cacheDuas(duas);
          await _updateUiStateWithDuas(duas);
          _retryCount = 0;
        },
      );
    } catch (e) {
      uiState.value = currentUiState.copyWith(
        isLoading: false,
        userMessage: 'Failed to load duas: $e',
      );

      if (_retryCount < _maxRetries) {
        _retryCount++;
        Future.delayed(Duration(seconds: 1), _fetchAllDuas);
      }
    } finally {
      _isLoading = false;
    }
  }

  // Use compute to move heavy processing to a separate isolate
  Future<void> _updateUiStateWithDuas(List<DuaEntity> duas) async {
    if (duas.isEmpty) {
      uiState.value = currentUiState.copyWith(isLoading: false, duas: []);
      return;
    }

    // Process alphabet data in a separate isolate for large datasets
    final result = await compute(_processAlphabetData, duas);

    uiState.value = currentUiState.copyWith(
      isLoading: false,
      duas: duas,
      alphabetLetters: result.letters,
    );

    _letterPositions.clear();
    _letterPositions.addAll(result.positions);

    await _applyFilters();
  }

  // This is a separate pure function that can run in an isolate
  static _AlphabetProcessResult _processAlphabetData(List<DuaEntity> duas) {
    final availableLetters = <String>{};
    final Map<String, double> positions = {};

    for (var dua in duas) {
      if (dua.name.isNotEmpty) {
        availableLetters.add(dua.name[0].toUpperCase());
      }
    }

    final letters = availableLetters.toList()..sort();

    // Pre-calculate letter positions
    final Map<String, int> letterCounts = {};
    for (var dua in duas) {
      if (dua.name.isNotEmpty) {
        final letter = dua.name[0].toUpperCase();
        letterCounts[letter] = (letterCounts[letter] ?? 0) + 1;
      }
    }

    double position = 0;
    for (final letter in letters) {
      positions[letter] = position;
      final count = letterCounts[letter] ?? 0;
      position += 50 + (count * 60); // header + items
    }

    return _AlphabetProcessResult(letters, positions);
  }

  Future<void> _applyFilters() async {
    if (_allDuas.isEmpty) {
      uiState.value = currentUiState.copyWith(
        isLoading: false,
        duas: [],
      );
      return;
    }

    // Check if we have cached results for this filter combination
    final cacheKey =
        '${currentUiState.selectedLanguage}_${currentUiState.searchQuery}';
    if (_filteredCache.containsKey(cacheKey)) {
      uiState.value = currentUiState.copyWith(
        isLoading: false,
        duas: _filteredCache[cacheKey],
      );
      return;
    }

    // For large datasets, use compute to filter in a separate isolate
    final filteredDuas = await compute(
      _filterDuas,
      _FilterParams(
        duas: _allDuas,
        languageId: currentUiState.selectedLanguage,
        searchQuery: currentUiState.searchQuery,
      ),
    );

    // Cache the filtered results
    _filteredCache[cacheKey] = filteredDuas;

    uiState.value = currentUiState.copyWith(
      isLoading: false,
      duas: filteredDuas,
    );
  }

  // Pure function for filtering in an isolate
  static List<DuaEntity> _filterDuas(_FilterParams params) {
    return params.duas.where((dua) {
      final languageMatches = dua.languageId == params.languageId;
      final searchQuery = params.searchQuery.toLowerCase();
      final nameMatches =
          searchQuery.isEmpty || dua.name.toLowerCase().contains(searchQuery);

      return languageMatches && nameMatches;
    }).toList();
  }

  void selectCharacter(String character) {
    if (currentUiState.scrollController == null) return;

    final position = _letterPositions[character] ?? 0;
    currentUiState.scrollController?.jumpTo(position);

    uiState.value = currentUiState.copyWith(selectedCharacter: character);
  }

  void toggleLanguage() {
    final newLanguage = currentUiState.selectedLanguage == 'bn' ? 'en' : 'bn';
    uiState.value = currentUiState.copyWith(selectedLanguage: newLanguage);
    _applyFilters();
  }

  void updateSearchQuery(String query) {
    uiState.value = currentUiState.copyWith(searchQuery: query);
    _applyFilters();
  }

  @override
  void refresh() {
    _retryCount = 0;
    _clearCaches();
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

// Helper classes for isolate processing
class _AlphabetProcessResult {
  final List<String> letters;
  final Map<String, double> positions;

  _AlphabetProcessResult(this.letters, this.positions);
}

class _FilterParams {
  final List<DuaEntity> duas;
  final String languageId;
  final String searchQuery;

  _FilterParams({
    required this.duas,
    required this.languageId,
    required this.searchQuery,
  });
}
