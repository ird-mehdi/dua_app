import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class DhikrPage extends StatelessWidget {
  const DhikrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dhikr',
      ),
      body: Padding(
        padding: EdgeInsets.all(sixteenPx),
        child: Column(
          children: [
            CustomSearchBar(hintText: 'Search by Dua'),
            gapH16,
          
          ],
        ),
      ),
    );
  }
}
