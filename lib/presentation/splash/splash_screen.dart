import 'package:dua/core/di/service_locator.dart';
import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:dua/presentation/main/ui/nav_bar_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _dataLoaded = false;
  bool _minimumTimeElapsed = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    _startMinimumTimer();
  }

  // Load data in background
  Future<void> _loadData() async {
    try {
      final repository = locate<DuaRepository>();
      await repository.getAllDua();

      if (mounted) {
        setState(() {
          _dataLoaded = true;
          _navigateIfReady();
        });
      }
    } catch (e) {
      print('Error loading data: $e');
      // Continue even if data loading fails
      if (mounted) {
        setState(() {
          _dataLoaded = true;
          _navigateIfReady();
        });
      }
    }
  }

  // Ensure splash screen shows for at least 1.5 seconds
  void _startMinimumTimer() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _minimumTimeElapsed = true;
          _navigateIfReady();
        });
      }
    });
  }

  // Navigate to main screen if both conditions are met
  void _navigateIfReady() {
    if (_dataLoaded && _minimumTimeElapsed) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NavBarPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo or icon
            Image.asset(
              'assets/images/png/app_icon.png',
              width: 120,
              height: 120,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.menu_book_rounded,
                  size: 120,
                  color: Colors.white,
                );
              },
            ),
            const SizedBox(height: 32),
            // App name
            Text(
              'Dua & Ruqyah',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 48),
            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
