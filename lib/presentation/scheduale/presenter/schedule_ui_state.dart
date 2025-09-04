import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class ScheduleUiState extends BaseUiState {
  final BuildContext? context;

  const ScheduleUiState({
    required super.isLoading,
    required super.userMessage,
    this.context,
  });

  factory ScheduleUiState.empty() {
    return ScheduleUiState(
      isLoading: false,
      userMessage: '',
      context: null,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
      ];

  ScheduleUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
  }) {
    return ScheduleUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
    );
  }
}
