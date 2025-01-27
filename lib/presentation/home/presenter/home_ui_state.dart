import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class HomeUiState extends BaseUiState {
  const HomeUiState({
    required super.isLoading,
    required super.userMessage,
    this.context,
  });

  factory HomeUiState.empty() {
    return HomeUiState(
      isLoading: false,
      userMessage: '',
      context: null,
    );
  }

  final BuildContext? context;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
      ];

  HomeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
    );
  }
}
