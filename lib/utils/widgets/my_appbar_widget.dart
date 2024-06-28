import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/routes/routes_name.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final bool showCart;
  const MyAppBarWidget({super.key,this.automaticallyImplyLeading = false , this.showCart = true});

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
        showCart ? Stack(
          children: [
            Positioned(
              top: -3,
              right: 17,
              child: Container(
                child: MyText(title: '0',fontSize: 17,),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.cart_view);
                },
                icon: Icon(CupertinoIcons.shopping_cart))
          ],
        ) : SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}