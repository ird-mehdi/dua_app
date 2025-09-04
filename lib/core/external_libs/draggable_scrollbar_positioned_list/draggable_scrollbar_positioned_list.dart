import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dua/core/external_libs/draggable_scrollbar_positioned_list/slide_fade_transition.dart';
import 'package:dua/core/external_libs/scrollable_positioned_list/scrollable_positioned_list.dart';

typedef ScrollThumbBuilder = Widget Function(
  Color backgroundColor,
  Animation<double> thumbAnimation,
  double height,
);

class DraggableScrollbarPositionedList extends StatefulWidget {
  DraggableScrollbarPositionedList({
    super.key,
    this.alwaysVisibleScrollThumb = false,
    required this.heightScrollThumb,
    required this.backgroundColor,
    required this.scrollThumbBuilder,
    required this.child,
    required this.controller,
    this.padding,
    this.scrollbarAnimationDuration = const Duration(milliseconds: 300),
    this.scrollbarTimeToFade = const Duration(microseconds: 1),
    required this.onDragging,
  }) : assert(child.scrollDirection == Axis.vertical);

  DraggableScrollbarPositionedList.arrows({
    super.key,
    Key? scrollThumbKey,
    this.alwaysVisibleScrollThumb = false,
    required this.child,
    required this.controller,
    this.heightScrollThumb = 60.0,
    this.backgroundColor = Colors.white,
    this.padding,
    this.scrollbarAnimationDuration = const Duration(milliseconds: 300),
    this.scrollbarTimeToFade = const Duration(milliseconds: 600),
    this.onDragging,
  }) : scrollThumbBuilder =
            _thumbArrowBuilder(scrollThumbKey, alwaysVisibleScrollThumb);

  final ScrollablePositionedList child;

  final ScrollThumbBuilder scrollThumbBuilder;

  final double heightScrollThumb;

  final Color backgroundColor;

  final EdgeInsetsGeometry? padding;

  final Duration scrollbarAnimationDuration;

  final Duration scrollbarTimeToFade;

  final ItemScrollController controller;

  final bool alwaysVisibleScrollThumb;

  final void Function({required bool dragging})? onDragging;

  @override
  DraggableScrollbarPositionedListState createState() =>
      DraggableScrollbarPositionedListState();

  static Widget buildScrollThumb({
    required Widget scrollThumb,
    required Color backgroundColor,
    required Animation<double> thumbAnimation,
    required bool alwaysVisibleScrollThumb,
  }) {
    if (alwaysVisibleScrollThumb) return scrollThumb;

    return SlideFadeTransition(
      key: const ValueKey('SlideFadeTransition2938492'),
      animation: thumbAnimation,
      child: scrollThumb,
    );
  }

  static ScrollThumbBuilder _thumbArrowBuilder(
    Key? scrollThumbKey,
    bool alwaysVisibleScrollThumb,
  ) {
    return (
      Color backgroundColor,
      Animation<double> thumbAnimation,
      double height,
    ) {
      // creates a ClipPath widget named scrollThumb that represents a scroll
      // thumb used in a scrollbar. The scroll thumb is a rectangular container
      // with rounded corners, and it uses an ArrowClipper as its clipper to
      // give it an arrow-shaped appearance.
      final ClipPath scrollThumb = ClipPath(
        key: const Key("ScrollThumbBuilderClipPath"),
        // clipper: ArrowClipper(),
        child: Container(
          key: scrollThumbKey,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Icon(
            Icons.unfold_more,
            color: Colors.grey.shade100,
          ),
        ),
      );

      return buildScrollThumb(
        scrollThumb: scrollThumb,
        backgroundColor: backgroundColor,
        thumbAnimation: thumbAnimation,
        alwaysVisibleScrollThumb: alwaysVisibleScrollThumb,
      );
    };
  }
}

class DraggableScrollbarPositionedListState
    extends State<DraggableScrollbarPositionedList>
    with TickerProviderStateMixin {
  BoxConstraints? _constraints;
  late double _barOffset;
  late double _viewOffset;
  late bool _isDragInProcess;

  late AnimationController _thumbAnimationController;
  late Animation<double> _thumbAnimation;
  Timer? _fadeoutTimer;

  @override
  void initState() {
    super.initState();
    _barOffset = 0.0;
    _viewOffset = 0.0;
    _isDragInProcess = false;

    _thumbAnimationController = AnimationController(
      vsync: this,
      duration: widget.scrollbarAnimationDuration,
    );

    _thumbAnimation = CurvedAnimation(
      parent: _thumbAnimationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _thumbAnimationController.dispose();
    _fadeoutTimer?.cancel();
    super.dispose();
  }

  double get barMaxScrollExtent {
    if (_constraints == null) return 0;
    return (_constraints!.maxHeight - widget.heightScrollThumb - 100)
        .clamp(0, double.infinity);
  }

  double get barMinScrollExtent => 0;

  double get viewMaxScrollExtent {
    final scrollController = widget.controller.scrollController;
    if (scrollController == null || !scrollController.hasClients) {
      return 0; // Silently return 0 instead of printing
    }
    if (!scrollController.position.hasViewportDimension) {
      return 0;
    }
    return (scrollController.position.maxScrollExtent -
        scrollController.position.minScrollExtent);
  }

  double get viewMinScrollExtent {
    final scrollController = widget.controller.scrollController;
    if (scrollController == null || !scrollController.hasClients) {
      return 0; // Silently return 0
    }
    if (!scrollController.position.hasViewportDimension) {
      return 0;
    }
    return scrollController.position.minScrollExtent;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _constraints = constraints;
        return NotificationListener<ScrollNotification>(
          key: const Key("DraggableListViewNotificationListener"),
          onNotification: (ScrollNotification notification) {
            changePosition(notification);
            return false;
          },
          child: Stack(
            key: const Key("DraggableListViewWholeView"),
            children: <Widget>[
              RepaintBoundary(child: widget.child),
              if (barMaxScrollExtent > 0)
                RepaintBoundary(
                  key: const Key("RepaintBoundaryScrollbarDraggableListView"),
                  child: GestureDetector(
                    key: const Key(
                        "RepaintBoundaryScrollbarDraggableListViewGD"),
                    onVerticalDragStart: _onVerticalDragStart,
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragEnd: _onVerticalDragEnd,
                    child: Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: max(0, _barOffset + 50)),
                      padding: widget.padding,
                      child: widget.scrollThumbBuilder(
                        widget.backgroundColor,
                        _thumbAnimation,
                        widget.heightScrollThumb,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void changePosition(ScrollNotification notification) {
    if (_isDragInProcess) return;

    final scrollController = widget.controller.scrollController;
    if (scrollController == null || !scrollController.hasClients) {
      return; // Silently skip if not attached
    }

    // Schedule position change after frame to ensure UI stability
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !scrollController.hasClients) {
        return; // Skip if widget is disposed or controller detached
      }

      setState(() {
        if (notification is ScrollUpdateNotification) {
          if (notification.scrollDelta == null) return;

          _barOffset += getBarDelta(
            notification.scrollDelta!,
            barMaxScrollExtent,
            viewMaxScrollExtent,
          );
          _barOffset = _barOffset.clamp(barMinScrollExtent, barMaxScrollExtent);

          _viewOffset += notification.scrollDelta!;
          _viewOffset = _viewOffset.clamp(
            scrollController.position.minScrollExtent,
            viewMaxScrollExtent,
          );
        }

        if (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification) {
          if (_thumbAnimationController.status != AnimationStatus.forward) {
            _thumbAnimationController.forward();
          }

          _fadeoutTimer?.cancel();
          _fadeoutTimer = Timer(widget.scrollbarTimeToFade, () {
            if (mounted) {
              _thumbAnimationController.reverse();
              _fadeoutTimer = null;
            }
          });
        }
      });
    });
  }

  double getBarDelta(
    double scrollViewDelta,
    double barMaxScrollExtent,
    double viewMaxScrollExtent,
  ) {
    if (viewMaxScrollExtent <= 0 || !viewMaxScrollExtent.isFinite) return 0;
    return scrollViewDelta * barMaxScrollExtent / viewMaxScrollExtent;
  }

  double getScrollViewDelta(
    double barDelta,
    double barMaxScrollExtent,
    double viewMaxScrollExtent,
  ) {
    if (barMaxScrollExtent <= 0 || !barMaxScrollExtent.isFinite) return 0;
    return barDelta * viewMaxScrollExtent / barMaxScrollExtent;
  }

  void _onVerticalDragStart(DragStartDetails details) {
    widget.onDragging?.call(dragging: true);
    setState(() {
      _isDragInProcess = true;
      _fadeoutTimer?.cancel();
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    widget.onDragging?.call(dragging: true);

    final scrollController = widget.controller.scrollController;
    if (scrollController == null || !scrollController.hasClients) {
      return; // Silently skip if not attached
    }

    setState(() {
      if (_thumbAnimationController.status != AnimationStatus.forward) {
        _thumbAnimationController.forward();
      }

      if (_isDragInProcess) {
        _barOffset = (_barOffset + details.delta.dy)
            .clamp(barMinScrollExtent, barMaxScrollExtent);

        final double viewDelta = getScrollViewDelta(
          details.delta.dy,
          barMaxScrollExtent,
          viewMaxScrollExtent,
        );

        _viewOffset = (_viewOffset + viewDelta).clamp(
          scrollController.position.minScrollExtent,
          viewMaxScrollExtent,
        );

        final double indexRatio =
            barMaxScrollExtent > 0 ? _barOffset / barMaxScrollExtent : 0;
        final int targetIndex = (indexRatio * widget.child.itemCount)
            .clamp(0, widget.child.itemCount - 1)
            .toInt();

        widget.controller.jumpTo(index: targetIndex);
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    _fadeoutTimer = Timer(widget.scrollbarTimeToFade, () {
      _fadeoutTimer = null;
    });

    setState(() => _isDragInProcess = false);
  }
}
