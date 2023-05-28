import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/restaurent.dart';

part 'cart_event.dart';
part 'cart_state.dart';
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(ProductAdded(cartItem: [])){

    on<AddProductToCart>((event, emit){
      _cartItems.add(event.cartItem);
      emit(ProductAdded(cartItem: _cartItems));
    });

    on<RemoveProduct>((event, emit){
      _cartItems.remove(event.productIndex);
      emit(ProductRemoved(cartItem: _cartItems));
    });

    on<ClearCart>((event, emit){
      emit(ClearCartList(cartItem: []));
    });
  }



  final List<RestaurentDatum> _cartItems = [];
  List<RestaurentDatum> get items => _cartItems;

}