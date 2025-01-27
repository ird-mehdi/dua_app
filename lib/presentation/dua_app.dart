import 'package:dua/presentation/home/ui/home_page.dart';
import 'package:flutter/material.dart';

class DuaApp extends StatelessWidget {
  const DuaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
