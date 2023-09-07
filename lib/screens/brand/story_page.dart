import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';

import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:image_fade/image_fade.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
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
      0,
      duration: const Duration(milliseconds: 1800),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    topState = true;
    inMypage = false;
    scrollState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              controller: _scrollController,
              shrinkWrap: true,
              children: [
                StoryMain(),
                StoryContent(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: Footer(),
                ),
                bottomToTop(context, () => moveTop()),
              ],
            ),
          ),
          MainAppBar(),
        ],
      ),
      floatingActionButton: topState
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: FloatingActionButton(
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Color(0xFFFFFFFF),
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

// ---------- Story_Main -----------------------------------------------------------------------------------------------------
class StoryMain extends StatelessWidget {
  const StoryMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            'assets/images/background/story_bg.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 120),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By 覺 Story',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        fontFamily: 'NotoSerif',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 20,
                      ),
                      child: Text(
                        '바이각스토리',
                        style: TextStyle(
                          fontSize: h2FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    Text(
                      '바이각을 시작으로 옷에 대해 보고, 배우고, 깨닫길 바라며',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: WidgetAnimator(
              atRestEffect: WidgetRestingEffects.bounce(),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xFFFFFFFF),
                size: 72,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Story_Content -----------------------------------------------------------------------------------------------------
class StoryContent extends StatefulWidget {
  const StoryContent({super.key});

  @override
  State<StoryContent> createState() => _StoryContentState();
}

class _StoryContentState extends State<StoryContent> {
  int storyNum = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: widgetSize(context),
            child: Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 360,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: blackColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            setState(() {
                              storyNum = 0;
                            });
                          },
                          child: Text(
                            'Ceo Message',
                            style: TextStyle(
                              fontSize: storyNum == 0 ? 14 : 13,
                              fontWeight: storyNum == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            setState(() {
                              storyNum = 1;
                            });
                          },
                          child: Text(
                            '연혁',
                            style: TextStyle(
                              fontSize: storyNum == 1 ? 14 : 13,
                              fontWeight: storyNum == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: elevatedBtnTheme,
                          onPressed: () {
                            setState(() {
                              storyNum = 2;
                            });
                          },
                          child: Text(
                            'CI·BI',
                            style: TextStyle(
                              fontSize: storyNum == 2 ? 14 : 13,
                              fontWeight: storyNum == 2
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FadeIn(
            child: storyNum == 0
                ? CeoMessageScreen()
                : storyNum == 1
                    ? HistoryScreen()
                    : CiBiScreen(),
          ),
        ],
      ),
    );
  }
}

// ---------- CEO_Message -----------------------------------------------------------------------------------------------------
class CeoMessageScreen extends StatelessWidget {
  const CeoMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width < 800
                ? widgetSize(context)
                : widgetSize(context) / 2 - 10,
            child: fadeImage('assets/images/ceo_message.png'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width < 800
                ? widgetSize(context)
                : widgetSize(context) / 2 - 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'CEO Message',
                    style: TextStyle(
                      fontSize: h5FontSize(context) + 2,
                      // fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                Text(
                  '김주현입니다.',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    fontFamily: 'NotoSerif',
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '#전통과 정통을 바느질 하다.',
                    style: TextStyle(
                      fontSize: h4FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
                Text(
                  '2014년 처음 문을 연 k!mjuhyeon by 覺(김주현바이각)은\n살아온 인천에 고급수제양복을 알리기 위해,\n남성들의 문화공간이 될 수 있는 놀이터를 만들고자 설립되었습니다.\nby 覺(바이각)의 상위라벨인 Black Label(블랙라벨)은\n빠르게 만들어져 쉽게 소비되고, 버려지는 옷이 아닌\n입는 사람의 직업, 취향, 추억을 공유할 수 있는 인천 유일의\n맞춤 테일러링을 기반으로 하는 비스포크 테일러샵 입니다.',
                  style: TextStyle(
                    height: 2,
                    fontSize: h5FontSize(context),
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '자신을 가꾸어 나가는 것, 그리고 유행을 따르지 않는 것,\n그것이 비스포크의 매력입니다.\n우리의 주 고객들은 자신을 사랑하고, 자신감이 넘치며\n성공적인 삶을 사는 남성분들입니다.\n올바른 옷 입기가 우리의 삶을 윤택하게 만들 것 입니다.\n좋은 인연으로 맺기를 기도합니다.',
                    style: TextStyle(
                      height: 2,
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
                Text(
                  '감사합니다.',
                  style: TextStyle(
                    fontSize: h5FontSize(context),
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- History -----------------------------------------------------------------------------------------------------
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
          },
        ),
        child: Column(
          children: [
            Text(
              'History',
              style: TextStyle(
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold,
                fontSize: h2FontSize(context),
                color: blackColor,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 320,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 320,
                    color: darkState ? Color(0xFF1E1E1E) : Color(0xFFFFFFFF),
                    child: ImageFade(
                      image: AssetImage(
                        'assets/images/history_3.png',
                      ),
                      fit: BoxFit.fitHeight,
                      duration: const Duration(milliseconds: 900),
                      syncDuration: const Duration(milliseconds: 150),
                      loadingBuilder: (context, progress, chunkEvent) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: blackColor,
                          ),
                        );
                      },
                      // placeholder: Padding(
                      //   padding: const EdgeInsets.all(20),
                      //   child: Center(
                      //     child: CircularProgressIndicator(
                      //       color: blackColor,
                      //     ),
                      //   ),
                      // ),
                      errorBuilder: (context, error) => Container(
                        color: const Color(0xFFFFFFFF),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.warning,
                          color: Color(0xFF1E1E1E),
                          size: 60.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // fadeImage('assets/images/history.png'),
          ],
        ),
      ),
    );
  }
}

// ---------- CI·BI -----------------------------------------------------------------------------------------------------
class CiBiScreen extends StatelessWidget {
  const CiBiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize(context),
      child: Column(
        children: [
          SizedBox(
            width: widgetSize(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    '1. 로고',
                    style: TextStyle(
                      fontSize: h2FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
                // Text(
                //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ',
                //   style: TextStyle(
                //     fontSize: h5FontSize(context),
                //     color: blackColor,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        width: widgetSize(context),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            Container(
                              width: c2BoxSize(context),
                              child: ImageFade(
                                image: AssetImage(
                                  darkState
                                      ? 'assets/images/logos/bykakLogo_w.png'
                                      : 'assets/images/logos/bykakLogo_b.png',
                                ),
                                fit: BoxFit.fitWidth,
                                duration: const Duration(milliseconds: 900),
                                syncDuration: const Duration(milliseconds: 150),
                                errorBuilder: (context, error) => Container(
                                  color: const Color(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.warning,
                                    color: Color(0xFF1E1E1E),
                                    size: 60.0,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: c1BoxSize(context),
                              child: ImageFade(
                                image: AssetImage(
                                  darkState
                                      ? 'assets/images/logos/bykakTextLogo_w.png'
                                      : 'assets/images/logos/bykakTextLogo_b.png',
                                ),
                                fit: BoxFit.fitWidth,
                                duration: const Duration(milliseconds: 900),
                                syncDuration: const Duration(milliseconds: 150),
                                errorBuilder: (context, error) => Container(
                                  color: const Color(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.warning,
                                    color: Color(0xFF1E1E1E),
                                    size: 60.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: widgetSize(context),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: blackColor,
                          border: Border.all(
                            color: blackColor,
                            width: 2,
                          ),
                        ),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            Container(
                              width: c2BoxSize(context),
                              child: ImageFade(
                                image: AssetImage(
                                  darkState
                                      ? 'assets/images/logos/bykakLogo_b.png'
                                      : 'assets/images/logos/bykakLogo_w.png',
                                ),
                                fit: BoxFit.fitWidth,
                                duration: const Duration(milliseconds: 900),
                                syncDuration: const Duration(milliseconds: 150),
                                errorBuilder: (context, error) => Container(
                                  color: const Color(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.warning,
                                    color: Color(0xFF1E1E1E),
                                    size: 60.0,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: c1BoxSize(context),
                              child: ImageFade(
                                image: AssetImage(
                                  darkState
                                      ? 'assets/images/logos/bykakTextLogo_b.png'
                                      : 'assets/images/logos/bykakTextLogo_w.png',
                                ),
                                fit: BoxFit.fitWidth,
                                duration: const Duration(milliseconds: 900),
                                syncDuration: const Duration(milliseconds: 150),
                                errorBuilder: (context, error) => Container(
                                  color: const Color(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.warning,
                                    color: Color(0xFF1E1E1E),
                                    size: 60.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: widgetSize(context),
            padding: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    '2. 심볼마크',
                    style: TextStyle(
                      fontSize: h2FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
                // Text(
                //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ',
                //   style: TextStyle(
                //     fontSize: h5FontSize(context),
                //     color: blackColor,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: widgetSize(context),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            height: c1BoxSize(context),
                            child: Padding(
                              padding: const EdgeInsets.all(40),
                              child: ImageFade(
                                image: AssetImage(
                                  darkState
                                      ? 'assets/images/logos/bykakScissorLogo_w.png'
                                      : 'assets/images/logos/bykakScissorLogo_b.png',
                                ),
                                fit: BoxFit.contain,
                                duration: const Duration(milliseconds: 900),
                                syncDuration: const Duration(milliseconds: 150),
                                errorBuilder: (context, error) => Container(
                                  color: const Color(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.warning,
                                    color: Color(0xFF1E1E1E),
                                    size: 60.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            height: c1BoxSize(context),
                            color: blackColor,
                            child: Padding(
                              padding: const EdgeInsets.all(40),
                              child: ImageFade(
                                image: AssetImage(
                                  darkState
                                      ? 'assets/images/logos/bykakScissorLogo_b.png'
                                      : 'assets/images/logos/bykakScissorLogo_w.png',
                                ),
                                fit: BoxFit.contain,
                                duration: const Duration(milliseconds: 900),
                                syncDuration: const Duration(milliseconds: 150),
                                errorBuilder: (context, error) => Container(
                                  color: const Color(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.warning,
                                    color: Color(0xFF1E1E1E),
                                    size: 60.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: widgetSize(context),
            padding: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    '3. 브랜드 컬러',
                    style: TextStyle(
                      fontSize: h2FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
                // Text(
                //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ',
                //   style: TextStyle(
                //     fontSize: h5FontSize(context),
                //     color: blackColor,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    // width: widgetSize(context),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        Container(
                          width: c1BoxSize(context) - 20,
                          height: c1BoxSize(context) - 20,
                          decoration: BoxDecoration(
                            color: bykakColor,
                            borderRadius: BorderRadius.circular(500),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                '바이각 그린',
                                style: TextStyle(
                                  fontSize: h3FontSize(context),
                                  fontWeight: FontWeight.bold,
                                  color: bykakColor,
                                ),
                              ),
                            ),
                            Text(
                              'Hex : #205B48',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'RGB : (32, 91, 72)',
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ),
                            Text(
                              'CMYK : (65, 0, 21, 64)',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
