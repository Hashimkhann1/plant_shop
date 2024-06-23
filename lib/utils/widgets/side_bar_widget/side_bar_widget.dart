import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/constant/side_bar_data/side_bar_data.dart';
import 'package:plant_shop/utils/view.dart';

class SideBarWidget extends StatefulWidget {
  SideBarWidget({super.key});

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final data = SideBarData().data;

    return Container(
      padding: EdgeInsets.only(top: height * 0.08),
      width: width * 0.2,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 2
            )
          ]
      ),
      child: ListView.builder(
        itemCount: SideBarData().data.length,
          itemBuilder: (context, index){
          return SideBarButtons(data[index]['title'].toString(),data[index]['icon'] as IconData, data[index]['fillIcon'] as IconData, index , data[index]['routesName']);
      }),
    );
  }

  Widget SideBarButtons(String title , IconData icon , IconData filleIcon, int index , routesName){

    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
          Navigator.pushNamed(context, routesName);
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.greyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Row(
          children: [
            Icon(isSelected ? filleIcon : icon ,color: isSelected ? AppColors.whiteColor : AppColors.blackColor.withOpacity(0.6),),
            const SizedBox(width: 13,),
            MyText(title: title.toString(),fontSize: 16,fontWeight: FontWeight.w600,color: isSelected ? AppColors.whiteColor : AppColors.blackColor.withOpacity(0.6),)
          ],
        ),
      ),
    );
  }
}
