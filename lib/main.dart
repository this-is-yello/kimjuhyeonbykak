import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/screens/first_screen.dart';

import 'package:opscroll_web/opscroll_web.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:countup/countup.dart';

import 'package:kimjuhyeonbykak/test.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '김주현바이각',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(fontFamily: 'LINE_seed'),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // OpscrollWeb(
          //   pageController: _pageController,
          //   dropColor: blackColor,
          //   scrollingAnimationOptions: ScrollingAnimationOptions.Fading,
          //   onePageChildren: [
          //     CarouselScreen(),
          //     BykakStory(),
          //     TailorShopScreen(),
          //     TailorAcademyScreen(),
          //     NewJemulpoClubScreen(),
          //   ],
          // ),
          ListView(
            controller: _scrollController,
            physics: RangeMaintainingScrollPhysics(),
            children: [
              CarouselScreen(),
              // Padding(padding: EdgeInsets.all(80)),
              BykakStory(),
              // Padding(padding: EdgeInsets.all(80)),
              TailorShopScreen(),
              // Padding(padding: EdgeInsets.all(60)),
              TailorAcademyScreen(),
              // Padding(padding: EdgeInsets.all(60)),
              NewJemulpoClubScreen(),
              Padding(padding: EdgeInsets.all(60)),
              Footer(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainAppBar(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: blackColor.withOpacity(0.9),
                  ),
                  child: Center(
                    child: IconButton(
                      alignment: Alignment.center,
                      iconSize: 60,
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------- App_Bar -----------------------------------------------------------------------------------------------------
class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: blackColor.withOpacity(0.9),
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 1400,
            ),
            // width: 1400,
            // height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/images/logos/bykakLogo_w.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: InkWell(
                          child: Text(
                            '브랜드',
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: InkWell(
                          child: Text(
                            '홍보',
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: InkWell(
                          child: Text(
                            '제품',
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: InkWell(
                          child: Text(
                            '커뮤니티',
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: InkWell(
                          child: Text(
                            '비즈니스',
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     right: 20,
                      //   ),
                      //   child: InkWell(
                      //     child: Text(
                      //       'KOR',
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //         color: whiteColor,
                      //       ),
                      //     ),
                      //     onTap: () {},
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: InkWell(
                          child: Text(
                            '로그인',
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Footer -----------------------------------------------------------------------------------------------------
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: blackColor,
            width: 2,
          ),
        ),
        color: whiteColor,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1400,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Instagram',
                      style: TextStyle(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Blog',
                      style: TextStyle(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Youtube',
                      style: TextStyle(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '개인정보취급방침',
                          style: TextStyle(
                            fontSize: 14,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '이용약관',
                          style: TextStyle(
                            fontSize: 14,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '이메일무단수집거부',
                          style: TextStyle(
                            fontSize: 14,
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '2023 DESIGNER ALL RIGHT RESERVED',
                      style: TextStyle(
                        fontSize: 14,
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
