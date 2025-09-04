import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/use_cases/dua/get_duas_grouped_by_subcategory.dart';
import 'package:dua/domain/use_cases/subcategory/get_dua_names_by_subcategory_id.dart';
import 'package:dua/domain/use_cases/subcategory/get_subcategory_names_by_category_id.dart';
import 'package:dua/presentation/subcategory/presenter/sub_category_uistate.dart';

class SubCategoryPresenter extends BasePresenter<SubCategoryUiState> {
  final GetSubcategoryNamesByCategoryIdUseCase
      getSubcategoryNamesByCategoryIdUseCase;
  final GetDuaNamesBySubcategoryIdUseCase getDuaNamesBySubcategoryIdUseCase;
  final GetDuasGroupedBySubcategoryUseCase getDuasGroupedBySubcategoryUseCase;

  SubCategoryPresenter({
    required this.getSubcategoryNamesByCategoryIdUseCase,
    required this.getDuaNamesBySubcategoryIdUseCase,
    required this.getDuasGroupedBySubcategoryUseCase,
  });
  final Obs<SubCategoryUiState> uiState = Obs(SubCategoryUiState.empty());

  SubCategoryUiState get currentUiState => uiState.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchSubcategoryNamesByCategoryId();
    await fetchDuaNamesBySubcategoryId();
    await fetchDuasGroupedBySubcategory();
  }

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

  Future<void> fetchDuaNamesBySubcategoryId() async {
    final subcategoryNamesMap = await getDuaNamesBySubcategoryIdUseCase.call();
    print("fetchDuaNamesBySubcategoryId: $subcategoryNamesMap");

    uiState.value = currentUiState.copyWith(
      subcategories: subcategoryNamesMap.fold(
        (l) => {},
        (r) => r,
      ),
    );
  }

  Future<void> fetchDuasGroupedBySubcategory() async {
    uiState.value = currentUiState.copyWith(isLoading: true);

    final result = await getDuasGroupedBySubcategoryUseCase();

    result.fold(
      (error) {
        uiState.value = currentUiState.copyWith(
          isLoading: false,
          userMessage: error,
        );
      },
      (data) {
        uiState.value = currentUiState.copyWith(
          isLoading: false,
          groupedDuas: data,
        );
      },
    );
  }

  int get subcategoryCount => currentUiState.groupedDuas?.keys.length ?? 0;

  List<int> get subcategoryIds =>
      currentUiState.groupedDuas?.keys.toList() ?? [];

  List<DuaEntity>? getDuasBySubcategoryId(int subcategoryId) {
    return currentUiState.groupedDuas?[subcategoryId];
  }

  int getDuaCountBySubcategoryId(int subcategoryId) {
    return currentUiState.groupedDuas?[subcategoryId]?.length ?? 0;
  }

  void searchSubcategories(String query) {
    uiState.value = currentUiState.copyWith(searchQuery: query);
  }

  int getDuaCountForSubcategory(String subcategoryName) {
    // This would normally fetch from a data source, using a placeholder for now
    return 5; // Default value, should be replaced with actual data
  }

  List<String>? getNestedSubcategories(String subcategoryName) {
    // This would normally fetch from a data source, using hardcoded data for now
    if (subcategoryName.contains('important')) {
      return [
        'Sincerity',
        'Eating Lawful Food',
        'The Consciousness of One\'s Heart',
        'Supplicate for Good Only'
      ];
    }
    return null;
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
