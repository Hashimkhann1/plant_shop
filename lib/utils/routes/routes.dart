
import 'package:plant_shop/view/buyer_info_view/buyer_info_view.dart';
import 'package:plant_shop/view/cart_view/add_to_cart.dart';

import '../view.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name){
      case RoutesName.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesName.signInView:
        return MaterialPageRoute(builder: (context) => SignInView());
      case RoutesName.signUpView:
        return MaterialPageRoute(builder: (context) => SignUpView());
      case RoutesName.bottomNavigatorView:
        return MaterialPageRoute(builder: (context) => const BottomNavigatorView());
      case RoutesName.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RoutesName.favouriteView:
        return MaterialPageRoute(builder: (context) => const FavouriteItemView());
      case RoutesName.addItemview:
        return MaterialPageRoute(builder: (context) => const AddItemView());
      case RoutesName.notificationView:
        return MaterialPageRoute(builder: (context) => const NotificationView());
      case RoutesName.profileView:
        return MaterialPageRoute(builder: (context) => ProfileView());
      case RoutesName.cart_view:
        return MaterialPageRoute(builder: (context) => CartView());
      case RoutesName.buyer_info_view:
        return MaterialPageRoute(builder: (context) => BuyerInfoView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(
            child: MyText(title: "No Route Found!"),
          ),
        ));
    }
  }

}