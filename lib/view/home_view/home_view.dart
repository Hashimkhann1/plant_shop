import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/responsive/responsive.dart';
import 'package:plant_shop/utils/widgets/my_appbar_widget.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/utils/widgets/my_text_form_field.dart';
import 'package:plant_shop/utils/widgets/side_bar_widget/side_bar_widget.dart';
import 'package:plant_shop/view/home_view/flower/flower.dart';
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
      appBar: const MyAppBarWidget(automaticallyImplyLeading: true,),
      body: Row(
        children: [
          !Responsive.isDesktop(context) ? const SizedBox() : Expanded(
            flex: 2,
            child: SideBarWidget()
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.03,),

                  /// choose you fav plant text
                  SizedBox(
                      width: width * 0.43,
                      child: const MyText(title: "Choose Your Favourite Plant",maxLines: 2,fontSize: 20,fontWeight: FontWeight.bold,)
                  ),
                  SizedBox(height: height * 0.02,),

                  /// search text form field
                  MyTextFormFeild(hintText: "Search",fillColor: const Color(0xFFf2f2f2),borderSide: BorderSide(color: Colors.grey.shade100),focusedBorderColor: Colors.grey.shade100,),
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
                      tabs: const [
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
                        children: const [
                          IndoorPlant(),
                          FlowerPlants(),
                          IndoorPlant(),
                        ]
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
