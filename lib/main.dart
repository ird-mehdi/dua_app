import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/dua_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.setUp();
  runApp(const DuaApp());
}
