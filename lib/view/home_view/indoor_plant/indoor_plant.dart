

import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
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
            crossAxisCount: 2,
          childAspectRatio: 2/2.3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6
        ),
        itemBuilder: (context , index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailView(itemImage: "${AppColors.plants[index]['plantImage']}${index+1}.jpeg",heroTag: "detailItem${index}",)));
            },
            child: Card(
              color: AppColors.whiteColor,
              elevation: 4,
              child: Column(
                children: [
                  /// plant image
                  Hero(tag: 'detailItem${index}', child: Image.asset("${AppColors.plants[index]['plantImage']}${index+1}.jpeg",fit: BoxFit.cover,height: 136,)),

                  /// plant Nmae
                  MyText(title: "Bambo Plant",fontWeight: FontWeight.w500,),
                  SizedBox(height: height * 0.003,),

                  /// plant price
                  MyText(title: "\$48",fontSize: 13,)
                ],
              ),
            ),
          );
        });
  }
}
