


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/view/bottom_navigator_view/bottom_navigator_view.dart';

class SplashViewModel {

  void splashTime(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => BotttomNavigatorView()));
    });
  }

}