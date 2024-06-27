

import 'package:flutter/material.dart';
import 'package:plant_shop/utils/view.dart';

class BuyerInfoView extends StatelessWidget {
  const BuyerInfoView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: height * 0.04,),
            MyText(title: "Delivery Info",fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.primaryColor,),

            SizedBox(height: height * 0.02,),
            MyTextFormFeild(hintText: "Full name"),
            SizedBox(height: height * 0.02,),
            MyTextFormFeild(hintText: "Email"),
            SizedBox(height: height * 0.02,),
            MyTextFormFeild(hintText: "Phone number"),
            SizedBox(height: height * 0.02,),
            MyTextFormFeild(hintText: "Postal code"),
            SizedBox(height: height * 0.02,),
            MyTextFormFeild(hintText: "Address",maxLines: 2,),
            SizedBox(height: height * 0.02,),
            Row(
              children: [
                Row(
                  children: [
                    MyText(title: "Pay now",color: AppColors.primaryColor,),
                    Checkbox(value: true, onChanged: (value){},activeColor: AppColors.primaryColor,),
                  ],
                ),
                Row(
                  children: [
                    MyText(title: "Cash on delivery",color: AppColors.primaryColor,),
                    Checkbox(value: false, onChanged: (value){},activeColor: AppColors.primaryColor,),
                  ],
                ),
              ],
            ),
            MyTextButton(title: "Place order",fontSize: 20,fontWeight: FontWeight.w600,textColor: AppColors.whiteColor,backgroundColor: AppColors.primaryColor,height: height * 0.06,width: width,borderRadius: 12,)
          ],
        ),
      ),
    );
  }
}
