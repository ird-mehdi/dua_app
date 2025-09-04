import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';

class AlphabetScrollBar extends StatelessWidget {
  final AllDuasPresenter presenter;
  final List<String> letters;
  final String selectedLetter;

  const AlphabetScrollBar({
    super.key,
    required this.presenter,
    required this.letters,
    required this.selectedLetter,
  });

  @override
  Widget build(BuildContext context) {
    if (letters.isEmpty) {
      return const SizedBox(width: 30);
    }

    return GestureDetector(
      onTapDown: (details) => presenter.handleTapDown(details, context),
      onVerticalDragStart: (details) =>
          presenter.handleDragStart(details, context),
      onVerticalDragUpdate: (details) =>
          presenter.handleDragUpdate(details, context),
      onVerticalDragEnd: (_) => presenter.removeOverlay(),
      onVerticalDragCancel: () => presenter.removeOverlay(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: thirtyPx,
        margin: EdgeInsets.symmetric(horizontal: twoPx),
        decoration: BoxDecoration(
          color: context.color.shadeColor.withOpacityInt(0.1),
          borderRadius: BorderRadius.circular(fifteenPx),
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: eightPx),
          itemCount: letters.length,
          itemBuilder: (context, index) {
            final letter = letters[index];
            final isSelected = letter == selectedLetter;

            return Container(
              height: twentyPx,
              alignment: Alignment.center,
              decoration: isSelected
                  ? BoxDecoration(
                      color: context.color.primaryColor100.withOpacityInt(0.3),
                      shape: BoxShape.circle,
                    )
                  : null,
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: twelvePx,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? context.color.primaryColor100
                      : Colors.grey[600],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
