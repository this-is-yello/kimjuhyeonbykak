import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class RentalCenterPage extends StatefulWidget {
  const RentalCenterPage({super.key});

  @override
  State<RentalCenterPage> createState() => _RentalCenterPageState();
}

class _RentalCenterPageState extends State<RentalCenterPage> {
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
                RentalCenterMain(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: RentalIntroduce(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: RentalProduct(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: RentalCenterLocation(),
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

// ---------- RentalCenter_Main -----------------------------------------------------------------------------------------------------
class RentalCenterMain extends StatelessWidget {
  const RentalCenterMain({super.key});

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
            'assets/images/background/rental_center_bg.png',
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
                      'by 覺 Suit RentalCenter',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        fontFamily: 'NotoSerif',
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 20,
                      ),
                      child: Text(
                        '바이각 수트렌탈센터',
                        style: TextStyle(
                          fontSize: h2FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '그 날을 위한 자신감, 바이각',
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

// ---------- RentalCenter_Introduce -----------------------------------------------------------------------------------------------------
class RentalIntroduce extends StatefulWidget {
  const RentalIntroduce({super.key});

  @override
  State<RentalIntroduce> createState() => _RentalIntroduceState();
}

class _RentalIntroduceState extends State<RentalIntroduce> {
  List rentalImage = [
    'assets/images/rentalCenter/rental_center_1.png',
    'assets/images/rentalCenter/rental_center_2.png',
    'assets/images/rentalCenter/rental_center_3.png'
  ];
  List rentalText = [
    '바이각 수트렌탈센터는 300벌 이상의 렌탈복과 100평대 규모의 인천 최초/최대의 정장렌탈 전문샵입니다.',
    '웨딩, 혼주복, 면접, 데일리등으로 그 날에 걸맞은 다양한 수트를 경험하세요.',
    '다양한 수트와 자켓들을 입어보며, 올바른 옷 입기와 자기갖춤에 큰 도움이 되시리라 강하게 믿습니다.',
    // 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  ];

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
            SizedBox(
              width: widgetSize(context),
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                verticalDirection: VerticalDirection.down,
                alignment: WrapAlignment.start,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width < 800
                        ? widgetSize(context)
                        : widgetSize(context) / 2,
                    height: c1BoxSize(context) + 100,
                    child: fadeImage(rentalImage[0]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width < 800
                        ? widgetSize(context)
                        : widgetSize(context) / 2 - 20,
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Text(
                            '그 날을 위한 자신감, 바이각',
                            style: TextStyle(
                              fontSize: h3FontSize(context),
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          ),
                        ),
                        Text(
                          '바이각 수트렌탈센터는 300벌 이상의 렌탈복과 100평대 규모의 인천 최초/최대의 정장렌탈 전문샵입니다.',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            '웨딩, 혼주복, 면접, 데일리등으로 그 날에 걸맞은 다양한 수트를 경험하세요.',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ),
                        Text(
                          '다양한 수트와 자켓들을 입어보며, 올바른 옷 입기와 자기갖춤에 큰 도움이 되시리라 강하게 믿습니다.',
                          style: TextStyle(
                            fontSize: h4FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //
            // ------------------------------------------------------------
            // Padding(
            //   padding: const EdgeInsets.only(top: 40),
            //   child: SizedBox(
            //     width: widgetSize(context),
            //     child: Text(
            //       rentalText[3],
            //       style: TextStyle(
            //         fontSize: h4FontSize(context),
            //         color: blackColor,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// ---------- RentalCenter_Product -----------------------------------------------------------------------------------------------------
class RentalProduct extends StatelessWidget {
  const RentalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: widgetSize(context),
        // height: 800,
        child: Column(
          children: [
            Text(
              'Product',
              style: TextStyle(
                fontSize: h2FontSize(context),
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(
                width: widgetSize(context),
                child: GridView.builder(
                  // 사진이 추가될 때 마다 숫자 바꿔야 함?
                  itemCount: 22,
                  shrinkWrap: true,
                  controller: ScrollController(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width < 800
                        ? 2
                        : MediaQuery.of(context).size.width < 1240
                            ? 3
                            : 4,
                    childAspectRatio: 1 / 1.2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: fadeImage(
                          'assets/images/rentalProducts/product_${index + 1}.png'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- RentalCenter_Location -----------------------------------------------------------------------------------------------------
class RentalCenterLocation extends StatelessWidget {
  const RentalCenterLocation({super.key});

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
                fontFamily: 'NotoSerif',
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
                    child: InkWell(
                      onTap: () async {
                        final url = Uri.parse(
                          'https://map.naver.com/v5/entry/place/1943136667?c=16,0,0,0,dh',
                        );
                        if (await canLaunchUrl(url)) {
                          launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: fadeImage(
                          'assets/images/locations/rental_center_map.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: widgetSize(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '바이각 수트렌탈센터',
                              style: TextStyle(
                                fontSize: h3FontSize(context),
                                color: blackColor,
                              ),
                            ),
                            Text(
                              '인천광역시 미추홀구 숙골로43번길 158-19 3층',
                              style: TextStyle(
                                fontSize: h5FontSize(context),
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final url = Uri.parse(
                                  'https://map.naver.com/v5/entry/place/1943136667?c=16,0,0,0,dh',
                                );
                                if (await canLaunchUrl(url)) {
                                  launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.map_outlined,
                                    size: h2FontSize(context),
                                    color: blackColor,
                                  ),
                                  Text(
                                    '지도보기',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: '인천광역시 미추홀구 숙골로43번길 158-19',
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
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.copy,
                                      size: h2FontSize(context),
                                      color: blackColor,
                                    ),
                                    Text(
                                      '주소복사',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: blackColor,
                                      ),
                                    ),
                                  ],
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
