import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_state.dart';
import 'package:flutter/material.dart';

class AllDuaPresenter extends BasePresenter<AllDuaState> {
  final selectedCharacter = Obs<String>('A');
  final duaItems = Obs<Map<String, List<String>>>({
    'A': [
      'A dhikr which is light on tongue, Heavy on the balance',
      'About Lailatul Qadr',
      'After leaving the toilet'
    ],
    'B': [
      'Beautiful Dua for morning',
      'Before starting work',
      'Best Dua for health'
    ],
    'C': [
      'Correct way of asking Allah',
      'Cure for sadness',
      'Converting hardship to ease'
    ],
    'D': ['Dua for courage', 'Dua for forgiveness', 'Dua for knowledge'],
    'E': [
      'Easy way to remember Allah',
      'Evening Dua',
      'Essential Dua for travel'
    ],
    'F': ['Forgiveness Dua', 'Friday special Dua', 'Family unity Dua'],
    'G': ['Guidance Dua', 'Gratitude to Allah', 'Good deeds Dua'],
    'H': ['Hajj Dua', 'Health and wellness', 'Home entering Dua'],
    'I': ['Istighfar Dua', 'Important daily Dua', 'Increase in faith'],
    'J': ['Journey Dua', 'Joy and happiness', 'Justice seeking Dua'],
    'K': ['Knowledge seeking Dua', 'Kind heart Dua', 'Keeping away from evil'],
    'L': ['Laylatul Qadr Dua', 'Love for Allah', 'Last ten days of Ramadan'],
    'M': ['Morning Dua', 'Masjid entrance Dua', 'Marriage Dua'],
    'N': ['Night prayer Dua', 'New beginning', 'Need fulfillment'],
    'O': [
      'Obligatory prayer Dua',
      'Offering help to others',
      'Overcoming difficulty'
    ],
    'P': ['Protection Dua', 'Parents Dua', 'Patience in hardship'],
    'Q': ['Quran recitation Dua', 'Quiet time with Allah', 'Quick relief Dua'],
    'R': ['Ramadan Dua', 'Relief from anxiety', 'Rizq increase'],
    'S': ['Sickness cure', 'Success in life', 'Seeking forgiveness'],
    'T': ['Travel Dua', 'Thankfulness to Allah', 'Times of hardship'],
    'U': ['Understanding Quran', 'Unity among Muslims', 'Upliftment of soul'],
    'V': ['Victory over enemies', 'Virtuous deeds', 'Vision clarity'],
    'W': ['Waking up Dua', 'Well-being Dua', 'Wisdom seeking'],
    'X': [
      'Extraordinary situations',
      'Excessive worry relief',
      'Exit from difficulties'
    ],
    'Y': ['Yearly blessings', 'Yielding to Allah\'s will', 'Youth guidance'],
    'Z': ['Zakat giving Dua', 'Zeal for worship', 'Zealous faith']
  });

  final scrollController = ScrollController();
  final alphabetLetters = [
    '#',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  void selectCharacter(String character) {
    selectedCharacter.value = character;
    // Scroll to the selected character's section
    scrollToCharacter(character);
  }

  void scrollToCharacter(String character) {
    // Calculate and find position to scroll
    double position = 0;

    // Calculate position based on characters before the selected one
    for (var key in alphabetLetters) {
      if (key == character) {
        break;
      }
      if (duaItems.value.containsKey(key)) {
        // Add height for section header
        position += 48; // Estimated header height
        // Add height for items in the section
        position +=
            (duaItems.value[key]?.length ?? 0) * 60; // Estimated item height
      }
    }

    // Scroll to calculated position
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    // Implementation for loading state
  }

  @override
  Future<void> addUserMessage(String message) async {
    // Implementation for user message
  }
}
