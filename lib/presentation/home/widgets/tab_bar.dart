import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TabBarDelegate(
        minHeight: sixtyFivePx,
        maxHeight: sixtyFivePx,
        child: Container(
          padding: paddingBottom12,
          color: context.color.navbarBGColor,
          child: Container(
            margin: paddingH16,
            padding: padding6,
            decoration: BoxDecoration(
              color: context.color.navbarBGColor,
              borderRadius: radius30,
              border:
                  Border.all(color: context.color.primaryColor20, width: twoPx),
            ),
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              isScrollable: false,
              dividerHeight: 0,
              indicator: BoxDecoration(
                color: context.color.primaryColor10,
                borderRadius: radius24,
              ),
              unselectedLabelColor: context.color.titleColor,
              labelColor: context.color.primaryColor100,
              labelStyle: TextStyle(
                fontSize: sixteenPx,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                _buildCustomTabItem(text: 'Dua'),
                _buildCustomTabItem(text: 'Ruqyah'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTabItem({required String text}) {
    return SizedBox(
      width: double.infinity,
      child: Tab(text: text),
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
