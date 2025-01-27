import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class LastReadUiState extends BaseUiState {
  const LastReadUiState({
    required super.isLoading,
    required super.userMessage,
    required this.context,
  });

  factory LastReadUiState.empty() {
    return const LastReadUiState(
      isLoading: true,
      userMessage: null,
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

  LastReadUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    BuildContext? context,
  }) {
    return LastReadUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: errorMessage ?? userMessage,
      context: context,
    );
  }
}
