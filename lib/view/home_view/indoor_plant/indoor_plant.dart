

import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/responsive/responsive.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/view/item_detail_view/item_detail_view.dart';

class IndoorPlant extends StatelessWidget {
  const IndoorPlant({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GridView.builder(
      itemCount: AppColors.plants.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 2 : MediaQuery.of(context).size.width < 1241 ? 3 : 4,
          childAspectRatio: Responsive.isMobile(context) ? 2/2.3 : Responsive.isTablet(context) ? 1.8/1.7 : MediaQuery.of(context).size.width < 1555 ? 1.8/1.6 : 1.7/1.2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6
        ),
        itemBuilder: (context , index) {

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailView(itemImage: "${AppColors.plants[index]['plantImage']}${index+1}.jpeg",heroTag: "detailItem$index",)));
            },
            child: Card(
              color: AppColors.whiteColor,
              elevation: 4,
              child: Column(
                children: [
                  /// plant image
                  Hero(tag: 'detailItem$index', child: Image.asset("${AppColors.plants[index]['plantImage']}${index+1}.jpeg",fit: BoxFit.cover,height: Responsive.isMobile(context) ? 136 : height * 0.15,)),

                  /// plant name
                  const MyText(title: "Bamboo Plant",fontWeight: FontWeight.w500,),
                  SizedBox(height: height * 0.003,),

                  /// plant price
                  const MyText(title: "\$48",fontSize: 13,)
                ],
              ),
            ),
          );
        });
  }
}
