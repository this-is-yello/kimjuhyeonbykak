import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/main.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

// import 'package:opscroll_web/opscroll_web.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:countup/countup.dart';
import 'package:motion/motion.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();

  scrollState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.minScrollExtent ||
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        setState(() {
          topState = true;
        });
      } else {
        setState(() {
          topState = false;
        });
      }
    });
  }

  moveTop() {
    _scrollController.animateTo(
      MediaQuery.of(context).size.height * 0,
      duration: const Duration(milliseconds: 1800),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    topState = true;
    scrollState();
  }

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
              BykakStory(),
              TailorShopScreen(),
              TailorAcademyScreen(),
              NewJemulpoClubScreen(),
              Padding(
                padding: EdgeInsets.only(top: 120, bottom: 120),
                child: MainComment(),
              ),
              Footer(),
              bottomToTop(context, () => moveTop()),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MainAppBar(),
            ],
          ),
        ],
      ),
      floatingActionButton: topState
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: FloatingActionButton(
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: whiteColor,
                  size: 30,
                ),
                backgroundColor: bykakColor,
                onPressed: () {
                  moveTop();
                },
              ),
            ),
    );
  }
}

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
  List mainViewLinks = [
    Routes.TAILORSHOP,
    Routes.TAILORACADEMY,
    Routes.NEWJUMULPOCLUB,
    Routes.RENTALCENTER
  ];

  int picNum = 0;
  moveSel() {
    _carouselController.animateToPage(
      picNum,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: blackColor,
          child: CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: 4,
            options: CarouselOptions(
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height,
              viewportFraction: 1,
              animateToClosest: false,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(milliseconds: 1200),
              autoPlayInterval: Duration(milliseconds: 8000),
              onPageChanged: (index, reason) {
                setState(() {
                  picNum = index;
                });
              },
              initialPage: picNum,
            ),
            itemBuilder: (context, index, realIndex) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Motion.only(
                    filterQuality: FilterQuality.low,
                    translation:
                        TranslationConfiguration(maxOffset: Offset(0, 0)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            mainBackgrounds[index],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                          duration: Duration(milliseconds: 24000),
                        ),
                        child: Image.asset(
                          mainBackgrounds[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 100,
                      right: 20,
                    ),
                    child: FadeIn(
                      animate: true,
                      duration: const Duration(milliseconds: 2000),
                      // delay: const Duration(milliseconds: 300),
                      child: SizedBox(
                        width: widgetSize(context),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainTitles[index],
                              style: TextStyle(
                                fontSize: h1FontSize(context),
                                fontFamily: 'Cafe_24',
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                bottom: 20,
                              ),
                              child: Text(
                                mainSubTitles[index],
                                style: TextStyle(
                                  fontSize: h6FontSize(context),
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.rootDelegate.toNamed(mainViewLinks[index]);
                              },
                              child: Container(
                                width: c4BoxSize(context) - 10,
                                height: c4BoxSize(context) - 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(500),
                                  color: whiteColor,
                                ),
                                child: Center(
                                  child: Text(
                                    'view',
                                    style: TextStyle(
                                      fontSize: h7FontSize(context),
                                      fontFamily: 'Cafe_24',
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
        Column(
          children: [
            MediaQuery.of(context).size.width < 800
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            picNum = 0;
                            moveSel();
                          },
                          child: Container(
                            width: picNum == 0 ? 40 : 12,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: picNum == 0
                                  ? greyColor.withAlpha(200)
                                  : whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            picNum = 1;
                            moveSel();
                          },
                          child: Container(
                            width: picNum == 1 ? 40 : 12,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: picNum == 1
                                  ? greyColor.withAlpha(200)
                                  : whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            picNum = 2;
                            moveSel();
                          },
                          child: Container(
                            width: picNum == 2 ? 40 : 12,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: picNum == 2
                                  ? greyColor.withAlpha(200)
                                  : whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            picNum = 3;
                            moveSel();
                          },
                          child: Container(
                            width: picNum == 3 ? 40 : 12,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: picNum == 3
                                  ? greyColor.withAlpha(200)
                                  : whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            picNum = 0;
                            moveSel();
                          },
                          child: Text(
                            'Tailor Shop',
                            style: TextStyle(
                              fontSize: picNum == 0 ? 16 : 12,
                              fontWeight: picNum == 0 ? FontWeight.bold : null,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            picNum = 1;
                            moveSel();
                          },
                          child: Text(
                            'Tailor Academy',
                            style: TextStyle(
                              fontSize: picNum == 1 ? 16 : 12,
                              fontWeight: picNum == 1 ? FontWeight.bold : null,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            picNum = 2;
                            moveSel();
                          },
                          child: Text(
                            'Studio',
                            style: TextStyle(
                              fontSize: picNum == 2 ? 16 : 12,
                              fontWeight: picNum == 2 ? FontWeight.bold : null,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            picNum = 3;
                            moveSel();
                          },
                          child: Text(
                            'Rental Center',
                            style: TextStyle(
                              fontSize: picNum == 3 ? 16 : 12,
                              fontWeight: picNum == 3 ? FontWeight.bold : null,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: WidgetAnimator(
                atRestEffect: WidgetRestingEffects.bounce(),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: whiteColor,
                  size: 72,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ---------- By_覺_Story -----------------------------------------------------------------------------------------------------
class BykakStory extends StatefulWidget {
  const BykakStory({super.key});

  @override
  State<BykakStory> createState() => _BykakStoryState();
}

class _BykakStoryState extends State<BykakStory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widgetSize(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: 2,
                      color: blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: c1BoxSize(context),
                      height: c1BoxSize(context),
                      // color: blackColor,
                      child: Image.asset(
                        'assets/images/logos/bykakScissorLogo_b.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: 2,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: widgetSize(context),
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 100,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By 覺 Story',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        fontFamily: 'Cafe_24',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                      ),
                      child: Text(
                        '2014년 김주현바이각은 인천의 고급 수제양복을 알리기 위해,\n남성들을 위한 올바른 스타일링과 문화적 놀이터를 만들고자 설립되었습니다.',
                        style: TextStyle(
                          fontSize: h6FontSize(context) + 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: widgetSize(context),
              height: 2,
              margin: const EdgeInsets.only(bottom: 20),
              color: blackColor,
            ),
            ElevatedButton(
              style: elevatedBtnTheme,
              onPressed: () {
                Get.rootDelegate.toNamed(Routes.STORY);
              },
              child: Text(
                '자세히보기',
                style: TextStyle(
                  fontSize: h5FontSize(context),
                  decoration: TextDecoration.underline,
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- TailorShop -----------------------------------------------------------------------------------------------------
makingFilm() {
  return Image.asset(
    'assets/images/tailorShop_bg.png',
    fit: BoxFit.contain,
  );
}

countingText(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            '총 ',
            style: TextStyle(
              fontSize: h3FontSize(context),
            ),
          ),
          SizedBox(
            width: c1BoxSize(context) + 40,
            child: Countup(
              begin: 0,
              end: 5981,
              duration: const Duration(milliseconds: 3000),
              separator: ',',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '벌 제작',
            style: TextStyle(
              fontSize: h3FontSize(context),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
        ),
        child: Row(
          children: [
            Text(
              '총 ',
              style: TextStyle(
                fontSize: h3FontSize(context),
              ),
            ),
            SizedBox(
              width: c1BoxSize(context) + 40,
              child: Countup(
                begin: 0,
                end: 59804019,
                duration: const Duration(milliseconds: 5000),
                separator: ',',
                style: TextStyle(
                  fontSize: h1FontSize(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '번의 바느질',
              style: TextStyle(
                fontSize: h3FontSize(context),
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
              fontSize: h3FontSize(context),
            ),
          ),
          SizedBox(
            width: c1BoxSize(context) + 40,
            child: Countup(
              begin: 0,
              end: 592119,
              duration: const Duration(milliseconds: 4000),
              separator: ',',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '의 제작시간',
            style: TextStyle(
              fontSize: h3FontSize(context),
            ),
          ),
        ],
      ),
    ],
  );
}

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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: FadeInDown(
        animate: true,
        duration: const Duration(milliseconds: 2000),
        child: Center(
          child: SizedBox(
            width: widgetSize(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'k!mjuhyeon by 覺',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontFamily: 'Cafe_24',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                  ),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                    style: TextStyle(
                      fontSize: h6FontSize(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.TAILORSHOP);
                    },
                    child: Text(
                      '자세히보기',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        decoration: TextDecoration.underline,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
                MediaQuery.of(context).size.width < 800
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: makingFilm(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: countingText(context),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: makingFilm(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: countingText(context),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- TailorAcademy -----------------------------------------------------------------------------------------------------
doWhat(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '맞춤정장을 배워 무엇을 할 수 있을까?',
        style: TextStyle(
          fontSize: h4FontSize(context),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '"테일러링을 배워서 ',
            style: TextStyle(
              fontSize: h4FontSize(context),
            ),
          ),
          Container(
            width: c3BoxSize(context),
            height: MediaQuery.of(context).size.width < 800 ? 32 : 40,
            decoration: BoxDecoration(
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
                    fontSize: h6FontSize(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RotateAnimatedText(
                  '테일러샵 창업',
                  textStyle: TextStyle(
                    fontSize: h6FontSize(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RotateAnimatedText(
                  '쇼핑몰 오픈',
                  textStyle: TextStyle(
                    fontSize: h6FontSize(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            ' 을 하고싶다"',
            style: TextStyle(
              fontSize: h4FontSize(context),
            ),
          ),
        ],
      ),
    ],
  );
}

academyVideo() {
  return Image.asset(
    'assets/images/tailorAcademy_bg.png',
    fit: BoxFit.contain,
  );
}

class TailorAcademyScreen extends StatefulWidget {
  const TailorAcademyScreen({super.key});

  @override
  State<TailorAcademyScreen> createState() => _TailorAcademyScreenState();
}

class _TailorAcademyScreenState extends State<TailorAcademyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: FadeInDown(
        animate: true,
        duration: const Duration(milliseconds: 2000),
        child: Center(
          child: Container(
            width: widgetSize(context),
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'by 覺 Tailor Academy',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontFamily: 'Cafe_24',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                  ),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                    style: TextStyle(
                      fontSize: h6FontSize(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: ElevatedButton(
                    style: elevatedBtnTheme,
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.TAILORACADEMY);
                    },
                    child: Text(
                      '자세히보기',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        decoration: TextDecoration.underline,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
                MediaQuery.of(context).size.width < 800
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: doWhat(context),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: academyVideo(),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: doWhat(context),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: academyVideo(),
                          ),
                        ],
                      ),
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

class NewJemulpoClubScreen extends StatefulWidget {
  const NewJemulpoClubScreen({super.key});

  @override
  State<NewJemulpoClubScreen> createState() => _NewJemulpoClubScreenState();
}

class _NewJemulpoClubScreenState extends State<NewJemulpoClubScreen> {
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
        duration: const Duration(milliseconds: 2000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widgetSize(context),
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New JemulpoClub',
                    style: TextStyle(
                      fontSize: h1FontSize(context),
                      fontFamily: 'Cafe_24',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      bottom: 20,
                    ),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 40,
                    ),
                    child: ElevatedButton(
                      style: elevatedBtnTheme,
                      onPressed: () {
                        Get.rootDelegate.toNamed(Routes.NEWJUMULPOCLUB);
                      },
                      child: Text(
                        '자세히보기',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
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
            ),
          ],
        ),
      ),
    );
  }
}

class MainComment extends StatefulWidget {
  const MainComment({super.key});

  @override
  State<MainComment> createState() => _MainCommentState();
}

class _MainCommentState extends State<MainComment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          width: widgetSize(context),
          child: Text(
            textAlign: TextAlign.center,
            '바이각을 시작으로 옷에 대해\n보고, 배우고, 깨닫길 바라며..',
            style: TextStyle(
              fontFamily: 'Cafe_24',
              fontSize: h3FontSize(context),
              color: blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
