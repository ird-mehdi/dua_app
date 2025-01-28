import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(text: 'Surah'),
        Tab(text: 'Juz'),
      ],
    );
  }
}
