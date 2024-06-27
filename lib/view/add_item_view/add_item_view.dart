import 'package:flutter/cupertino.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/view.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        titleSpacing: 4,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'images/trans.png',
              width: 52,
              height: 52,
              fit: BoxFit.contain,
            ),
            const MyText(title: "Add item",fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.primaryColor,)
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: width * 0.3,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: height * 0.44,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor,width: 3)
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(title: "Click to select imaeg",fontSize: 16,),
                    Icon(Icons.image,size: 50,color: AppColors.primaryColor,)
                  ],
                ),
              ),

              SizedBox(height: height * 0.01,),
              const MyTextFormFeild(hintText: "Title"),
              SizedBox(height: height * 0.02,),
              const MyTextFormFeild(hintText: "Descriition",maxLines: 4,),
              SizedBox(height: height * 0.01,),

              /// add item button
              MyTextButton(title: "Add Item",backgroundColor: AppColors.primaryColor,textColor: Colors.white,fontSize: 17,fontWeight: FontWeight.w600, width: width,height: height * 0.05,borderRadius: 8,),
            ],
                ),
        ),
      ),
    );
  }
}
