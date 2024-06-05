import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/utils/widgets/my_text_button.dart';

class ItemDetailView extends StatelessWidget {
  final String itemImage;
  final Object? heroTag;
  const ItemDetailView({super.key, required this.itemImage,this.heroTag});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.04,
          ),

          /// back icon button
          IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),

          /// item Image
          Hero(
            tag: heroTag!,
            child: Image.asset(itemImage,fit: BoxFit.contain,width: width,height: height * 0.36,)
          ),


          /// quantity
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: width * 0.24,
              margin: EdgeInsets.only(right: 12.0, top: 8.0),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.minimize,
                    color: AppColors.whiteColor,
                  ),
                  MyText(
                    title: "3",
                    fontSize: 17,
                    color: AppColors.whiteColor,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),

          /// item details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// item name
                MyText(
                  title: "Item Name",
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: height * 0.01,),

                /// item stars
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                    ),
                    MyText(
                      title: '4.6',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),

                /// item price
                MyText(
                  title: "\$58.30",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: height * 0.01,),

                /// item descripition
                MyText(
                    title:
                        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual"
                        "form of a document or a typeface without relying on meaningful content form of a document or a typeface without relying on meaningful content",
                  fontSize: 16,color: Colors.grey.shade700,),
                SizedBox(height: height * 0.015,),

                /// item sun light and temperature
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.sunny,color: AppColors.primaryColor,),
                        SizedBox(width: width * 0.03,),
                        Column(
                          children: [
                            MyText(title: "Sunlight",color: AppColors.primaryColor,),
                            MyText(title: "20-25%")
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: width * 0.04,),
                    Row(
                      children: [
                        Icon(Icons.wb_sunny_outlined,color: AppColors.primaryColor,),
                        SizedBox(width: width * 0.02,),
                        Column(
                          children: [
                            MyText(title: "Sunlight",color: AppColors.primaryColor,),
                            MyText(title: "20-25%")
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02,),

                /// Add to Cart Button
                MyTextButton(title: "Add to cart",fontSize: 20 , fontWeight: FontWeight.w500 ,backgroundColor: AppColors.primaryColor,textColor: AppColors.whiteColor,width: width * 0.90,height: height * 0.06,borderRadius: 20,alignment: Alignment.center,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
