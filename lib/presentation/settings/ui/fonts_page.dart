import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/settings/presenter/settings_presenter.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:flutter/material.dart';

class FontsPage extends StatelessWidget {
  const FontsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPresenter presenter = locate<SettingsPresenter>();

    return PresentableWidgetBuilder<SettingsPresenter>(
      presenter: presenter,
      builder: () => Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'আরবি স্ক্রিপ্ট এবং ফন্ট',
          onLeadingPressed: () => Navigator.pop(context),
        ),
        body: Column(
          children: [
            ScriptTypeTabs(
              selectedType: presenter.state.selectedScriptType,
              onTypeSelected: (type) => presenter.setSelectedScriptType(type),
            ),
            Expanded(
              child: FontOptionsList(
                selectedFont: presenter.state.selectedFont,
                onFontSelect: (font) => presenter.setSelectedFont(font),
              ),
            ),
            BottomIndicator(),
          ],
        ),
      ),
    );
  }
}

class ScriptTypeTabs extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const ScriptTypeTabs({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: DuaColor.shadeColorLight,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: DuaColor.primaryColorLight20, width: 2.0),
      ),
      child: Row(
        children: [
          ScriptTypeTab(
            title: 'Uthmanic',
            isSelected: selectedType == 'Uthmanic',
            onTap: onTypeSelected,
          ),
          ScriptTypeTab(
            title: 'Indopak',
            isSelected: selectedType == 'Indopak',
            onTap: onTypeSelected,
          ),
        ],
      ),
    );
  }
}

class ScriptTypeTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(String) onTap;

  const ScriptTypeTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(title),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color:
                isSelected ? DuaColor.primaryColorLight10 : Colors.transparent,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? DuaColor.primaryColorLight100
                  : DuaColor.titleColorLight,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

class FontOptionsList extends StatelessWidget {
  final String selectedFont;
  final Function(String) onFontSelect;

  const FontOptionsList({
    super.key,
    required this.selectedFont,
    required this.onFontSelect,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> fontOptions = [
      'KFG Hafs',
      'Me_quran',
      'Amiri',
      'Uthman TNI',
      'Al Qalam Quran Majeed',
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
      itemCount: fontOptions.length,
      itemBuilder: (context, index) {
        final String fontName = fontOptions[index];
        final bool isFirstItem = index == 0;
        final bool isLastItem = index == fontOptions.length - 1;

        return FontOption(
          fontName: fontName,
          isSelected: selectedFont == fontName,
          isFirstItem: isFirstItem,
          isLastItem: isLastItem,
          arabicText: 'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيمِ',
          onSelect: onFontSelect,
        );
      },
    );
  }
}

class FontOption extends StatelessWidget {
  final String fontName;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  final String arabicText;
  final Function(String) onSelect;

  const FontOption({
    super.key,
    required this.fontName,
    required this.isSelected,
    required this.isFirstItem,
    required this.isLastItem,
    required this.arabicText,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isFirstItem
          ? const EdgeInsets.all(16.0)
          : const EdgeInsets.symmetric(vertical: 16.0),
      margin: isFirstItem ? const EdgeInsets.only(bottom: 16.0) : null,
      decoration: BoxDecoration(
        color: isSelected ? DuaColor.primaryColorLight05 : Colors.transparent,
        borderRadius: isSelected ? BorderRadius.circular(8.0) : null,
        border: !isFirstItem && !isLastItem
            ? Border(bottom: BorderSide(color: DuaColor.primaryColorLight20))
            : (isFirstItem && !isSelected
                ? Border(
                    bottom: BorderSide(color: DuaColor.primaryColorLight20))
                : null),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio<String>(
            value: fontName,
            groupValue: isSelected ? fontName : null,
            onChanged: (value) => onSelect(value!),
            activeColor: DuaColor.primaryColorLight100,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  fontName,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: DuaColor.headingTextColorLight),
                ),
                const SizedBox(height: 12.0),
                Text(
                  arabicText,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: DuaColor.headingTextColorLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      width: MediaQuery.of(context).size.width / 3,
      height: 4.0,
      decoration: BoxDecoration(
        color: DuaColor.titleColorLight,
        borderRadius: BorderRadius.circular(2.0),
      ),
    );
  }
}
