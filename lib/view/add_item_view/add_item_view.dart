import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/view.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


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
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: width * 0.3,
              height: height * 0.44,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12)
              ),
            ),

            Container(
              width: width * 0.3,
              child: Column(
                children: [
                  SizedBox(height: height * 0.01,),
                  MyTextFormFeild(hintText: "Title"),
                  SizedBox(height: height * 0.02,),
                  MyTextFormFeild(hintText: "Descriition",maxLines: 4,),
                ],
              ),
            )
          ],
              ),
      ),
    );
  }
}
