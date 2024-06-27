

import 'package:equatable/equatable.dart';

class CartItemsBlocState extends Equatable {

  final List<Map<String , String>> cartItems;

  CartItemsBlocState({this.cartItems = const []});

  CartItemsBlocState copyWith({List<Map<String , String>>? cartItems}){
    return CartItemsBlocState(cartItems: cartItems ?? this.cartItems);
  }


  @override
  List<Object> get props => [cartItems];

}