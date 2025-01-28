import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class PrayerTimeUiState extends BaseUiState {
  const PrayerTimeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.count,
    this.context,
  });

  factory PrayerTimeUiState.empty() {
    return PrayerTimeUiState(
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

  PrayerTimeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
    int? count,
  }) {
    return PrayerTimeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
      count: count ?? this.count,
    );
  }
}
