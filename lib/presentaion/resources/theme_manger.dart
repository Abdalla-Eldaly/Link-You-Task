import 'package:flutter/material.dart';
import 'package:linkyou_task/presentaion/resources/color_manager.dart';

class ThemeManager {
  static ThemeData themeManager = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primary,
      onError: Colors.red,
      secondary: const Color(0xffA6A6A6),
    ),
    scaffoldBackgroundColor: ColorManager.grey,
    useMaterial3: true,
  );
}
