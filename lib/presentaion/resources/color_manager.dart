import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();

  static const Color primary = Color(0xffFF4100);
  static const Color black = Color(0xff000000);
  static const Color black45 = Color(0xff131212);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF249D06);
  static const Color transparent = Colors.transparent;

  static Color? grey = Colors.grey[100];
  static Color? darkGrey = Color(0xFF812727);

  static Color shimmerBase = Colors.grey[300]!;
  static Color shimmerHighlight = Colors.grey[100]!;

  static Color blue = Colors.blue.shade700;
  static Color lightBlue = Colors.blue.shade50;

  static const Color error = Color(0xffFF4100);

}
