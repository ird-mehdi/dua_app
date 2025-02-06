import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/subcategory/presenter/sub_category_presenter_uistate.dart';

class SubCategoryPresenter extends BasePresenter<SubCategoryUiState> {
  SubCategoryPresenter();
  final Obs<SubCategoryUiState> uiState = Obs(SubCategoryUiState.empty());

  SubCategoryUiState get currentUiState => uiState.value;

  void toggleIsExtend(bool value) {
    uiState.value = currentUiState.copyWith(isExtend: !currentUiState.isExtend );
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

