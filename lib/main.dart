import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
// import 'package:opscroll_web/opscroll_web.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:mccounting_text/mccounting_text.dart';
import 'package:intl/intl.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// import 'package:kimjuhyeonbykak/test.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '김주현바이각',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 120,
      // color: blackColor.withOpacity(0.4),
      child: Center(
        child: SizedBox(
          width: 1400,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                height: 100,
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
                            fontSize: 20,
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
                            fontSize: 20,
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
                            fontSize: 20,
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
                            fontSize: 20,
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
                            fontSize: 20,
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
                            fontSize: 20,
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
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Hidable(
      //   preferredWidgetSize: Size.fromHeight(120),
      //   controller: ScrollController(),
      //   wOpacity: true,
      //   child: AppBar(
      //     toolbarHeight: 120,
      //     backgroundColor: blackColor,
      //     title: MainAppBar(),
      //   ),
      // ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            controller: _scrollController,
            children: [
              CarouselScreen(),
              BykakStory(),
              TailorShopScreen(),
              TailorAcademyScreen(),
              NewJemulpoClubScreen(),
              // OpscrollWeb(
              //   pageController: _pageController,
              //   onePageChildren: [
              //   ],
              //   scrollCurve: Curves.easeIn,
              //   scrollSpeed: const Duration(milliseconds: 1000),
              //   isFloatingButtonActive: false,
              //   scrollingAnimationOptions: ScrollingAnimationOptions.Default,
              // ),
              Footer(),
            ],
          ),
          MainAppBar(),
        ],
      ),
    );
  }
}

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
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

  mainCarouselText(a) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          child: Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            mainBackground[a],
            fit: BoxFit.cover,
          ),
        ),
        AnimationLimiter(
          child: AnimationConfiguration.staggeredList(
            position: 0,
            duration: Duration(milliseconds: 2000),
            child: FadeInAnimation(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainTitles[a],
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 20,
                    ),
                    child: Text(
                      mainSubTitles[a],
                      style: TextStyle(
                        fontSize: 24,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: Text(
                          'view',
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: whiteColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ImageSlideshow(
        initialPage: 0,
        indicatorColor: whiteColor,
        indicatorBackgroundColor: blackColor,
        indicatorRadius: 4,
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        // autoPlayInterval: 3000,
        isLoop: true,
        children: [
          mainCarouselText(0),
          mainCarouselText(1),
          mainCarouselText(2),
          mainCarouselText(3),
        ],
      ),
    );
  }
}

class BykakStory extends StatelessWidget {
  BykakStory({super.key});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 80, 20, 120),
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: AnimationConfiguration.staggeredList(
          position: 1,
          duration: Duration(milliseconds: 3000),
          child: SlideAnimation(
            horizontalOffset: 200,
            child: Center(
              child: SizedBox(
                width: 1200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By 覺 Story',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                      ),
                      child: Text(
                        '2014년 김주현바이각은 인천의 고급 수제양복을 알리기 위해,\n남성들을 위한 올바른 스타일링과 문화적 놀이터를 만들고자 설립되었습니다.',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TailorShopScreen extends StatefulWidget {
  const TailorShopScreen({super.key});

  @override
  State<TailorShopScreen> createState() => _TailorShopScreenState();
}

var numFormat = NumberFormat('###,###,###,###');

class _TailorShopScreenState extends State<TailorShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Center(
        child: SizedBox(
          width: 1400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'k!mjuhyeon by 覺',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                ),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 40,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '자세히보기',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 640,
                    height: 360,
                    color: blackColor,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '총 ',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            AnimatedDigitWidget(
                              value: 5981,
                              enableSeparator: true,
                              textStyle: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                              duration: Duration(milliseconds: 2000),
                            ),
                            // Text(
                            //   '10,000,000',
                            //   style: TextStyle(
                            //     fontSize: 48,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            Text(
                              ' 벌 제작',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '총 ',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            AnimatedDigitWidget(
                              value: 59804019,
                              enableSeparator: true,
                              textStyle: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                              duration: Duration(milliseconds: 2000),
                            ),
                            Text(
                              ' 번의 바느질',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '총 ',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            AnimatedDigitWidget(
                              value: 592119,
                              enableSeparator: true,
                              textStyle: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                              duration: Duration(milliseconds: 2000),
                            ),
                            Text(
                              ' 시간의 제작시간',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TailorAcademyScreen extends StatelessWidget {
  const TailorAcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Center(
        child: SizedBox(
          width: 1400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'by 覺 Tailor Academy',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                ),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 40,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '자세히보기',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '맞춤정장을 배워 무엇을 할 수 있을까?',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '"나는 테일러링을 배워서 ',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 56,
                              decoration: BoxDecoration(
                                // color: greyColor,
                                border: Border(
                                  bottom: BorderSide(
                                    color: blackColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              ' 을 하고싶다"',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 640,
                    height: 360,
                    color: blackColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewJemulpoClubScreen extends StatelessWidget {
  const NewJemulpoClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1400,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New JemulpoClub',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                  ),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '자세히보기',
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/panorama.png',
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: EdgeInsets.only(left: 20, right: 20),
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
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Instagram',
                      style: TextStyle(
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Blog',
                      style: TextStyle(
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Youtube',
                      style: TextStyle(
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '개인정보취급방침',
                          style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '이용약관',
                          style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '이메일무단수집거부',
                          style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '2023 DESIGNER ALL RIGHT RESERVED',
                      style: TextStyle(
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
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
