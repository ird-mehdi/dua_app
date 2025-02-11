import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/subcategory/presenter/sub_category_presenter_uistate.dart';

class SubCategoryPresenter extends BasePresenter<SubCategoryUiState> {
  SubCategoryPresenter();
  final Obs<SubCategoryUiState> uiState = Obs(SubCategoryUiState.empty());

  SubCategoryUiState get currentUiState => uiState.value;

  void toggleExpansion(int index) {
    final Set<int> newExpandedIndices =
        Set.from(currentUiState.expandedIndices);
    if (newExpandedIndices.contains(index)) {
      newExpandedIndices.remove(index);
    } else {
      newExpandedIndices.add(index);
    }
    uiState.value =
        currentUiState.copyWith(expandedIndices: newExpandedIndices);
  }

  bool isExpanded(int index) {
    return currentUiState.expandedIndices.contains(index);
  }

  @override
  Future<void> addUserMessage(String message) {
    return showMessage(message: message, context: currentUiState.context);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
