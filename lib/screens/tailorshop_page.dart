import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:kimjuhyeonbykak/screens/first_screen.dart';

class TailorShopPage extends StatelessWidget {
  const TailorShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(),
          MainAppBar(),
        ],
      ),
    );
  }
}
