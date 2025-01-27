import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class HomeUiState extends BaseUiState {
  const HomeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.count,
    this.context,
  });

  factory HomeUiState.empty() {
    return HomeUiState(
      isLoading: false,
      userMessage: '',
      context: null,
      count: 0,
    );
  }

  final BuildContext? context;
  final int count;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
        count,
      ];

  HomeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
    int? count,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
      count: count ?? this.count,
    );
  }
}
