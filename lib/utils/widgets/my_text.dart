import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;
  const MyText(
      {super.key,
      required this.title,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
        this.maxLines,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
