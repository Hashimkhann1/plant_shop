

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03,),
            Padding(
              padding: EdgeInsets.only(left: width * 0.012),
              child: MyText(title: "Notificatioins",fontSize: 22,fontWeight: FontWeight.w600,color: AppColors.primaryColor,),
            ),
            SizedBox(height: height * 0.02,),

            /// notification card
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                  itemBuilder: (context , index) {
                  return Card(
                    color: AppColors.whiteColor,
                    elevation: 4,
                    child: ListTile(
                      leading: Image.asset('images/indoor1.jpeg',fit: BoxFit.cover,),
                      title: MyText(title: "Bamboo Plant",fontSize: 17,fontWeight: FontWeight.w500,color: AppColors.ligthGreyColor,),
                      subtitle: MyText(title: "You order is successfully placed.",maxLines: 1,overflow: TextOverflow.ellipsis,),
                    ),
                  );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
