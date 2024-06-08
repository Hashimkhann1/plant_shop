
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/widgets/my_appbar_widget.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';

class FavouriteItemView extends StatelessWidget {
  const FavouriteItemView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const MyAppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.02,),

          /// first heading
          Padding(
            padding: EdgeInsets.only(left: width * 0.026),
            child: const MyText(title: "Your Favourite Plants",fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.primaryColor,),
          ),
          SizedBox(height: height * 0.004,),

          /// All Favourite Items
          Expanded(
            child: ListView.builder(
              itemCount: AppColors.plants.length,
                itemBuilder: (context , index) {
                  return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Card(
                  color: AppColors.whiteColor,
                  shadowColor: AppColors.whiteColor,
                  elevation: 10,
                  child: Row(
                    children: [
                      /// item image
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("${AppColors.plants[index]['plantImage']}${index+1}.jpeg",width: width * 0.30,height: height * 0.15,fit: BoxFit.cover,)
                      ),
            
                      /// name price and descripition
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(title: "Bamboo Plant",fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black54,),
                                  Icon(CupertinoIcons.heart_fill,color: AppColors.primaryColor,size: 19,)
                                ],
                              ),
                              MyText(title: "\$30",fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.primaryColor,),
                              MyText(title: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual" ,maxLines: 3,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,color: AppColors.greyColor,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
                }),
          )
        ],
      ),
    );
  }
}
