

import 'package:fluttertoast/fluttertoast.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';

class Utils {

  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message.toString(),
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.whiteColor,
    );
  }

}