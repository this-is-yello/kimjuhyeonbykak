import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageSlideshow(
        width: double.infinity,
        height: 1000,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        children: [
          Image.asset(
            'assets/images/tailorShop_bg.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/tailorAcademy_bg.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/jemulpoClub_bg.png',
            fit: BoxFit.cover,
          ),
        ],
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        // autoPlayInterval: 3000,
        isLoop: true,
      ),
    );
  }
}
