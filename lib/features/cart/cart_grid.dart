import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:lottie/lottie.dart';
import '../../widgets/cart_widget.dart';
import 'bloc/bloc/cart_bloc.dart';

class CartGrid extends StatelessWidget {
  const CartGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<CartBloc>();
     final cartList = cartProvider.items;
    // final cartKeys = cart.keys.toList();
    return cartList.isEmpty
        ? SizedBox(
            height: 78.h,
            child: Center(
              child: SizedBox(
                  height: 40.h,
                  child: Lottie.asset("assets/lotties/42176-empty-cart.json")),
            ),
          )
        : SizedBox(
            height: 78.h,
            child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, i) {
                  return CartWidget(
                    menuTitle: cartList[i].name,
                    menuImage: cartList[i].pic,
                    menuPrice: 0,
                    restaurantTitle: cartList[i].name,
                    menuQuantity: 1,
                    cartIncrement: () {
                      cartProvider.add(AddProductToCart(cartItem: cartList[i]));
                     },
                    cartDecrement: () {
                      // if (cartList[i].quantity < 2) {
                      //   return;
                      // }
                      // cartProvider.cartItemDecrement(cartKeys[i]);
                    },
                  );
                }),
          );
  }
}
