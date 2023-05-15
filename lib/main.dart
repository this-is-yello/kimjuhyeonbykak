import 'package:flutter/material.dart';
import 'package:opscroll_web/opscroll_web.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '김주현바이각',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  List<String> mainBackground = [
    'assets/images/tailorShop_bg.png',
    'assets/images/tailorAcademy_bg.png',
    'assets/images/jemulpoClub_bg.png',
    'assets/images/rentalCenter_bg.png',
  ];
  List<String> mainTitles = [
    'k!mjuhyeon by 覺',
    'by 覺 Tailor Academy',
    'New JemulpoClub',
    'by 覺 RentalCenter',
  ];
  List<String> mainSubTitles = [
    '전통과 정통을 바느질하다.',
    '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
    '개화기 제물포구락부의 역사를 계승하고자 합니다.',
    '그 날을 위한 자신감, 바이각',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpscrollWeb(
        pageController: _pageController,
        onePageChildren: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CarouselSlider.builder(
              slideBuilder: (index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        mainBackground[index],
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mainTitles[index],
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        mainSubTitles[index],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
              slideTransform: DefaultTransform(),
              slideIndicator: CircularSlideIndicator(
                currentIndicatorColor: Colors.white,
                padding: EdgeInsets.only(bottom: 80),
              ),
              unlimitedMode: true,
              itemCount: mainBackground.length,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.green,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
          ),
          // Container(
          //   // width: MediaQuery.of(context).size.width,
          //   // height: MediaQuery.of(context).size.height,
          //   child: Image.asset(
          //     'assets/images/rentalCenter_bg.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
        scrollCurve: Curves.easeIn,
        scrollSpeed: const Duration(milliseconds: 1000),
        isFloatingButtonActive: false,
        // isTouchScrollingActive: false,
        scrollingAnimationOptions: ScrollingAnimationOptions.Default,
      ),
    );
  }
}
