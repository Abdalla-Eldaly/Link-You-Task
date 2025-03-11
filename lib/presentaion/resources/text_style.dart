import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkyou_task/presentaion/resources/color_manager.dart';

class AppTextStyles {
  static final TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorManager.black45,
  );
  static final TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,

  );

  static final TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorManager.darkGrey,

  );

  static final TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
