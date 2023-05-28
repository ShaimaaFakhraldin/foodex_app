import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodex_app/features/auth/bloc/bloc/auth_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import './global/app_color.dart';

import './screens/overview_screen.dart';
import 'features/cart/cart_screen.dart';
 import 'core/init/network/dio_manager.dart';
 import 'features/auth/bloc/service/auth_service.dart';
import 'features/auth/screens/signin_screen.dart';
import 'features/auth/screens/signup_screen.dart';
import 'features/cart/bloc/bloc/cart_bloc.dart';
import 'features/intro/SplashScreen.dart';
import 'features/intro/on_boarding_1.dart';
import 'features/intro/on_boarding_2.dart';
import './screens/biodata_screen.dart';
import './screens/profile_photo_screen.dart';
import 'features/auth/signup_success_screen.dart';
import './screens/message_screen.dart';
import './screens/profile_screen.dart';
import 'features/restauruant/menu_detail_screen.dart';
import 'features/restauruant/restaurant_detail_screen.dart';
import 'features/restauruant/restauruant_bloc/restauruant_bloc.dart';
import 'features/restauruant/service/restauruant_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(AuthService(DioManager.instance)),

        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(),

        ),
        BlocProvider<RestauruantBloc>(
          create: (_) => RestauruantBloc(RestaurantsService(DioManager.instance)),

        ),
      ],
        child:
      ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Amit Food Delivery',
              theme: lightTheme,
              darkTheme: darkTheme,
               initialRoute:SplashScreen.routeName ,
              routes: {
                SplashScreen.routeName: (context) => const SplashScreen(),
                OnBoarding1.routeName: (context) => const OnBoarding1(),
                OnBoarding2.routeName: (context) => const OnBoarding2(),
                SignInScreen.routeName: (context) => const SignInScreen(),
                SignUpscreen.routeName: (context) => const SignUpscreen(),
                BioDataScreen.routeName: (context) => const BioDataScreen(),
                CartScreen.routeName: (context) => const CartScreen(),
                OverViewScreenScreen.routeName: (context) =>
                    const OverViewScreenScreen(),
                ProfilePhoto.routeName: (ctx) => const ProfilePhoto(),
                SignUpSuccess.routeName: ((context) => const SignUpSuccess()),
                // MenuDetailScreen.routeName: ((context) =>
                //     const MenuDetailScreen()),
                ProfileScreen.routeName: (context) => const ProfileScreen(),
                MessageScreen.routeName: ((context) => const MessageScreen()),
                RestaurantDetailScreen.routeName: (context) =>
                    const RestaurantDetailScreen()
              },
            );
          },
        )
    );
  }
}
