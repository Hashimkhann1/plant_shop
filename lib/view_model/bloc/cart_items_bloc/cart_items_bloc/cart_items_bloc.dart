

import 'package:bloc/bloc.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc_event/cart_items_bloc_event.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc_state/cart_items_bloc_state.dart';

class CartItemsBloc extends Bloc<CartItemsBlocEvent , CartItemsBlocState> {

  final List<Map<String,String>> cartItems = [];

  CartItemsBloc() : super(CartItemsBlocState()) {

    on<AddItemToCart>(_addItemToCart);
    on<RemoveItemFromCart>(_removeItemFromCart);

  }

  void _addItemToCart(AddItemToCart event , Emitter emit) {
    cartItems.add(event.cartItem as Map<String , String>);
    emit(state.copyWith(cartItems: List.from(cartItems)));
  }

  void _removeItemFromCart(RemoveItemFromCart event , Emitter emit) {
    cartItems.remove(event.cartItem as Map<String , String>);
    emit(state.copyWith(cartItems: List.from(cartItems)));
  }


}