import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class SubCategoryUiState extends BaseUiState {
  const SubCategoryUiState({
    this.isExtend = false,
    required super.isLoading,
    required super.userMessage,
    this.context,

  });

  factory SubCategoryUiState.empty() {
    return SubCategoryUiState(
      isLoading: false,
      userMessage: '',
      context: null,
      isExtend: false,
    );
  }

  final BuildContext? context;
  final bool isExtend;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
        isExtend,
      ];

  SubCategoryUiState copyWith({
    bool? isExtend,
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
  }) {
    return SubCategoryUiState(
      isExtend: isExtend ?? this.isExtend,
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
    );
  }



  }

