import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/utils/widgets/my_text_button.dart';
import 'package:plant_shop/utils/widgets/my_text_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                Column(
                  children: [

                    /// back button
                    Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: AppColors.lightGreenColor,
                              shape: BoxShape.circle
                            ),
                            child: const Icon(Icons.arrow_back_ios_new_outlined,size: 22,),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: height * 0.15,
                      child: Hero(
                        tag: 'sigin_hero',
                          child: Image.asset('images/sigin_leaf.png',fit: BoxFit.contain,)),
                    ),

                    const MyText(
                      title: "Register",
                      color: AppColors.primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                    const MyText(
                      title: "Create your new account",
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),

                /// form
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Form(
                      child: Column(
                    children: [
                      /// first name textFormField
                      const MyTextFormFeild(
                        prefixIcon: Icon(Icons.person,color: AppColors.primaryColor,),                        hintText: "First name",
                        fillColor: AppColors.lightGreenColor,
                        borderRadius: 12,
                        borderSide:
                            BorderSide(color: AppColors.lightGreenColor),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),

                      /// email textFormField
                      const MyTextFormFeild(
                        prefixIcon: Icon(Icons.email,color: AppColors.primaryColor,),
                        hintText: "Email",
                        fillColor: AppColors.lightGreenColor,
                        borderRadius: 12,
                        borderSide:
                            BorderSide(color: AppColors.lightGreenColor),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),

                      /// password textFormField
                      const MyTextFormFeild(
                          prefixIcon: Icon(Icons.lock,color: AppColors.primaryColor,),
                          hintText: "Password",
                          fillColor: AppColors.lightGreenColor,
                          borderRadius: 12,
                          borderSide:
                              BorderSide(color: AppColors.lightGreenColor)),
                      SizedBox(
                        height: height * 0.004,
                      ),

                    ],
                  )),
                ),
                SizedBox(
                  height: height * 0.07,
                ),

                /// sign up and already have an accounty buttons
                Column(
                  children: [
                    /// sign in button
                    MyTextButton(
                      title: "Sign up",
                      textColor: AppColors.whiteColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: 30,
                      width: width * 0.90,
                      height: 46,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),

                    /// dont't have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyText(
                          title: "Already have an account?",
                          color: AppColors.greyColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        MyTextButton(
                          title: "Sign in",
                          textColor: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          onTap: (){
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
