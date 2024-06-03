import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/utils/widgets/my_text_button.dart';
import 'package:plant_shop/utils/widgets/my_text_form_field.dart';
import 'package:plant_shop/view/auth_view/sign_up_view/sign_up_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                  height: height * 0.04,
                ),
                Column(
                  children: [
                    Container(
                      height: height * 0.26,
                      child: Hero(
                          tag: 'sigin_hero',
                          child: Image.asset('images/sigin_leaf.png',fit: BoxFit.contain,)),
                    ),
                    const MyText(
                      title: "Welcom Back",
                      color: AppColors.primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                    const MyText(
                      title: "Login to your account",
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
                      const MyTextFormFeild(
                          prefixIcon: Icon(Icons.password,color: AppColors.primaryColor,),
                          hintText: "Password",
                          fillColor: AppColors.lightGreenColor,
                          borderRadius: 12,
                          borderSide:
                              BorderSide(color: AppColors.lightGreenColor)),
                      SizedBox(
                        height: height * 0.004,
                      ),

                      /// forgot password
                      const Align(
                          alignment: Alignment.centerRight,
                          child: MyText(
                            title: "Forgot Password?",
                            color: AppColors.primaryColor,
                          )),
                    ],
                  )),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Column(
                  children: [
                    /// sign in button
                    MyTextButton(
                      title: "Sign in",
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
                          title: "Dont't have an account?",
                          color: AppColors.greyColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        MyTextButton(
                          title: "Sign up",
                          textColor: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
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
