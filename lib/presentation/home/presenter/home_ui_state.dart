import 'package:dua/core/base/base_ui_state.dart';
import 'package:dua/domain/entities/category_entity.dart';
import 'package:dua/domain/entities/subcategory_entity.dart';
import 'package:flutter/material.dart';

class HomeUiState extends BaseUiState {
  const HomeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.count,
    this.context,
    this.categories,
    this.subcategories,
    this.subcategoryNamesByCategoryId,
  });

  factory HomeUiState.empty() {
    return HomeUiState(
      isLoading: false,
      userMessage: '',
      context: null,
      count: 0,
      categories: [],
      subcategories: [],
    );
  }

  final BuildContext? context;
  final int count;
  final List<CategoryEntity>? categories;
  final List<SubcategoryEntity>? subcategories;
  final Map<int, List<String>>? subcategoryNamesByCategoryId;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
        count,
        categories,
        subcategories,
        subcategoryNamesByCategoryId,
      ];

  HomeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
    int? count,
    List<CategoryEntity>? categories,
    List<SubcategoryEntity>? subcategories,
    Map<int, List<String>>? subcategoryNamesByCategoryId,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
      count: count ?? this.count,
      categories: categories ?? this.categories,
      subcategories: subcategories ?? this.subcategories,
      subcategoryNamesByCategoryId:
          subcategoryNamesByCategoryId ?? this.subcategoryNamesByCategoryId,
    );
  }
}
