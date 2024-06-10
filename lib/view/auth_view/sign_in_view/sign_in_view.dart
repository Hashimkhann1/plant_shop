import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/view_model/bloc/loadin_bloc/loading_bloc/loading_bloc.dart';
import 'package:plant_shop/view_model/bloc/loadin_bloc/loading_bloc_state/loading_bloc_state.dart';

import '../../../utils/view.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                    key: _formKey,
                      child: Column(
                    children: [
                      MyTextFormFeild(
                        controller: emailController,
                        prefixIcon: const Icon(Icons.email,color: AppColors.primaryColor,),
                        hintText: "Email",
                        fillColor: AppColors.lightGreenColor,
                        borderRadius: 12,
                        borderSide:
                        const BorderSide(color: AppColors.lightGreenColor),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Enter email";
                          }else if(!value.contains("@gmail.com")){
                            return "Invalid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      MyTextFormFeild(
                        controller: passwordController,
                          obscureText: true,
                          prefixIcon: const Icon(Icons.lock,color: AppColors.primaryColor,),
                          hintText: "Password",
                          fillColor: AppColors.lightGreenColor,
                          borderRadius: 12,
                          borderSide:
                          const BorderSide(color: AppColors.lightGreenColor),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Enter password";
                          }
                          return null;
                        },
                      ),
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
                    BlocBuilder<LoadingBloc , LoadingBlocState>(builder: (context , state) {
                      return MyTextButton(
                        title: "Sign in",
                        textColor: AppColors.whiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        backgroundColor: AppColors.primaryColor,
                        borderRadius: 30,
                        width: width * 0.90,
                        height: 46,
                        alignment: Alignment.center,
                        isLoading: state.isLoading,
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            AuthViewModel().signIn(context, emailController.text, passwordController.text);
                          }
                        },
                      );
                    }),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpView()));
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
