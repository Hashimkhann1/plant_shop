import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/utils/widgets/my_text_form_field.dart';
import 'package:plant_shop/view/home_view/indoor_plant/indoor_plant.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        titleSpacing: 4,
        title: Image.asset('images/trans.png',width: 40,height: 40,fit: BoxFit.contain,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03,),

            /// choose you fav plant text
            Container(
                width: width * 0.43,
                child: MyText(title: "Choose Your Favourite Plant",maxLines: 2,fontSize: 20,fontWeight: FontWeight.bold,)
            ),
            SizedBox(height: height * 0.02,),

            /// search text form field
            MyTextFormFeild(hintText: "Search",fillColor: Color(0xFFf2f2f2),borderSide: BorderSide(color: Colors.grey.shade100),focusedBorderColor: Colors.grey.shade100,),
            SizedBox(height: height * 0.02,),

            /// tab bar
            Container(
              height: height * 0.044,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                labelColor: AppColors.whiteColor,
                unselectedLabelColor: AppColors.primaryColor,
                dividerColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                tabs: [
                  Tab(child: MyText(title: "Indoor Plant"),),
                  Tab(child: MyText(title: "Flower"),),
                  Tab(child: MyText(title: "Tree"),),
                ],
              ),
            ),
            SizedBox(height: height * 0.02,),

            /// tab View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                  children: [
                    IndoorPlant(),
                    MyText(title: "2"),
                    MyText(title: "3"),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
