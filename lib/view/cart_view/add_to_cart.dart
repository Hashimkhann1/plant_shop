import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/responsive/responsive.dart';
import 'package:plant_shop/utils/routes/routes_name.dart';
import 'package:plant_shop/utils/widgets/my_appbar_widget.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc/cart_items_bloc.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc_event/cart_items_bloc_event.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc_state/cart_items_bloc_state.dart';

import '../../utils/widgets/my_text_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const MyAppBarWidget(
        showCart: false,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// cart title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: const MyText(
                title: "Cart",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),

            /// cart items
            Expanded(
              child: BlocBuilder<CartItemsBloc , CartItemsBlocState>(builder: (context , state) {
                return ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      print(state.cartItems[index]);
                      return Card(
                        color: AppColors.whiteColor,
                        shadowColor: AppColors.whiteColor,
                        elevation: 10,
                        child: Row(
                          children: [
                            /// item image
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(

                                  state.cartItems[index]['Type'] == "Indoor Plant" ? "${AppColors.plants[1]['plantImage']}${state.cartItems[index]['indexForImage']}.jpeg" : "${AppColors.flowerPlants[1]['plantImage']}${state.cartItems[index]['indexForImage']}.jpeg",
                                  width: Responsive.isDesktop(context)
                                      ? width * 0.11
                                      : width * 0.30,
                                  height: Responsive.isDesktop(context)
                                      ? height * 0.12
                                      : height * 0.13,
                                  fit: BoxFit.contain,
                                )),

                            /// name price and descripition
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                         MyText(
                                          title: state.cartItems[index]['plantName'].toString(),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: Responsive.isDesktop(context)
                                                  ? 12
                                                  : 8),
                                          child: const MyText(
                                            title: "\$30",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: Responsive.isDesktop(context) ||
                                              Responsive.isTablet(context)
                                              ? width * 0.11
                                              : width * 0.20,
                                          margin: const EdgeInsets.only(
                                              right: 12.0, top: 8.0),
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: const Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.remove,
                                                color: AppColors.whiteColor,
                                              ),
                                              MyText(
                                                title: "3",
                                                fontSize: 15,
                                                color: AppColors.whiteColor,
                                              ),
                                              Icon(
                                                Icons.add,
                                                color: AppColors.whiteColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            context.read<CartItemsBloc>().add(RemoveItemFromCart(state.cartItems[index]));
                                          },
                                          child: const Icon(
                                            Icons.delete_outline,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // MyText(title: "In publishing and graphic design, Lorem ipsum is a placeholder..." ,maxLines: 2,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,color: AppColors.greyColor,)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },),
            ),

            /// buy button
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: MyTextButton(
                title: "Buy",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                width: width,
                height: height * 0.06,
                borderRadius: 12,
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.buyer_info_view);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
