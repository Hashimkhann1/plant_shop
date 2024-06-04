import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';

class MyTextFormFeild extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? fillColor;
  final BorderSide borderSide;
  final Color? focusedBorderColor;
  final double borderRadius;
  final TextEditingController? controller;
  const MyTextFormFeild(
      {super.key,
      required this.hintText,
        this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.fillColor = Colors.white,
      this.borderSide = const BorderSide(
        color: Colors.black,
      ),
        this.focusedBorderColor = AppColors.primaryColor,
      this.controller,
      this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
              borderSide: borderSide,
              borderRadius: BorderRadius.circular(borderRadius)
          ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor!),
            borderRadius: BorderRadius.circular(borderRadius)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: borderSide,
            borderRadius: BorderRadius.circular(borderRadius)
        ),
      ),
    );
  }
}
