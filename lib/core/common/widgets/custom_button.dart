import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkyou_task/presentaion/resources/color_manager.dart';
import 'package:linkyou_task/presentaion/resources/values_manager.dart';

import '../../../presentaion/resources/text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorManager.primary,
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppPadding.p12),
        ),
      ),
      child: Text(
        text,
        style: textStyle ?? AppTextStyles.buttonText,

      ),
    );
  }
}
