import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/screens/first_screen.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:image_fade/image_fade.dart';

class JemulpoClubPage extends StatefulWidget {
  const JemulpoClubPage({super.key});

  @override
  State<JemulpoClubPage> createState() => _JemulpoClubPageState();
}

class _JemulpoClubPageState extends State<JemulpoClubPage> {
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
              children: [
                JemulpoClubMain(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: JemulpoClubStudio(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: JemulpoClubFilming(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: JemulpoClubLocation(),
                ),
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

// ---------- JemulpoClub_Main -----------------------------------------------------------------------------------------------------
class JemulpoClubMain extends StatelessWidget {
  const JemulpoClubMain({super.key});

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
            'assets/images/background/jemulpo_club_bg.png',
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
                      'New JemulpoClub',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        fontFamily: 'Classic',
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
                        '신제물포구락부',
                        style: TextStyle(
                          fontSize: h2FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '신제물포구락부 관련멘트 삽입',
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: whiteColor,
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
                color: whiteColor,
                size: 72,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- JemulpoClub_Studio -----------------------------------------------------------------------------------------------------
class JemulpoClubStudio extends StatefulWidget {
  const JemulpoClubStudio({super.key});

  @override
  State<JemulpoClubStudio> createState() => _JemulpoClubStudioState();
}

class _JemulpoClubStudioState extends State<JemulpoClubStudio> {
  List imageList = [
    'assets/images/jemulpoClub/jemulpo_club_1.png',
    'assets/images/jemulpoClub/jemulpo_club_2.png',
    'assets/images/jemulpoClub/jemulpo_club_3.png',
    'assets/images/jemulpoClub/jemulpo_club_4.png',
    'assets/images/jemulpoClub/jemulpo_club_5.png',
    'assets/images/jemulpoClub/jemulpo_club_6.png',
    'assets/images/jemulpoClub/jemulpo_club_7.png',
    'assets/images/jemulpoClub/jemulpo_club_8.png',
    'assets/images/jemulpoClub/jemulpo_club_9.png',
    'assets/images/jemulpoClub/jemulpo_club_10.png',
    'assets/images/jemulpoClub/jemulpo_club_11.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            width: widgetSize(context),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: widgetSize(context),
                      child: fadeImage(imageList[0]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: widgetSize(context),
                        child: Center(
                          child: Text(
                            '신제물포구락부는 개화기의 역사를 담고 있는 인천 동인천에 위치한 구제물포구락부의 역사를 계승하고자 하여 설립되었습니다.',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 60,
                  ),
                  child: Column(
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.spaceBetween,
                        alignment: WrapAlignment.start,
                        spacing: 10,
                        runSpacing: 30,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width < 800
                                ? widgetSize(context)
                                : (widgetSize(context) / 2) - 7,
                            child: fadeImage(imageList[1]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width < 800
                                ? widgetSize(context)
                                : (widgetSize(context) / 2) - 7,
                            child: fadeImage(imageList[2]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: widgetSize(context),
                          child: Text(
                            '개화기 컨셉의 사진들과 의상들이 준비되어 있으며 사교클럽의 의미를 둔 구락부의 명칭처럼 다양한 문화공간이 될 수 있도록 준비한 김주현바이각의 신제물포구락부 스튜디오입니다.',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
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
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 60, right: 20),
          child: SizedBox(
            width: widgetSize(context),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: widgetSize(context),
                      child: fadeImage(imageList[3]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: widgetSize(context),
                        child: fadeImage(imageList[4]),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: widgetSize(context),
                    height: c1BoxSize(context) + 300,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                          PointerDeviceKind.trackpad,
                        },
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageList.length - 6,
                        itemBuilder: (context, index) {
                          return Container(
                            width: c1BoxSize(context) + 120,
                            // height: c1BoxSize(context) + 300,
                            margin: EdgeInsets.only(right: 20),
                            child: fadeImage(imageList[index + 5]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '개화기의 느낌이 나는 가구들과 소품뿐만 아니라 바이각에서 직접 제작한 맞춤양복들과 마네킹들이 인테리어 되어있습니다.',
                      style: TextStyle(
                        fontSize: h4FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  'Interior',
                  style: TextStyle(
                    fontSize: h2FontSize(context),
                    fontFamily: 'Classic',
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
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
                        child: fadeImage('assets/images/panorama.png'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: fadeImage('assets/images/panorama.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------- JemulpoClub_Filming -----------------------------------------------------------------------------------------------------
class JemulpoClubFilming extends StatelessWidget {
  const JemulpoClubFilming({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          children: [
            Text(
              'Filming',
              style: TextStyle(
                fontSize: h2FontSize(context),
                fontFamily: 'Classic',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: widgetSize(context),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width < 800
                                  ? widgetSize(context)
                                  : widgetSize(context) / 2 - 10,
                              height: c1BoxSize(context) + 100,
                              child: fadeImage(
                                  'assets/images/jemulpoClub/filming_2.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width < 800
                                    ? widgetSize(context)
                                    : widgetSize(context) / 2 - 10,
                                child: Text(
                                  '2019년부터 방영되었으며, 성황리에 종영된 tvN의 "사랑의 불시착" 촬영지로 알려지게 되었습니다.',
                                  style: TextStyle(
                                    fontSize: h5FontSize(context),
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width < 800
                                  ? widgetSize(context)
                                  : widgetSize(context) / 2 - 10,
                              height: c1BoxSize(context) + 100,
                              child: fadeImage(
                                  'assets/images/jemulpoClub/filming_1.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width < 800
                                    ? widgetSize(context)
                                    : widgetSize(context) / 2 - 10,
                                child: Text(
                                  '모든 촬영과 의상이 김주현바이각과 신제물포구락부와 함께한 가수 황인욱의 "이별주"의 뮤직비디오에 함께하였습니다.',
                                  style: TextStyle(
                                    fontSize: h5FontSize(context),
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}

// ---------- JemulpoClub_Location -----------------------------------------------------------------------------------------------------
class JemulpoClubLocation extends StatelessWidget {
  const JemulpoClubLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        width: widgetSize(context),
        child: Column(
          children: [
            Text(
              'Location',
              style: TextStyle(
                fontSize: h2FontSize(context),
                fontFamily: 'Classic',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: Column(
                children: [
                  Container(
                    width: widgetSize(context),
                    height: c1BoxSize(context) + 200,
                    color: blackColor,
                  ),
                  SizedBox(
                    width: widgetSize(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '신제물포구락부',
                                style: TextStyle(
                                  fontSize: h3FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                '인천광역시 미추홀구 석정로200 지하1층',
                                style: TextStyle(
                                  fontSize: h5FontSize(context),
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final url = Uri.parse(
                                  'https://map.naver.com/v5/entry/place/1462138545?lng=126.6574925&lat=37.4676344&placePath=%2Fhome%3Fentry=plt&c=15,0,0,0,dh',
                                );
                                if (await canLaunchUrl(url)) {
                                  launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              child: Icon(
                                Icons.map_outlined,
                                size: 32,
                                color: blackColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: '인천 미추홀구 석정로 200 지하1층',
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(
                                        child: Text('주소가 복사되었습니다.'),
                                      ),
                                      backgroundColor: bykakColor,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.copy,
                                  size: 32,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
