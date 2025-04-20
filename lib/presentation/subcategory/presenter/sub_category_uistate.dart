import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:flutter/material.dart';

class SubCategoryUiState extends BaseUiState {
  const SubCategoryUiState({
    required super.isLoading,
    required super.userMessage,
    required this.expandedIndices,
    this.context,
    this.subcategoryNamesByCategoryId,
    this.searchQuery = '',
    this.subcategories,
    this.groupedDuas,
  });

  factory SubCategoryUiState.empty() {
    return SubCategoryUiState(
      isLoading: false,
      userMessage: '',
      context: null,
      expandedIndices: {},
      subcategoryNamesByCategoryId: {},
      subcategories: {},
      groupedDuas: {},
    );
  }

  final BuildContext? context;
  final Set<int> expandedIndices;
  final Map<int, List<String>>? subcategoryNamesByCategoryId;
  final String searchQuery;
  final Map<int, List<String>>? subcategories;
  final Map<int, List<DuaEntity>>? groupedDuas;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
        expandedIndices,
        subcategoryNamesByCategoryId,
        searchQuery,
        subcategories,
        groupedDuas,
      ];

  SubCategoryUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
    Set<int>? expandedIndices,
    Map<int, List<String>>? subcategoryNamesByCategoryId,
    String? searchQuery,
    Map<int, List<String>>? subcategories,
    Map<int, List<DuaEntity>>? groupedDuas,
  }) {
    return SubCategoryUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
      expandedIndices: expandedIndices ?? this.expandedIndices,
      subcategoryNamesByCategoryId:
          subcategoryNamesByCategoryId ?? this.subcategoryNamesByCategoryId,
      searchQuery: searchQuery ?? this.searchQuery,
      subcategories: subcategories ?? this.subcategories,
      groupedDuas: groupedDuas ?? this.groupedDuas,
    );
  }
}
