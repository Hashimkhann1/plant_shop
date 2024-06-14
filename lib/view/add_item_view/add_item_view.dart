import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/view.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        titleSpacing: 4,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'images/trans.png',
              width: 52,
              height: 52,
              fit: BoxFit.contain,
            ),
            MyText(title: "Add item",fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.primaryColor,)
          ],
        ),
      ),
      body: Column(
        children: [
          MyTextFormFeild(hintText: "Title"),
          MyTextFormFeild(hintText: "Descriition"),
          MyTextFormFeild(hintText: "Descriition"),
        ],
            ),
    );
  }
}
