import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkyou_task/presentaion/resources/color_manager.dart';
import 'package:linkyou_task/presentaion/resources/values_manager.dart';

import '../../../presentaion/resources/text_style.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isPassword;
final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.isPassword = false, this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
validator: widget.validator,
      controller: widget.controller,
      style:  AppTextStyles.bodyMedium,

      obscureText: widget.isPassword ? _isObscure : false,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextStyles.bodyMedium,
        prefixIcon: Icon(widget.icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        filled: true,
        fillColor: ColorManager.grey,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(_isObscure ? CupertinoIcons.eye_slash :CupertinoIcons.eye ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        )
            : null,
      ),
    );
  }
}
