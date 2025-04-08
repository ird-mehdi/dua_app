import 'package:dua/core/base/base_ui_state.dart';

class AllDuaState extends BaseUiState {
  const AllDuaState({
    required super.isLoading,
    required super.userMessage,
  });

  factory AllDuaState.initial() {
    return const AllDuaState(
      isLoading: false,
      userMessage: null,
    );
  }

  AllDuaState copyWith({
    bool? isLoading,
    String? userMessage,
  }) {
    return AllDuaState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, userMessage];
}
