

import 'package:equatable/equatable.dart';

abstract class CartItemsBlocEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class AddItemToCart extends CartItemsBlocEvent {
  final Map<String , String> cartItem;
  AddItemToCart(this.cartItem);
}

class RemoveItemFromCart extends CartItemsBlocEvent {}
