import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kimjuhyeonbykak/style.dart';
import 'package:kimjuhyeonbykak/navigation.dart';

import 'package:countup/countup.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:video_player/video_player.dart';

class TailorShopPage extends StatefulWidget {
  const TailorShopPage({super.key});

  @override
  State<TailorShopPage> createState() => _TailorShopPageState();
}

class _TailorShopPageState extends State<TailorShopPage> {
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
                TailorShopMain(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: Shops(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: Label(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: CountUpText(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: MakingProcess(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width < 800 ? 120 : 160,
                  ),
                  child: Service(),
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

// ---------- Tailor_Shop_Main -----------------------------------------------------------------------------------------------------
class TailorShopMain extends StatelessWidget {
  const TailorShopMain({super.key});

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
            'assets/images/tailorShop_bg.png',
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
                      'k!mjuhyeon by 覺',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        fontFamily: 'Cafe_24',
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        '김주현바이각',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '전통과 정통을 바느질하다.',
                      style: TextStyle(
                        fontSize: h6FontSize(context),
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

// ---------- Video_&_Shops -----------------------------------------------------------------------------------------------------
class Shops extends StatefulWidget {
  const Shops({super.key});

  @override
  State<Shops> createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  late VideoPlayerController _videoController;

  jemulpoShop() {
    return Column(
      children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/images/shop_jemulpo.png',
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '제물포 본점',
                        style: TextStyle(
                          fontSize: 24,
                          color: whiteColor,
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
          padding: EdgeInsets.all(16),
          color: whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 20),
                child: Container(
                  width: double.infinity,
                  height: c1BoxSize(context) + 40,
                  color: blackColor,
                ),
              ),
              SizedBox(
                child: Text(
                  '김주현바이각 제물포 본점',
                  style: TextStyle(
                    fontSize: h4FontSize(context),
                    color: blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  child: Text(
                    '인천시 미추홀구 석정로 200 1층',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  '제물포 본점은 마스터테일러와 재단팀들이 상주해 있으며,\n지하에 작업하는 아뜰리에가 존재하고 있습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: h6FontSize(context),
                    color: blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '예약하기',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  songdoShop() {
    return Column(
      children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/images/shop_songdo.png',
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: Text(
                    '인천 송도점',
                    style: TextStyle(
                      fontSize: 24,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          color: whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 20),
                child: Container(
                  width: double.infinity,
                  height: c1BoxSize(context) + 40,
                  color: blackColor,
                ),
              ),
              SizedBox(
                child: Text(
                  '김주현바이각 송도점',
                  style: TextStyle(
                    fontSize: h4FontSize(context),
                    color: blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  child: Text(
                    '인천시 연수구 송도동 20-22 푸르지오월드마크 1단지',
                    style: TextStyle(
                      fontSize: h5FontSize(context),
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  '인천송도점은 스타일링 서비스와 화려하고 트렌디한\n김주현바이각만의 색을 입힌 퍼포먼스 스토어입니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: h6FontSize(context),
                    color: blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '예약하기',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://www.dropbox.com/scl/fi/1kbrnreieqydx7xqw0n1p/atelier_video.mp4?rlkey=xkf4u5o0a4d5o89lsrbnbsbrl&dl=0',
      ),
    )..initialize().then(
        (_) {
          // if (this.mounted) {
          setState(
            () {
              WidgetsBinding.instance.addPersistentFrameCallback(
                (_) {
                  _videoController.setVolume(0);
                  _videoController.play();
                  _videoController.setLooping(true);
                },
              );
            },
          );
          //   }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            width: widgetSize(context),
            height: widgetSize(context) - 300,
            child: _videoController.value.isInitialized
                ? Container(
                    width: widgetSize(context),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: _videoController.value.size?.width ??
                            widgetSize(context),
                        height: _videoController.value.size?.height ?? 300,
                        child: AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: blackColor,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  '직영 아뜰리에',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: widgetSize(context),
                    child: Text(
                      '단추 하나, 깃 하나로도 고객을 감동시키는 수트를 만들기 위해 40년 이상의 경력을 가진 7명의 장인을 직접 모셨습니다. 김주현바이각은 인천에서 유일하게 매장 내 수제 공방을 운영하며 비스포크 맞춤 수트의 정석을 구현하고 있습니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: h6FontSize(context),
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: SizedBox(
              width: widgetSize(context),
              child: MediaQuery.of(context).size.width < 800
                  ? Column(
                      children: [
                        jemulpoShop(),
                        songdoShop(),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: jemulpoShop(),
                        ),
                        Expanded(
                          flex: 1,
                          child: songdoShop(),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Black_Label_&_White_Label -----------------------------------------------------------------------------------------------------
class Label extends StatefulWidget {
  const Label({super.key});

  @override
  State<Label> createState() => _LabelState();
}

class _LabelState extends State<Label> {
  List blackLabelTexts = [
    '효율성을 배제한 장인정신이 깃든 "30"\n김주현바이각 Black Label',
    '온전히 장인정신에 입각한 수 만번의 손 바느질',
    '김주현바이각의 헤리티지 브랜드 Black Label은 효율성을 배제한\n오직 맞춤슈트의 품질만을 생각하는 브랜드로서 특별한 고객만을 위한 매달 30벌의 수트만을 지어드리고 있습니다\n온전히 손 바느질만으로 완성되는 Black Label은 국내 및 세계의 다양하고 우수한 원단과 양질의 부자재들을 사용하고 있습니다.\n\n김주현바이각 Black Label의 주 고객들은 자신을 사랑하고, 자신감 넘치며 성공적인 삶을 사는 남성분들입니다.',
    '"시대 흐름을 초월한\n변치않는 클래식"',
    '수트는 시대를 초월해 남성을 가장 잘 표현할 수 있는 의복입니다.\n아들에게도 물려줄 수 있는 맞춤수트를 지어드리는 것이 우리의 변치않는 수트철학입니다.',
  ];
  List whiteLabelTexts = [
    '트렌디하고 스타일쉬한\n김주현바이각 White label',
    '보다 간편히, 보다 트렌디한 수트',
    '김주현바이각의 매스티지 브랜드 White label은 고유의 비스포크 방식은 유지, 트렌디하고 컴포터블한 세퍼레잇 컬렉션을 전개합니다.\n스웨이드, 레더, 니트웨어 등 다양한 제품군을 선보이며 공정과정을 간략화 함으로써 부담없이 즐기실 수 있는 브랜드입니다.\n\n김주현바이각 White label은 여타 공장에서 제작되어진 브랜드 수트와 격이 다른 품위와 편안함을 느껴보실 수 있습니다.',
    '"Suit In Wity"',
    '각박한 빌딩 숲, 똑같은 비즈니스 수트, 그 안에서 우리의 위트를 찾습니다.\n“입어서 즐거운 옷”  이것이 바로 White label의 철학입니다. Wity는 Wit와 City의 합성어입니다.',
  ];

  List fabrics = [
    'assets/images/fabrics/fabric_1.jpg',
    'assets/images/fabrics/fabric_2.jpg',
    'assets/images/fabrics/fabric_3.jpg',
    'assets/images/fabrics/fabric_4.jpg',
    'assets/images/fabrics/fabric_5.jpg',
    'assets/images/fabrics/fabric_6.jpg',
    'assets/images/fabrics/fabric_7.jpg',
    'assets/images/fabrics/fabric_8.jpg',
    'assets/images/fabrics/fabric_9.jpg',
    'assets/images/fabrics/fabric_10.jpg',
    'assets/images/fabrics/fabric_11.jpg',
    'assets/images/fabrics/fabric_12.jpg',
    'assets/images/fabrics/fabric_13.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Text(
            'Label',
            style: TextStyle(
              fontSize: h1FontSize(context),
              fontFamily: 'Cafe_24',
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 40,
            ),
            child: Container(
              width: widgetSize(context),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/blacklabel_bg.png',
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blackLabelTexts[0],
                    style: TextStyle(
                      fontSize: h2FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      blackLabelTexts[1],
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    blackLabelTexts[2],
                    style: TextStyle(
                      fontSize: h7FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Text(
              blackLabelTexts[3],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: h2FontSize(context),
                color: blackColor,
              ),
            ),
          ),
          SizedBox(
            width: widgetSize(context),
            child: Text(
              blackLabelTexts[4],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: h6FontSize(context),
                color: blackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              width: widgetSize(context),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/whitelabel_bg.png',
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    whiteLabelTexts[0],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: h2FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      whiteLabelTexts[1],
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: h5FontSize(context),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    whiteLabelTexts[2],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: h7FontSize(context),
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Text(
              whiteLabelTexts[3],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: h2FontSize(context),
                color: blackColor,
              ),
            ),
          ),
          SizedBox(
            width: widgetSize(context),
            child: Text(
              whiteLabelTexts[4],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: h6FontSize(context),
                color: blackColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: SizedBox(
              width: widgetSize(context),
              height: c1BoxSize(context) + 16,
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
                  itemCount: fabrics.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: c1BoxSize(context),
                      height: c1BoxSize(context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: blackColor,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Image.asset(
                        fabrics[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Counting_Text -----------------------------------------------------------------------------------------------------
class CountUpText extends StatelessWidget {
  const CountUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '총 ',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                  color: blackColor,
                ),
              ),
              SizedBox(
                width: c3BoxSize(context) + 16,
                child: Countup(
                  begin: 0,
                  end: 5981,
                  duration: const Duration(milliseconds: 3000),
                  separator: ',',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
              ),
              Text(
                '벌 제작',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                  color: blackColor,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '총 ',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    color: blackColor,
                  ),
                ),
                SizedBox(
                  width: c1BoxSize(context) + 48,
                  child: Countup(
                    begin: 0,
                    end: 59804019,
                    duration: const Duration(milliseconds: 4000),
                    separator: ',',
                    style: TextStyle(
                      fontSize: h1FontSize(context),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                Text(
                  '번의 바느질',
                  style: TextStyle(
                    fontSize: h3FontSize(context),
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '총 ',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                  color: blackColor,
                ),
              ),
              SizedBox(
                width: c2BoxSize(context) + 20,
                child: Countup(
                  begin: 0,
                  end: 592119,
                  duration: const Duration(milliseconds: 3500),
                  separator: ',',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
              ),
              Text(
                '의 제작시간',
                style: TextStyle(
                  fontSize: h3FontSize(context),
                  color: blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------- Making_Process -----------------------------------------------------------------------------------------------------
class MakingProcess extends StatefulWidget {
  const MakingProcess({super.key});

  @override
  State<MakingProcess> createState() => _MakingProcessState();
}

class _MakingProcessState extends State<MakingProcess> {
  List makingEnTitle = [
    'Take the Size',
    'Making Pattern',
    'Fitting',
    'Completion',
  ];
  List makingKoTitle = [
    '1. 채촌',
    '2. 패턴',
    '3. 가봉',
    '4. 수트 완성',
  ];
  List makingSub = [
    '상담을 통해 고객님의 라이프스타일, 활용도에 맞는\n완벽한 수트를 위한 정밀 측정을 진행합니다.',
    '측정된 사이즈를 바탕으로 한 분만을 위한\n몸에 꼭 맞는 패턴이 완성됩니다.\n이 속에서 고급스러운 원단에 김주현바이각만의\n노하우가 더해져 여타 기성복 수트와는\n차원이 다른 멋을 보여줍니다.',
    '장인들의 손 끝에서 고객에게 가장 편하고\n우아한 실루엣을 구현할 수 있습니다.\n수십 년의 경험과 기술을 겸비한\n마스터 테일러가 완벽한 맞춤 수트를 위해\n디테일까지 섬세한 주의를 기울입니다.',
    '우리가 생각하는 진정한 수트는 장인의\n정성스러운 손바느질을 거쳐 개인의 개성과\n스타일을 구현한 수트라고 생각합니다.\n이러한 과정 속에서 만들어진 우리의 수트를\n경험한다면 분명 말보단 몸이 먼저 느낄 것 입니다.',
  ];

  List makingProcess = [
    'assets/images/making_process/make_process_2.jpg',
    'assets/images/making_process/make_process_3.jpg',
    'assets/images/making_process/make_process_4.jpg',
    'assets/images/making_process/make_process_5.jpg',
  ];

  makingPic(context, i) {
    return Container(
      width: c1BoxSize(context) + 160,
      height: c1BoxSize(context) + 160,
      child: Image.asset(
        makingProcess[i],
        fit: BoxFit.cover,
      ),
    );
  }

  makingText(context, i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          makingEnTitle[i],
          style: TextStyle(
            fontSize: h2FontSize(context),
            color: blackColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
          ),
          child: Text(
            makingKoTitle[i],
            style: TextStyle(
              fontSize: h4FontSize(context),
              color: blackColor,
            ),
          ),
        ),
        Text(
          makingSub[i],
          style: TextStyle(
            fontSize: h6FontSize(context),
            color: blackColor,
          ),
        ),
      ],
    );
  }

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
              'Making Process',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontFamily: 'Cafe_24',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: SizedBox(
                width: widgetSize(context),
                child: Column(
                  children: [
                    MediaQuery.of(context).size.width < 800
                        ? Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  makingPic(context, 0),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 40,
                                    ),
                                    child: makingText(context, 0),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  makingPic(context, 1),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 40,
                                    ),
                                    child: makingText(context, 1),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  makingPic(context, 2),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 40,
                                    ),
                                    child: makingText(context, 2),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  makingPic(context, 3),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: makingText(context, 3),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  makingPic(context, 0),
                                  Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: makingText(context, 0),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 60),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 40),
                                      child: makingText(context, 1),
                                    ),
                                    makingPic(context, 1),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 60),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    makingPic(context, 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 40),
                                      child: makingText(context, 2),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 60),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 40),
                                      child: makingText(context, 3),
                                    ),
                                    makingPic(context, 3),
                                  ],
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
    );
  }
}

// ---------- Service -----------------------------------------------------------------------------------------------------
servicePic(context) {
  return Image.asset(
    'assets/images/service_2.png',
    fit: BoxFit.fitWidth,
  );
}

serviceText(context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: blackColor,
                width: 3,
              ),
            ),
          ),
          child: Text(
            '김주현바이각 기본 서비스',
            style: TextStyle(
              fontSize: h1FontSize(context),
              color: blackColor,
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: blackColor,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: Text(
            '1. 보타이를 웨딩촬영이나 예식날 대여해 드립니다.',
            style: TextStyle(
              fontSize: h6FontSize(context),
              color: blackColor,
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: blackColor,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: Text(
            '2. 예식 후 평상복으로 입으실 수 있게 라펠을 교체해드립니다.',
            style: TextStyle(
              fontSize: h6FontSize(context),
              color: blackColor,
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: blackColor,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: Text(
            '3. 예식 후 원하시면 단추를 교체해드립니다.',
            style: TextStyle(
              fontSize: h6FontSize(context),
              color: blackColor,
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: blackColor,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: Text(
            '4. 김주현바이각 예복 진행시 고급맞춤셔츠를 제작해드립니다.',
            style: TextStyle(
              fontSize: h6FontSize(context),
              color: blackColor,
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: blackColor,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: Text(
            '5. Lorem Ipsum is simply dummy text',
            style: TextStyle(
              fontSize: h6FontSize(context),
              color: blackColor,
            ),
          ),
        ),
      ),
    ],
  );
}

class Service extends StatelessWidget {
  const Service({super.key});

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
              'Service',
              style: TextStyle(
                fontSize: h1FontSize(context),
                fontFamily: 'Cafe_24',
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: SizedBox(
                width: widgetSize(context),
                child: MediaQuery.of(context).size.width < 800
                    ? Column(
                        children: [
                          servicePic(context),
                          Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: serviceText(context),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: servicePic(context),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: serviceText(context),
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
