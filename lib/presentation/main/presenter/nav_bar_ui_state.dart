import 'package:dua/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class NavBarUiState extends BaseUiState {
  const NavBarUiState({
    required super.isLoading,
    required super.userMessage,
    required this.selectedIndex,
    this.context,
  });

  factory NavBarUiState.empty() {
    return NavBarUiState(
      isLoading: false,
      userMessage: '',
      context: null,
      selectedIndex: 0,
    );
  }

  final BuildContext? context;
  final int selectedIndex;

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        context,
        selectedIndex,
      ];

  NavBarUiState copyWith({
    bool? isLoading,
    String? userMessage,
    BuildContext? context,
    int? selectedIndex,
  }) {
    return NavBarUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      context: context ?? this.context,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
