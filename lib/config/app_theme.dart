// config/app_them.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF003E7E),
        primary: const Color(0xFF003E7E),
        secondary: const Color(0xFFF2B300),
      ),
    );
  }
}
