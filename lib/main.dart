import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:kimjuhyeonbykak/style.dart';
// import 'package:opscroll_web/opscroll_web.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:countup/countup.dart';

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
      theme: ThemeData(fontFamily: 'LINE_seed'),
    );
  }
}

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      // color: blackColor.withOpacity(0.4),
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

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            controller: _scrollController,
            children: [
              CarouselScreen(),
              Padding(padding: EdgeInsets.all(80)),
              Center(
                child: SizedBox(
                  width: 1400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 500,
                        height: 2,
                        color: blackColor,
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        // color: blackColor,
                        child: Image.asset(
                          'assets/images/logos/bykakScissorLogo_b.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        width: 500,
                        height: 2,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(40)),
              BykakStory(),
              Padding(padding: EdgeInsets.all(40)),
              Center(
                child: Container(
                  width: 1400,
                  height: 2,
                  color: blackColor,
                ),
              ),
              Padding(padding: EdgeInsets.all(80)),
              TailorShopScreen(),
              Padding(padding: EdgeInsets.all(60)),
              TailorAcademyScreen(),
              Padding(padding: EdgeInsets.all(60)),
              NewJemulpoClubScreen(),
              Padding(padding: EdgeInsets.all(60)),
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
  final CarouselController _carouselController = CarouselController();

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
    'by 覺 Suit RentalCenter',
  ];
  List<String> mainSubTitles = [
    '전통과 정통을 바느질하다.',
    '어제보다 나은 작업물을 만드는 것이 이 시대의 장인정신입니다.',
    '개화기 제물포구락부의 역사를 계승하고자 합니다.',
    '그 날을 위한 자신감, 바이각',
  ];

  int picNum = 0;
  moveSel() {
    _carouselController.animateToPage(
      picNum,
      duration: Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
    );
    // print('selectedPage: ' + '$currentPage');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: 4,
            options: CarouselOptions(
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height,
              viewportFraction: 1,
              initialPage: 0,
              animateToClosest: false,
              onPageChanged: (index, reason) {
                setState(() {
                  picNum = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      mainBackground[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  AnimationLimiter(
                    child: AnimationConfiguration.staggeredList(
                      position: 0,
                      delay: Duration(milliseconds: 1000),
                      child: FadeInAnimation(
                        duration: Duration(milliseconds: 3000),
                        delay: Duration(milliseconds: 1000),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainTitles[index],
                              style: TextStyle(
                                fontSize: 56,
                                fontFamily: 'Cafe_24',
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
                                mainSubTitles[index],
                                style: TextStyle(
                                  fontSize: 24,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 72,
                                height: 72,
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
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  picNum = 0;
                  moveSel();
                  print(picNum);
                },
                child: Text(
                  'k!mjuhyeon by 覺',
                  style: TextStyle(
                    fontSize: picNum == 0 ? 17 : 16,
                    fontWeight: picNum == 0 ? FontWeight.bold : null,
                    color: whiteColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  picNum = 1;
                  moveSel();
                  print(picNum);
                },
                child: Text(
                  'by 覺 Tailor Academy',
                  style: TextStyle(
                    fontSize: picNum == 1 ? 17 : 16,
                    fontWeight: picNum == 1 ? FontWeight.bold : null,
                    color: whiteColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  picNum = 2;
                  moveSel();
                  print(picNum);
                },
                child: Text(
                  'New JemulpoClub',
                  style: TextStyle(
                    fontSize: picNum == 2 ? 17 : 16,
                    fontWeight: picNum == 2 ? FontWeight.bold : null,
                    color: whiteColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  picNum = 3;
                  moveSel();
                  print(picNum);
                },
                child: Text(
                  'by 覺 Suit RentalCenter',
                  style: TextStyle(
                    fontSize: picNum == 3 ? 17 : 16,
                    fontWeight: picNum == 3 ? FontWeight.bold : null,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
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
        padding: EdgeInsets.only(top: 60, bottom: 60),
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: AnimationConfiguration.staggeredList(
          position: 1,
          delay: Duration.zero,
          child: FadeInAnimation(
            duration: Duration(milliseconds: 4000),
            delay: Duration.zero,
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
                        fontSize: 56,
                        fontFamily: 'Cafe_24',
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
                          fontSize: 20,
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
      height: MediaQuery.of(context).size.height - 100,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
          position: 2,
          delay: Duration.zero,
          child: SlideAnimation(
            duration: Duration(milliseconds: 2000),
            delay: Duration.zero,
            verticalOffset: -600,
            child: FadeInAnimation(
              delay: Duration.zero,
              duration: Duration(milliseconds: 4000),
              child: Center(
                child: SizedBox(
                  width: 1400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'k!mjuhyeon by 覺',
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'Cafe_24',
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
                            fontSize: 20,
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
                            width: 640,
                            padding: EdgeInsets.only(left: 120),
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
                                    SizedBox(
                                      width: 320,
                                      child: Countup(
                                        begin: 0,
                                        end: 5981,
                                        duration: Duration(milliseconds: 3000),
                                        separator: ',',
                                        style: TextStyle(
                                          fontSize: 56,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '벌 제작',
                                      style: TextStyle(
                                        fontSize: 32,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '총 ',
                                        style: TextStyle(
                                          fontSize: 32,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320,
                                        child: Countup(
                                          begin: 0,
                                          end: 59804019,
                                          duration:
                                              Duration(milliseconds: 5000),
                                          separator: ',',
                                          style: TextStyle(
                                            fontSize: 56,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '번의 바느질',
                                        style: TextStyle(
                                          fontSize: 32,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '총 ',
                                      style: TextStyle(
                                        fontSize: 32,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 320,
                                      child: Countup(
                                        begin: 0,
                                        end: 592119,
                                        duration: Duration(milliseconds: 4000),
                                        separator: ',',
                                        style: TextStyle(
                                          fontSize: 56,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '의 제작시간',
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
            ),
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
      height: MediaQuery.of(context).size.height - 100,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
          position: 3,
          delay: Duration.zero,
          child: SlideAnimation(
            verticalOffset: -600,
            duration: Duration(milliseconds: 2000),
            delay: Duration.zero,
            child: FadeInAnimation(
              duration: Duration(milliseconds: 4000),
              delay: Duration.zero,
              child: Center(
                child: SizedBox(
                  width: 1400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'by 覺 Tailor Academy',
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'Cafe_24',
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
                            fontSize: 20,
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
                                      child: AnimatedTextKit(
                                        totalRepeatCount: 50000,
                                        animatedTexts: [
                                          RotateAnimatedText(
                                            '나만의 수트제작',
                                            textStyle: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          RotateAnimatedText(
                                            '테일러샵 창업',
                                            textStyle: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          RotateAnimatedText(
                                            '쇼핑몰 오픈',
                                            textStyle: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
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
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class NewJemulpoClubScreen extends StatelessWidget {
  const NewJemulpoClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
          position: 4,
          delay: Duration.zero,
          child: SlideAnimation(
            duration: Duration(milliseconds: 2000),
            delay: Duration.zero,
            verticalOffset: -600,
            child: FadeInAnimation(
              duration: Duration(milliseconds: 4000),
              delay: Duration.zero,
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
                            fontSize: 48,
                            fontFamily: 'Cafe_24',
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
                              fontSize: 20,
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
                  ScrollConfiguration(
                    behavior: MyCustomScrollBehavior(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/panorama.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/panorama.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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
