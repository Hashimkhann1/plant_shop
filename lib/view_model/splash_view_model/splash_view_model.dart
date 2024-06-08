


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/routes/routes_name.dart';
import 'package:plant_shop/view/auth_view/sign_in_view/sign_in_view.dart';
import 'package:plant_shop/view/bottom_navigator_view/bottom_navigator_view.dart';

class SplashViewModel {

  final _auth = FirebaseAuth.instance;

  void splashTime(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      if(_auth.currentUser != null) {
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavigatorView, (route) => false);
      }else{
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.signInView, (route) => false);
      }
    });
  }

}