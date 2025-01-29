import 'package:get/get.dart';

class PrayerBottomController extends GetxController {
  RxBool showArabic = true.obs;
  RxBool showTranslation = false.obs;
  RxBool showReference = false.obs;
  RxDouble arabicFontSize = 28.0.obs;
  RxDouble translationFontSize = 28.0.obs;
  RxString selectedFont = 'Uthma'.obs;

  void toggleShowArabic(bool value) {
    showArabic.value = value;
  }

  void toggleShowTranslation(bool value) {
    showTranslation.value = value;
  }

  void toggleShowReference(bool value) {
    showReference.value = value;
  }

  void updateArabicFontSize(double value) {
    arabicFontSize.value = value;
  }

  void updateTranslationFontSize(double value) {
    translationFontSize.value = value;
  }

  void updateSelectedFont(String value) {
    selectedFont.value = value;
  }
}