import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/domain/use_cases/category/get_all_categories.dart';
import 'package:dua/domain/use_cases/category/get_categories_by_language.dart';
import 'package:dua/domain/use_cases/subcategory/get_all_subcategories.dart';
import 'package:dua/domain/use_cases/subcategory/get_subcategories_by_category.dart';
import 'package:dua/domain/use_cases/subcategory/get_subcategory_names_by_category_id.dart';
import 'package:dua/presentation/home/presenter/home_ui_state.dart';

import 'package:flutter/widgets.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetCategoriesByLanguageUseCase getCategoriesByLanguageUseCase;
  final GetAllSubcategoriesUseCase getAllSubcategoriesUseCase;
  final GetSubcategoriesByCategoryUseCase getSubcategoriesByCategoryUseCase;
  final GetSubcategoryNamesByCategoryIdUseCase
      getSubcategoryNamesByCategoryIdUseCase;

  HomePresenter({
    required this.getAllCategoriesUseCase,
    required this.getCategoriesByLanguageUseCase,
    required this.getAllSubcategoriesUseCase,
    required this.getSubcategoriesByCategoryUseCase,
    required this.getSubcategoryNamesByCategoryIdUseCase,
  });

  final Obs<HomeUiState> uiState = Obs(HomeUiState.empty());

  HomeUiState get currentUiState => uiState.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchCategoriesAndSubcategories();
    await fetchSubcategoryNamesByCategoryId();
  }

  Future<void> fetchCategoriesAndSubcategories() async {
    final englishCategories = await getCategoriesByLanguageUseCase.call("en");
    final subcategories = await getAllSubcategoriesUseCase.call();

    uiState.value = currentUiState.copyWith(
      categories: englishCategories.fold(
        (l) => [],
        (r) => r,
      ),
      subcategories: subcategories.fold(
        (l) => [],
        (r) => r,
      ),
    );
  }

  Future<void> fetchSubcategoryNamesByCategoryId() async {
    final subcategoryNamesMap =
        await getSubcategoryNamesByCategoryIdUseCase.call();
    print("fetchSubcategoryNamesByCategoryId: $subcategoryNamesMap");
    uiState.value = currentUiState.copyWith(
      subcategoryNamesByCategoryId: subcategoryNamesMap.fold(
        (l) => {},
        (r) => r,
      ),
    );
  }

  void incrementCount() {
    uiState.value = currentUiState.copyWith(count: currentUiState.count + 1);
  }

  void decrementCount() {
    uiState.value = currentUiState.copyWith(count: currentUiState.count - 1);
  }

  updateContext(BuildContext context) {
    uiState.value = currentUiState.copyWith(context: context);
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
