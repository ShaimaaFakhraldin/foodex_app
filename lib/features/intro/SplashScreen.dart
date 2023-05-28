import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/enums/auth_enums.dart';
import '../../global/app_color.dart';
import '../../screens/overview_screen.dart';
 import '../auth/bloc/bloc/auth_bloc.dart';
import '../auth/screens/signin_screen.dart';


class SplashScreen extends StatefulWidget {

  static const routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
     _controller.dispose();
     super.dispose();
  }

  @override
  void initState() {
    super.initState();

    /// For [animation]
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    timer();
  }


  timer(){
    Timer(Duration(seconds: 3),
            ()=>  Navigator.of(context)
                .pushReplacementNamed(SignInScreen.routeName)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/Pattern.png",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .5,
              )),
          Container(
            //    margin: EdgeInsets.only(top: 10.h),
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: [Colors.transparent, Colors.white],
            //         begin: const Alignment(0.0, -1.0),
            //         end: const Alignment(0.0, 0.6),
            //
            //         tileMode: TileMode.clamp)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Logo.png",
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "FoodNinja",
                    style: TextStyle(color: greenColor2, fontSize: 40),
                  ),
                  Text(
                    "Deliever Favorite Food",
                    style: TextStyle(color: lightTextColor, fontSize: 13),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
