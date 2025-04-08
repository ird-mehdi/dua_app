import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuaListItem extends StatelessWidget {
  final int number;
  final String text;
  final bool isHighlighted;
  final VoidCallback? onTap;
  final ThemeData theme;

  const DuaListItem({
    required this.number,
    required this.text,
    this.isHighlighted = false,
    this.onTap,
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final AllDuaPresenter presenter = locate<AllDuaPresenter>();

    return Row(
      children: [
        // Dua List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: presenter.scrollController,
            itemCount: presenter.alphabetLetters.length,
            itemBuilder: (context, index) {
              final character = presenter.alphabetLetters[index];
              final items = presenter.duaItems.value[character] ?? [];

              if (items.isEmpty) {
                return const SizedBox.shrink();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sticky Header for each character
                  Container(
                    color: const Color(0xFFF9FAFB),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              character,
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Dua Items with Left Border for each character
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items.map((item) {
                        final isSelected =
                            character == presenter.selectedCharacter.value;
                        return _buildDuaItem(item, highlighted: isSelected);
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        // Alphabet Index
        Container(
          width: 24,
          padding: const EdgeInsets.only(top: 10),
          child: Obx(() => Column(
                children: _buildAlphabetIndex(presenter),
              )),
        ),
      ],
    );
  }

  Widget _buildDuaItem(String text, {bool highlighted = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.only(left: 24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 23,
            height: 1,
            color: Colors.grey.shade300,
          ),
          const SizedBox(width: 2),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: highlighted
                    ? theme.colorScheme.primary
                    : const Color(0xFF1F2937),
                fontWeight: highlighted ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAlphabetIndex(AllDuaPresenter presenter) {
    return presenter.alphabetLetters.map((letter) {
      final isActive = letter == presenter.selectedCharacter.value;

      return GestureDetector(
        onTap: () {
          presenter.selectCharacter(letter);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Text(
            letter,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? const Color(0xFF10B981) : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      );
    }).toList();
  }
}
