

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/responsive/responsive.dart';
import 'package:plant_shop/utils/widgets/my_appbar_widget.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/utils/widgets/profile_card_widget.dart';
import 'package:plant_shop/view_model/auth_view_model/auth_view_model.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: MyAppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Center(
          child: Container(
            width: Responsive.isDesktop(context) ? width * 0.42 : width,
            child: Column(
              children: [
                SizedBox(height: height * 0.06,),
                /// profile image
                CircleAvatar(radius: Responsive.isDesktop(context) ? 74 : 50,backgroundColor: AppColors.primaryColor,),
                SizedBox(height: height * 0.06,),

                /// name
                ProfileCardWidget(cardTitle: _auth.currentUser!.email.toString().split('@')[0],icon: CupertinoIcons.person,),
                SizedBox(height: height * 0.016,),

                /// gmail
                ProfileCardWidget(cardTitle: _auth.currentUser!.email.toString(),icon: CupertinoIcons.mail,),
                SizedBox(height: height * 0.016,),

                /// phone num
                ProfileCardWidget(cardTitle: "0313000000",icon: CupertinoIcons.phone,),
                SizedBox(height: height * 0.016,),

                /// address
                Container(
                  width: width * 0.90,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.07,vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 20,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(title: "Address:",color: AppColors.primaryColor,fontSize: 15,fontWeight: FontWeight.w500,),
                      MyText(title: "Charsadda Sardhair Gull abad pull " ,maxLines: 2,overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),
                SizedBox(height: height * 0.016,),

                /// log out
                InkWell(
                  onTap: (){

                    AuthViewModel().signOut(context);

                  },
                    child: ProfileCardWidget(cardTitle: "Log out",icon: Icons.logout,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


