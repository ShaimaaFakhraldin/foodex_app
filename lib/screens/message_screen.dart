import 'package:flutter/material.dart';
// import 'package:foodex_app/widgets/bottom_nav.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  static const routeName = "/message";
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Message Screen"));
    //    bottomNavigationBar: BottomNavBar(currentIndex: 2, routeName: routeName),
  }
}
