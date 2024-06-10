import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/view_model/bloc/loadin_bloc/loading_bloc/loading_bloc.dart';
import 'package:plant_shop/view_model/bloc/loadin_bloc/loading_bloc_state/loading_bloc_state.dart';

import '../../../utils/view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

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
                  height: height * 0.02,
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
                      height: height * 0.14,
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
                    key: _formKey,
                      child: Column(
                    children: [
                      /// first name textFormField
                      MyTextFormFeild(
                        controller: nameController,
                        prefixIcon: const Icon(Icons.person,color: AppColors.primaryColor,),                        hintText: "First name",
                        fillColor: AppColors.lightGreenColor,
                        borderRadius: 12,
                        borderSide:
                            const BorderSide(color: AppColors.lightGreenColor),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Enter name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),

                      /// email textFormField
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

                      /// password textFormField
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
                          }else if(value.length <= 6){
                            return "Password must be grather than 6 charcaters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),

                      /// confirm password textFormField
                      MyTextFormFeild(
                        controller: confirmController,
                          obscureText: true,
                          prefixIcon: const Icon(Icons.lock,color: AppColors.primaryColor,),
                          hintText: "Confirm password",
                          fillColor: AppColors.lightGreenColor,
                          borderRadius: 12,
                          borderSide:
                          const BorderSide(color: AppColors.lightGreenColor),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Enter confirm password";
                          }else if(value != passwordController.text){
                            return "Comnfirm password not matched";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.004,
                      ),

                    ],
                  )),
                ),
                SizedBox(
                  height: height * 0.05,
                ),

                /// sign up and already have an accounty buttons
                Column(
                  children: [
                    /// sign up button
                    BlocBuilder<LoadingBloc , LoadingBlocState>(builder: (context , state) {
                      return MyTextButton(
                        title: "Sign up",
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
                            AuthViewModel().registerUser(context, nameController.text, emailController.text, passwordController.text);
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
