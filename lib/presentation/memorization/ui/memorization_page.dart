import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MemorizationPage extends StatelessWidget {
  const MemorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Memorization',
      ),
    );
  }
}
