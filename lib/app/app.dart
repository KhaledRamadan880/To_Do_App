import 'package:flutter/material.dart';
import '../core/util/theme.dart';
import '../features/auth/presentation/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(),
      home: const SplashScreen(),
    );
  }
}
