import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class SubCategoryUiState extends BaseUiState {
  const SubCategoryUiState({
    required super.isLoading,
    required super.userMessage,
    required this.expandedIndices,
    this.context,
  });

  factory SubCategoryUiState.empty() {
    return SubCategoryUiState(
      isLoading: false,
      userMessage: '',
      context: null,
      expandedIndices: {},
    );
  }

  final BuildContext? context;
  final Set<int> expandedIndices;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
        expandedIndices,
      ];

  SubCategoryUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
    Set<int>? expandedIndices,
  }) {
    return SubCategoryUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
      expandedIndices: expandedIndices ?? this.expandedIndices,
    );
  }
}
