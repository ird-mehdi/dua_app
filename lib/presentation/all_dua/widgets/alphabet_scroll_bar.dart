import 'package:flutter/material.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';

class AlphabetScrollBar extends StatelessWidget {
  final List<String> letters;
  final String selectedLetter;
  final Function(String) onLetterSelected;

  const AlphabetScrollBar({
    super.key,
    required this.letters,
    required this.selectedLetter,
    required this.onLetterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: thirtyPx,
      margin: EdgeInsets.symmetric(horizontal: fourPx),
      decoration: BoxDecoration(
        color: context.color.shadeColor.withOpacityInt(0.5),
        borderRadius: BorderRadius.circular(fifteenPx),
      ),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: eightPx),
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final letter = letters[index];
          final isSelected = letter == selectedLetter;
          return GestureDetector(
            onTap: () => onLetterSelected(letter),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: twentyPx,
              margin: EdgeInsets.symmetric(
                vertical: twoPx,
                horizontal: fourPx,
              ),
              alignment: Alignment.center,
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: twelvePx,
                  color: isSelected ? context.color.titleColor : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
