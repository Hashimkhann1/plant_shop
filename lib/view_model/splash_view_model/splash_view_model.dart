


import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_shop/utils/responsive/responsive.dart';
import 'package:plant_shop/utils/view.dart';

class SplashViewModel {

  final _auth = FirebaseAuth.instance;


  void splashTime(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      if(_auth.currentUser != null) {
        Navigator.pushNamedAndRemoveUntil(context, Responsive.isDesktop(context) ? RoutesName.homeView : RoutesName.bottomNavigatorView , (route) => false);
      }else{
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.signInView, (route) => false);
      }
    });
  }

}