import 'package:flutter/material.dart';
import '../presenter/settings_presenter.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:get/get.dart';
import 'package:dua/core/config/dua_color.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = locate<SettingsPresenter>();

    return GetX<SettingsPresenter>(
      init: presenter,
      builder: (controller) => Scaffold(
        appBar: const CustomAppBar(
          title: 'Settings',
          showLeading: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Main Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        _buildGeneralSettings(controller),
                        const SizedBox(height: 24),
                        _buildFontSettings(context, controller),
                        const SizedBox(height: 24),
                        _buildAppearanceSettings(context, controller),
                        const SizedBox(height: 24), // Space before footer area
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom Navigation Bar Area (Space)
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the General Settings Section
  Widget _buildGeneralSettings(SettingsPresenter presenter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(icon: Icons.settings, title: 'General Settings'),
        const SizedBox(height: 16),
        SettingSwitchTile(
          title: 'Show Arabic',
          value: presenter.state.showArabic,
          onChanged: presenter.setShowArabic,
        ),
        SettingSwitchTile(
          title: 'Show Translation',
          value: presenter.state.showTranslation,
          onChanged: presenter.setShowTranslation,
        ),
        SettingSwitchTile(
          title: 'Show Reference',
          value: presenter.state.showReference,
          onChanged: presenter.setShowReference,
        ),
        SettingSwitchTile(
          title: 'Keep Screen On',
          value: presenter.state.keepScreenOn,
          onChanged: presenter.setKeepScreenOn,
        ),
        const SizedBox(height: 8),
        const Text(
          'Change App Language',
          style: TextStyle(fontSize: 14, color: DuaColor.headingTextColorLight),
        ),
        const SizedBox(height: 4),
        NavigationTile(title: 'English'),
      ],
    );
  }

  // Builds the Font Settings Section
  Widget _buildFontSettings(BuildContext context, SettingsPresenter presenter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          icon: Icons.font_download,
          title: 'Font Settings',
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: DuaColor.primaryColorLight05,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                'ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: presenter.state.arabicFontSize,
                  color: DuaColor.headingTextColorLight,
                  fontFamily: 'Uthmanic',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'All praise is for Allah—Lord of all worlds.',
                style: TextStyle(
                  fontSize: presenter.state.translationFontSize,
                  color: DuaColor.subtitleColorLight,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        FontSizeSlider(
          label: 'Arabic Font Size',
          value: presenter.state.arabicFontSize,
          min: 10,
          max: 50,
          onChanged: presenter.setArabicFontSize,
        ),
        const SizedBox(height: 12),
        FontSizeSlider(
          label: 'Translation Font Size',
          value: presenter.state.translationFontSize,
          min: 10,
          max: 50,
          onChanged: presenter.setTranslationFontSize,
        ),
        const SizedBox(height: 12),
        const Text(
          'Arabic Script & Font Face',
          style: TextStyle(fontSize: 14, color: DuaColor.headingTextColorLight),
        ),
        const SizedBox(height: 4),
        NavigationTile(title: 'Uthmanic'),
      ],
    );
  }

  // Builds the Appearance Settings Section
  Widget _buildAppearanceSettings(
      BuildContext context, SettingsPresenter presenter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          icon: Icons.palette_outlined,
          title: 'Appearance',
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppearanceOption(
              context: context,
              index: 0,
              label: 'System',
              isSelected: presenter.state.selectedAppearance == 0,
              onTap: () => presenter.setSelectedAppearance(0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: DuaColor.subtitleColorLight,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Aa',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: DuaColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: DuaColor.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          )),
                      child: const Center(
                        child: Text(
                          'Aa',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: DuaColor.subtitleColorLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppearanceOption(
              context: context,
              index: 1,
              label: 'Light',
              isSelected: presenter.state.selectedAppearance == 1,
              onTap: () => presenter.setSelectedAppearance(1),
              child: Container(
                color: DuaColor.primaryColorLight05,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: DuaColor.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          )
                        ]),
                    child: const Center(
                      child: Text(
                        'Aa',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: DuaColor.headingTextColorLight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AppearanceOption(
              context: context,
              index: 2,
              label: 'Dark',
              isSelected: presenter.state.selectedAppearance == 2,
              onTap: () => presenter.setSelectedAppearance(2),
              child: Container(
                color: DuaColor.titleColorLight,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: DuaColor.subtitleColorLight,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          )
                        ]),
                    child: Center(
                      child: Text(
                        'Aa',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Builds the bottom footer space with the home indicator line
  Widget _buildFooter() {
    return Container(
      height: 32,
      alignment: Alignment.center,
      child: Container(
        width: 128,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

// Reusable section header widget
class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionHeader({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: DuaColor.primaryColorLight05,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 24, color: DuaColor.primaryColorLight100),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: DuaColor.primaryColorLight100,
          ),
        ),
      ],
    );
  }
}

// Reusable setting switch tile widget
class SettingSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: DuaColor.headingTextColorLight, fontSize: 16),
          ),
          SizedBox(
            height: 24,
            width: 44,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: DuaColor.white,
                activeTrackColor: DuaColor.primaryColorLight100,
                inactiveThumbColor: DuaColor.white,
                inactiveTrackColor: DuaColor.subtitleColorLight,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                trackOutlineWidth:
                    MaterialStateProperty.resolveWith<double?>((_) => 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable navigation tile widget
class NavigationTile extends StatelessWidget {
  final String title;

  const NavigationTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DuaColor.primaryColorLight05,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          print("$title tapped");
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: DuaColor.headingTextColorLight, fontSize: 16),
              ),
              const Icon(Icons.chevron_right,
                  size: 20, color: DuaColor.subtitleColorLight),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable font size slider widget
class FontSizeSlider extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const FontSizeSlider({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontSize: 14, color: DuaColor.headingTextColorLight),
            ),
            Text(
              value.toInt().toString(),
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: DuaColor.subtitleColorLight),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 5.0,
            activeTrackColor: DuaColor.primaryColorLight100,
            inactiveTrackColor: DuaColor.primaryColorLight05,
            thumbColor: DuaColor.primaryColorLight100,
            overlayColor: DuaColor.primaryColorLight100.withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
            trackShape: const RoundedRectSliderTrackShape(),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

// Reusable appearance option widget
class AppearanceOption extends StatelessWidget {
  final BuildContext context;
  final int index;
  final String label;
  final bool isSelected;
  final Widget child;
  final VoidCallback onTap;

  const AppearanceOption({
    super.key,
    required this.context,
    required this.index,
    required this.label,
    required this.isSelected,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isSelected ? DuaColor.primaryColorLight100 : Colors.transparent;
    final labelColor = isSelected
        ? DuaColor.headingTextColorLight
        : DuaColor.subtitleColorLight;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 32 - 32) / 3,
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: child,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 14, color: labelColor),
          ),
        ],
      ),
    );
  }
}
