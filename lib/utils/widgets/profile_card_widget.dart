

import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
    required this.cardTitle,
    required this.icon,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
  });

  final String cardTitle;
  final IconData icon;
  final double fontSize;
  final FontWeight? fontWeight;


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.centerLeft,
      width: width * 0.90,
      height: height * 0.08,
      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 20,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          MyText(title: cardTitle,fontSize: fontSize,color: AppColors.primaryColor,fontWeight: fontWeight,maxLines: 2,overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}