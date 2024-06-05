

import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/widgets/my_appbar_widget.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: MyAppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            SizedBox(height: height * 0.02,),
            MyText(title: "Notificatioins",fontSize: 22,fontWeight: FontWeight.w600,color: AppColors.primaryColor,)
          ],
        ),
      ),
    );
  }
}
