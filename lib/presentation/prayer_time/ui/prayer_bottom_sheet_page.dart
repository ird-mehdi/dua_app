import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/label_switch.dart';
import 'package:dua/presentation/common/widgets/custom_text.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/prayer_time/presenter/prayer_bottom_controller.dart';
import 'package:dua/presentation/prayer_time/presenter/prayer_time_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerBottomSheetPage extends StatelessWidget {
  final PrayerBottomController controller = Get.put(PrayerBottomController());

  PrayerBottomSheetPage({super.key});

  final PrayerTimePresenter presenter = locate<PrayerTimePresenter>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return PresentableWidgetBuilder(
        presenter: presenter,
        builder: () {
          return Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              color: DuaColor.cloudLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomAppBar(
                  title: 'Quick Settings',
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildSectionHeader(Icons.settings, 'General Settings', theme),
                LabeledSwitch(
                  title: 'Show Arabic',
                  value: presenter.currentUiState.showArabic,
                  onChanged: (value) {
                    presenter.toggleShowArabic();
                  },
                  theme: theme,
                ),
                LabeledSwitch(
                  title: 'Show Translation',
                  value: presenter.currentUiState.showTranslation,
                  onChanged: (value) {
                    presenter.toggleShowTranslation();
                  },
                  theme: theme,
                ),
                LabeledSwitch(
                  title: 'Show Reference',
                  value: presenter.currentUiState.showReference,
                  onChanged: (value) {
                    presenter.toggleShowReference();
                  },
                  theme: theme,
                ),
                SizedBox(height: 16),
                _buildSectionHeader(Icons.text_fields, 'Font Settings', theme),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5DC)
                        .withOpacityInt(0.5), // Light beige with opacity
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَـٰلَمِينَ',
                        style: TextStyle(
                          fontSize: controller.arabicFontSize.value,
                          color: Color(0xFF445D48),
                          fontFamily: 'Amiri', // Arabic font
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 8),
                      CustomText(
                        text: 'All praise is for Allah—Lord of all worlds.',
                        fontSize: controller.translationFontSize.value,
                        color: Color(0xFF445D48), // Dark green
                        textAlign: TextAlign.center,
                        theme: theme,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                _buildSliderRow(
                  title: 'Arabic Font Size',
                  sliderValue: presenter.currentUiState.arabicFontSize,
                  min: 16,
                  max: 50,
                  onChanged: (value) => presenter.updateArabicFontSize(value),
                  theme: theme,
                ),

                _buildSliderRow(
                  title: 'Translation Font Size',
                  sliderValue: presenter.currentUiState.translationFontSize,
                  min: 16,
                  max: 50,
                  onChanged: (value) {
                    presenter.updateTranslationFontSize(value);
                  },
                  theme: theme,
                ),

                SizedBox(height: 16),

                //   _buildDropdownRow(
                //       title: 'Arabic Script & Font Face',
                //       value: controller.selectedFont.value,
                //       items: ['Uthma', 'Font2', 'Font3'],
                //       onChanged: (value) => controller.updateSelectedFont(value!)),
              ],
            ),
          );
        });
  }

  Widget _buildSectionHeader(IconData icon, String title, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: DuaColor.primaryColorLight01, // Light beige with opacity
              shape: BoxShape.circle,
              border: Border.all(
                color: DuaColor.primaryColorLight01,
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              color: DuaColor.titleColorLight,
              size: 18,
            ),
          ),
          SizedBox(width: 16),
          CustomText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: DuaColor.titleColorLight, // Light beige
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _buildSliderRow({
    required String title,
    required double sliderValue,
    required ValueChanged<double> onChanged,
    required double min,
    required double max,
    required ThemeData theme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 16,
          color: DuaColor.titleColorLight, // Light beige
          theme: theme,
        ),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: sliderValue,

                min: min,
                max: max,
                divisions: 40,
                onChanged: (value) => onChanged(value),
                activeColor: Color(0xFF445D48), // Dark green
                inactiveColor: Colors.grey.shade300,
              ),
            ),
            CustomText(
              text: sliderValue.round().toString(),
              fontSize: 16,
              color: Color(0xFFF5F5DC), // Light beige
              theme: theme,
            ),
          ],
        ),
      ],
    );
  }

  // ignore: unused_element
  Widget _buildDropdownRow(String title, String value, List<String> items,
      ValueChanged<String?> onChanged, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 16,
          color: Color(0xFFF5F5DC), // Light beige
          theme: theme,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Color(0xFFF5F5DC)
                .withOpacityInt(0.5), // Light beige with opacity
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: Container(),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: CustomText(
                  text: item,
                  color: Color(0xFF445D48), // Dark green
                  theme: theme,
                ),
              );
            }).toList(),
            icon: Icon(Icons.arrow_forward_ios, size: 16), // Smaller icon
          ),
        ),
      ],
    );
  }
}
