import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/utils/responsive/responsive.dart';
import 'package:plant_shop/utils/widgets/my_appbar_widget.dart';
import 'package:plant_shop/utils/widgets/my_text.dart';
import 'package:plant_shop/utils/widgets/my_text_button.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc/cart_items_bloc.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc_event/cart_items_bloc_event.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc_state/cart_items_bloc_state.dart';

class ItemDetailView extends StatelessWidget {
  final String itemImage;
  final Map itemDetails;
  final Object? heroTag;
  final int indexForImage;
  const ItemDetailView(
      {super.key, required this.itemImage, this.heroTag, required this.itemDetails,required this.indexForImage});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const MyAppBarWidget(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02,
          ),

          /// item Image
          Hero(
              tag: heroTag!,
              child: Center(
                  child: Image.asset(
                itemImage,
                fit: BoxFit.contain,
                width: Responsive.isDesktop(context) ? width * 0.22 : width,
                height: Responsive.isDesktop(context)
                    ? height * 0.44
                    : height * 0.34,
              ))),

          /// quantity
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width:
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? width * 0.11
                      : width * 0.20,
              margin: const EdgeInsets.only(right: 12.0, top: 8.0),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.whiteColor,
                  ),
                  MyText(
                    title: "3",
                    fontSize: 17,
                    color: AppColors.whiteColor,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),

          /// item details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// item name
                MyText(
                  title: itemDetails['plantName'].toString(),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: height * 0.01,
                ),

                /// item stars
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                    ),
                    MyText(
                      title: '4.6',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),

                /// item price
                MyText(
                  title: "\$${itemDetails['price']}",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: height * 0.01,
                ),

                /// item descripition
                Container(
                  width: Responsive.isDesktop(context) ? width * 0.54 : width,
                  child: MyText(
                    title:
                        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual"
                        "form of a document or a typeface without relying on meaningful content form of a document or a typeface without relying on meaningful content",
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),

                /// item sun light and temperature
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.sunny,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        const Column(
                          children: [
                            MyText(
                              title: "Sunlight",
                              color: AppColors.primaryColor,
                            ),
                            MyText(title: "20-25%")
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.wb_sunny_outlined,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Column(
                          children: [
                            MyText(
                              title: "Sunlight",
                              color: AppColors.primaryColor,
                            ),
                            MyText(title: "20-25%")
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Responsive.isDesktop(context)
                      ? height * 0.06
                      : height * 0.02,
                ),

                /// Add to Cart Button
                Center(
                    child: BlocBuilder<CartItemsBloc , CartItemsBlocState>(builder: (context , state){
                      return MyTextButton(
                        title: "Add to cart",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.whiteColor,
                        width: Responsive.isDesktop(context)
                            ? width * 0.46
                            : width * 0.90,
                        height: height * 0.06,
                        borderRadius: 20,
                        alignment: Alignment.center,
                        onTap: (){
                          itemDetails['indexForImage'] = indexForImage.toString();

                          Map<String, String> formattedItemDetails = itemDetails.map((key, value) => MapEntry(key.toString(), value.toString()));
                          // print(itemDetails);
                          context.read<CartItemsBloc>().add(AddItemToCart(formattedItemDetails));
                        },
                      );
                    },)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
