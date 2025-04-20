import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/use_cases/dua/get_duas_grouped_by_subcategory.dart';
import 'package:get/get.dart';

class DuaSubcategoryListPresenter extends BasePresenter {
  final GetDuasGroupedBySubcategoryUseCase getDuasGroupedBySubcategoryUseCase;

  DuaSubcategoryListPresenter({
    required this.getDuasGroupedBySubcategoryUseCase,
  });

  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final Rx<Map<int, List<DuaEntity>>> groupedDuas =
      Rx<Map<int, List<DuaEntity>>>({});

  @override
  void onInit() {
    super.onInit();
    fetchDuasGroupedBySubcategory();
  }

  Future<void> fetchDuasGroupedBySubcategory() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await getDuasGroupedBySubcategoryUseCase();

    result.fold(
      (error) {
        errorMessage.value = error;
        isLoading.value = false;
      },
      (data) {
        groupedDuas.value = data;
        isLoading.value = false;
      },
    );
  }

  int get subcategoryCount => groupedDuas.value.keys.length;

  List<int> get subcategoryIds => groupedDuas.value.keys.toList();

  List<DuaEntity>? getDuasBySubcategoryId(int subcategoryId) {
    return groupedDuas.value[subcategoryId];
  }

  int getDuaCountBySubcategoryId(int subcategoryId) {
    return groupedDuas.value[subcategoryId]?.length ?? 0;
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    isLoading.value = loading;
  }

  @override
  Future<void> addUserMessage(String message) async {
    errorMessage.value = message;
    // You might want to add Snackbar or Toast notifications here
    if (message.isNotEmpty) {
      Get.snackbar(
        'Message',
        message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
