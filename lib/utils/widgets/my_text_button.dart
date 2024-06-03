import 'package:flutter/material.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final void Function()? onTap;
  const MyTextButton(
      {super.key,
      required this.title,
      this.fontWeight,
      this.fontSize,
      this.textColor,
      this.backgroundColor,
        this.borderRadius = 0,
      this.height,
      this.width,
      this.padding,
      this.alignment,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
            color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: MyText(
          title: title,
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
