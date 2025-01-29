import 'package:dua/core/config/dua_color.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:flutter/material.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _TabBarDelegate(
        minHeight: sixtyFivePx,
        maxHeight: sixtyFivePx,
        child: Container(
          padding: paddingBottom12,
          color: DuaColor.navbarBGColorLight,
          child: Container(
            margin: paddingH16,
            padding: padding6,
            decoration: BoxDecoration(
              color: DuaColor.navbarBGColorLight,
              borderRadius: radius30,
              border: Border.all(color: DuaColor.primary20Color, width: twoPx),
            ),
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              isScrollable: false,
              dividerHeight: 0,
              indicator: BoxDecoration(
                color: DuaColor.primary10Color,
                borderRadius: radius24,
              ),
              unselectedLabelColor: DuaColor.textPrimaryColorLight,
              labelColor: DuaColor.primary100Color,
              labelStyle: TextStyle(
                fontSize: sixteenPx,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                SizedBox(width: double.infinity, child: Tab(text: 'Dua')),
                SizedBox(width: double.infinity, child: Tab(text: 'Juz')),
              ],
            ),
          ),
        ),
      ),
      pinned: true,
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  _TabBarDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
