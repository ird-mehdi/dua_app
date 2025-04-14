import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/services/dua_cache_service.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/use_cases/dua/get_all_dua.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_ui_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dua/core/external_libs/scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:dua/core/utility/ui_helper.dart';

// Static class for filter parameters
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

class AllDuasPresenter extends BasePresenter<AllDuasUiState> {
  final GetAllDuaUseCase getAllDuas;
  final DuaCacheService _cacheService;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  final Obs<AllDuasUiState> uiState = Obs(AllDuasUiState.empty());

  AllDuasUiState get currentUiState => uiState.value;
  List<DuaEntity> _allDuas = [];
  List<_ListSection> _groupedData = [];
  bool _isLoading = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;

  // Cache for filtered results
  final Map<String, List<DuaEntity>> _filteredCache = {};
  // Cache for letter indices (index of the header in _groupedData)
  final Map<String, int> _letterIndices = {};

  AllDuasPresenter(this.getAllDuas, this._cacheService);

  @override
  void onInit() {
    super.onInit();
    // Listener to update selected character based on scroll position
    itemPositionsListener.itemPositions
        .addListener(_updateSelectedCharacterFromScroll);
    _fetchAllDuas();
  }

  @override
  void onClose() {
    itemPositionsListener.itemPositions
        .removeListener(_updateSelectedCharacterFromScroll);
    _clearCaches();
    currentUiState.overlayEntry?.remove();
    super.onClose();
  }

  // Update selected character based on visible items
  void _updateSelectedCharacterFromScroll() {
    if (_isLoading || !itemScrollController.isAttached) return;

    final positions = itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) return;

    // Find the first visible item's index
    final firstVisibleItemIndex = positions
        .where((position) => position.itemLeadingEdge < 1)
        .map((position) => position.index)
        .reduce((min, index) => index < min ? index : min);

    // Find the corresponding letter for this index
    String? activeChar;
    if (firstVisibleItemIndex >= 0 &&
        firstVisibleItemIndex < _groupedData.length) {
      for (int i = firstVisibleItemIndex; i >= 0; i--) {
        if (_groupedData[i].isHeader) {
          activeChar = _groupedData[i].letter;
          break;
        }
      }
      if (activeChar == null && _groupedData[firstVisibleItemIndex].isHeader) {
        activeChar = _groupedData[firstVisibleItemIndex].letter;
      }
    }

    if (activeChar != null && activeChar != currentUiState.selectedCharacter) {
      UiHelper.doOnPageLoaded(() {
        if (activeChar != currentUiState.selectedCharacter) {
          uiState.value =
              currentUiState.copyWith(selectedCharacter: () => activeChar);
        }
      });
    }
  }

  void _clearCaches() {
    _letterIndices.clear();
    _filteredCache.clear();
    _groupedData.clear();
  }

  Future<void> _fetchAllDuas() async {
    if (_isLoading) return;

    _isLoading = true;
    uiState.value = currentUiState.copyWith(isLoading: true);

    try {
      final cachedDuas = await _cacheService.getCachedDuas();
      if (cachedDuas != null && cachedDuas.isNotEmpty) {
        _allDuas = cachedDuas;
        await _processAndUpdateUiState(_allDuas);
        _isLoading = false;
        _retryCount = 0;
        return;
      }

      final result = await getAllDuas();

      result.fold(
        (error) {
          _handleFetchError(error);
        },
        (duas) async {
          _allDuas = duas;
          await _cacheService.cacheDuas(duas);
          await _processAndUpdateUiState(duas);
          _retryCount = 0;
        },
      );
    } catch (e) {
      _handleFetchError('Failed to load duas: $e');
    } finally {
      if (_retryCount >= _maxRetries || !_isLoading) {
        UiHelper.doOnPageLoaded(() {
          if (uiState.value.isLoading) {
            uiState.value = currentUiState.copyWith(isLoading: false);
          }
        });
        _isLoading = false;
      }
    }
  }

  void _handleFetchError(String error) {
    _isLoading = false;
    if (_retryCount < _maxRetries) {
      _retryCount++;
      uiState.value = currentUiState.copyWith(
        isLoading: false,
        userMessage: () => '$error Retrying (${_retryCount}/${_maxRetries})...',
      );
      Future.delayed(const Duration(seconds: 2), _fetchAllDuas);
      _isLoading = true;
    } else {
      uiState.value = currentUiState.copyWith(
        isLoading: false,
        userMessage: () => error,
        duas: [],
        alphabetLetters: [],
      );
    }
  }

  Future<void> _processAndUpdateUiState(List<DuaEntity> duas) async {
    if (duas.isEmpty) {
      _groupedData = [];
      _letterIndices.clear();
      uiState.value = currentUiState.copyWith(
        isLoading: false,
        duas: [],
        alphabetLetters: [],
        selectedCharacter: () => null,
      );
      return;
    }

    final result = await compute(_computeGroupedDataAndAlphabet, duas);

    _groupedData = result.groupedData;
    _letterIndices.clear();
    _letterIndices.addAll(result.letterIndices);

    uiState.value = currentUiState.copyWith(
      isLoading: false,
      duas: duas,
      alphabetLetters: result.letters,
      selectedCharacter:
          result.letters.isNotEmpty ? () => result.letters.first : () => null,
    );

    await _applyFilters();
  }

  static _ProcessResult _computeGroupedDataAndAlphabet(List<DuaEntity> duas) {
    final Map<String, List<DuaEntity>> groupedDuasMap = {};
    final availableLetters = <String>{};

    for (var dua in duas) {
      if (dua.name.isNotEmpty) {
        final firstLetter = dua.name[0].toUpperCase();
        availableLetters.add(firstLetter);
        groupedDuasMap.putIfAbsent(firstLetter, () => []).add(dua);
      }
    }

    final sortedLetters = availableLetters.toList()..sort();
    final List<_ListSection> groupedDataList = [];
    final Map<String, int> letterIndices = {};

    for (final letter in sortedLetters) {
      letterIndices[letter] = groupedDataList.length;
      groupedDataList.add(_ListSection(letter: letter, isHeader: true));

      for (final dua in groupedDuasMap[letter]!) {
        groupedDataList.add(_ListSection(dua: dua, isHeader: false));
      }
    }

    return _ProcessResult(
      groupedData: groupedDataList,
      letters: sortedLetters,
      letterIndices: letterIndices,
    );
  }

  Future<void> _applyFilters() async {
    final cacheKey =
        '${currentUiState.selectedLanguage}_${currentUiState.searchQuery}';
    if (_filteredCache.containsKey(cacheKey)) {
      final cachedFilteredDuas = _filteredCache[cacheKey]!;
      await _processAndUpdateUiState(cachedFilteredDuas);
      return;
    }

    final filteredDuas = await compute(
      _filterDuas,
      _FilterParams(
        duas: _allDuas,
        languageId: currentUiState.selectedLanguage,
        searchQuery: currentUiState.searchQuery,
      ),
    );

    _filteredCache[cacheKey] = filteredDuas;

    await _processAndUpdateUiState(filteredDuas);
  }

  static List<DuaEntity> _filterDuas(_FilterParams params) {
    if (params.searchQuery.isEmpty) {
      return params.duas
          .where((dua) => dua.languageId == params.languageId)
          .toList();
    }

    final searchQueryLower = params.searchQuery.toLowerCase();
    return params.duas.where((dua) {
      final languageMatches = dua.languageId == params.languageId;
      final nameMatches = dua.name.toLowerCase().contains(searchQueryLower);
      return languageMatches && nameMatches;
    }).toList();
  }

  void selectCharacter(String character) {
    if (!itemScrollController.isAttached) return;

    final index = _letterIndices[character];
    if (index != null) {
      itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        alignment: 0,
      );
      uiState.value =
          currentUiState.copyWith(selectedCharacter: () => character);
    }
  }

  void toggleLanguage() {
    final newLanguage = currentUiState.selectedLanguage == 'bn' ? 'en' : 'bn';
    _filteredCache.clear();
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
    _allDuas.clear();
    uiState.value = AllDuasUiState.empty().copyWith(isLoading: true);
    _fetchAllDuas();
  }

  @override
  Future<void> addUserMessage(String message) async {
    UiHelper.doOnPageLoaded(() {
      uiState.value = currentUiState.copyWith(userMessage: () => message);
    });
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    UiHelper.doOnPageLoaded(() {
      uiState.value = currentUiState.copyWith(isLoading: loading);
    });
  }

  String? get currentDragLetter => currentUiState.currentDragLetter;
  List<String> get letters => currentUiState.alphabetLetters;

  void handleDragStart(DragStartDetails details, BuildContext context) {
    _handleDragUpdate(details.globalPosition, context);
  }

  void handleDragUpdate(DragUpdateDetails details, BuildContext context) {
    _handleDragUpdate(details.globalPosition, context);
  }

  void handleTapDown(TapDownDetails details, BuildContext context) {
    _handleDragUpdate(details.globalPosition, context);
  }

  void _handleDragUpdate(Offset globalPosition, BuildContext context) {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null || letters.isEmpty) return;

    final Offset localPosition = box.globalToLocal(globalPosition);
    final double totalHeight = box.size.height;
    final double letterHeight = totalHeight / letters.length;

    int letterIndex =
        (localPosition.dy / letterHeight).floor().clamp(0, letters.length - 1);

    final String letter = letters[letterIndex];

    if (letter != currentDragLetter) {
      UiHelper.doOnPageLoaded(() {
        uiState.value =
            currentUiState.copyWith(currentDragLetter: () => letter);
      });

      final index = _letterIndices[letter];
      if (index != null && itemScrollController.isAttached) {
        itemScrollController.jumpTo(index: index);
      }

      showOverlay(context, letter, globalPosition, box);
    }
  }

  void showOverlay(BuildContext context, String letter, Offset globalPosition,
      RenderBox scrollBarBox) {
    UiHelper.doOnPageLoaded(() {
      currentUiState.overlayEntry?.remove();

      final Offset scrollBarPosition = scrollBarBox.localToGlobal(Offset.zero);
      final Offset overlayPosition =
          Offset(scrollBarPosition.dx - 60, globalPosition.dy - 30);

      final OverlayEntry overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
          left: overlayPosition.dx,
          top: overlayPosition.dy,
          child: IgnorePointer(
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surface.withOpacity(0.8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Center(
                  child: Text(
                    letter,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      Overlay.of(context).insert(overlayEntry);
      uiState.value = currentUiState.copyWith(overlayEntry: () => overlayEntry);
    });
  }

  void removeOverlay() {
    UiHelper.doOnPageLoaded(() {
      currentUiState.overlayEntry?.remove();
      if (uiState.value.overlayEntry != null ||
          uiState.value.currentDragLetter != null) {
        // Store the current drag letter before clearing it
        final String? letterToSelect = uiState.value.currentDragLetter;

        uiState.value = currentUiState.copyWith(
          overlayEntry: () => null,
          currentDragLetter: () => null,
          // Update the selectedCharacter with the last dragged letter if it exists
          selectedCharacter:
              letterToSelect != null ? () => letterToSelect : null,
        );
      }
    });
  }

  List<_ListSection> get groupedListSections => _groupedData;
}

class _ProcessResult {
  final List<_ListSection> groupedData;
  final List<String> letters;
  final Map<String, int> letterIndices;

  _ProcessResult({
    required this.groupedData,
    required this.letters,
    required this.letterIndices,
  });
}

class _ListSection {
  final String letter;
  final DuaEntity? dua;
  final bool isHeader;

  _ListSection({
    this.letter = '',
    this.dua,
    required this.isHeader,
  });
}
