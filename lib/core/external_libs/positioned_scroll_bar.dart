import 'package:dua/core/external_libs/draggable_scrollbar_positioned_list/draggable_scrollbar_positioned_list.dart';
import 'package:dua/core/external_libs/scrollable_positioned_list/src/scrollable_positioned_list.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class PositionedScrollBar extends StatelessWidget {
  const PositionedScrollBar({
    super.key,
    required this.listView,
    required this.controller,
    required this.showScrollBar,
    this.onDragging,
  });

  final ScrollablePositionedList listView;
  final ItemScrollController controller;
  final bool showScrollBar;
  final void Function({required bool dragging})? onDragging;

  @override
  Widget build(BuildContext context) {
    if (!showScrollBar) return listView;

    return DraggableScrollbarPositionedList.arrows(
      key: const Key('PositionedScrollBar'),
      backgroundColor: isDarkMode(context)
          ? Theme.of(context).colorScheme.surfaceContainerHighest
          : Theme.of(context).colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.only(right: 2),
      onDragging: onDragging,
      controller: controller,
      child: listView,
    );
  }
}
