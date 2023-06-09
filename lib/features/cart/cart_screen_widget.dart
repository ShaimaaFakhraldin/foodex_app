import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../global/app_color.dart';
import 'bloc/bloc/cart_bloc.dart';
import 'cart_grid.dart';
import 'package:provider/provider.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Column(
      children: [
        const CartGrid(),
        Container(
          //    height: 20.h,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: greenColor1,
                  minimumSize: Size(double.infinity, 8.h)),
              onPressed: () {
                context.read<CartBloc>().add(const ClearCart());
              },
              child: const Text("child")),
        ),
        //  SpaceWidget(),
      ],
    );
  }
}
