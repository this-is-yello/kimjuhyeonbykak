import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:kimjuhyeonbykak/style.dart';

// import 'package:opscroll_web/opscroll_web.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:countup/countup.dart';
import 'package:animate_do/animate_do.dart';

// ---------- Main_Carousel -----------------------------------------------------------------------------------------------------
class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final CarouselController _carouselController = CarouselController();

  List<String> mainBackgrounds = [
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
  List<String> mainViewLinks = [];

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
                      mainBackgrounds[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: FadeIn(
                      animate: true,
                      duration: Duration(milliseconds: 2000),
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
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 120),
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
                  mainTitles[0],
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
                  mainTitles[1],
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
                  mainTitles[2],
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
                  mainTitles[3],
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

// ---------- By_覺_Story -----------------------------------------------------------------------------------------------------
class BykakStory extends StatelessWidget {
  BykakStory({super.key});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: FadeIn(
        animate: true,
        duration: Duration(milliseconds: 2000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                width: 1400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 500,
                      height: 2,
                      color: blackColor,
                    ),
                    SizedBox(
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
            Center(
              child: Container(
                width: 1400,
                padding: EdgeInsets.only(
                  top: 40,
                  bottom: 120,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                    IconButton(
                      iconSize: 80,
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 1400,
              height: 2,
              color: blackColor,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- TailorShop -----------------------------------------------------------------------------------------------------
class TailorShopScreen extends StatefulWidget {
  const TailorShopScreen({super.key});

  @override
  State<TailorShopScreen> createState() => _TailorShopScreenState();
}

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
      child: FadeInDown(
        animate: true,
        duration: Duration(milliseconds: 2000),
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
                                    duration: Duration(milliseconds: 5000),
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
    );
  }
}

// ---------- TailorAcademy -----------------------------------------------------------------------------------------------------
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
      child: FadeInDown(
        animate: true,
        duration: Duration(milliseconds: 2000),
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
    );
  }
}

// ---------- New_JemulpoClub -----------------------------------------------------------------------------------------------------
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
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: FadeInDown(
        animate: true,
        duration: Duration(milliseconds: 2000),
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
    );
  }
}
