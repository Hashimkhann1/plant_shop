import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  const MyAppBarWidget({super.key,this.automaticallyImplyLeading = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      titleSpacing: 4,
      centerTitle: false,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Image.asset(
        'images/trans.png',
        width: 45,
        height: 45,
        fit: BoxFit.contain,
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.shopping_cart))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}